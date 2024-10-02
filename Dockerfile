# Import the latest Python docker image
FROM python:3.10.13-bullseye

CMD ["/bin/bash"]
SHELL [ "/bin/bash", "-c" ]


# == Lab User ==========================================================================================================
# Create a new user for the lab
RUN useradd -ms /bin/bash aama
WORKDIR /home/aama/


# == Install APT Packages ==============================================================================================
RUN apt update && apt install nano vim -y


# == Python Dependencies ===============================================================================================
# Dependencies are split into two stages to attempt to reduce Docker layer rebuild time if a dependency changes
# Stage 1: Base Python dependencies
COPY resources/stage1_requirements.txt ./
RUN pip3 install -r stage1_requirements.txt

# Stage 2: SecML
COPY resources/stage2_requirements.txt ./
RUN pip3 install -r stage2_requirements.txt


# == Lab Code ==========================================================================================================
# Move lab code over to container during building
COPY resources/secml_malware ./secml_malware
COPY resources/padding_attack.py ./
COPY resources/slack_attack.py ./

# == Clean Up ==========================================================================================================
RUN chown -R aama:aama /home/aama/*
USER aama
# Get rid of empty files used to force directory detection in git
RUN rm "secml_malware/data/goodware_samples/benign files go here" "secml_malware/data/malware_samples/malware goes here"
RUN rm stage1_requirements.txt
RUN rm stage2_requirements.txt
