# Import the latest Python docker image
FROM python:3.10.13-bullseye

# Create the user "lab3"
RUN useradd -ms /bin/bash lab3
WORKDIR /home/lab3

# Setup project dependencies
COPY requirements.txt /home/lab3/
RUN python3 -m venv /home/lab3/venv
RUN . /home/lab3/venv/bin/activate && pip3 install -r /home/lab3/requirements.txt

# Move lab code over to container during building
COPY Lab03/secml_malware /home/lab3/secml_malware/
COPY Lab03/padding_attack.py /home/lab3/
COPY Lab03/slack_attack.py /home/lab3/
