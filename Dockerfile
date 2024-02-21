# Import the latest Python docker image
FROM python:latest

# Create the user "lab3"
RUN useradd -ms /bin/bash lab3
WORKDIR /home/lab3

# Move lab code over to container during building
COPY Lab03/seml_malware /home/lab3/seml_malware/
COPY Lab03/padding_attack.py /home/lab3/
COPY Lab03/slack_attack.py /home/lab3/
