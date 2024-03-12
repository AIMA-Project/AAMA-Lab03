# Import the latest Python docker image
FROM python:3.10.13-bullseye

ENTRYPOINT /bin/bash

WORKDIR /lab3

# Setup project dependencies
# Requirements are split across two layers to prevent long-running pip installs from having to be
# performed every time there's a change to the project requirements
COPY resources/stage1_requirements.txt .
RUN pip3 install -r stage1_requirements.txt
COPY resources/stage2_requirements.txt .
RUN pip3 install -r stage2_requirements.txt

# Move lab code over to container during building
COPY resources/secml_malware secml_malware/.
COPY resources/padding_attack.py .
COPY resources/slack_attack.py .

# Get rid of empty files used to force directory detection in git
RUN rm "secml_malware/data/goodware_samples/benign files go here" "secml_malware/data/malware_samples/malware goes here"
