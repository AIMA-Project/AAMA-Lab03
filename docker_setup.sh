#!/bin/bash

# Build Docker image for lab
sudo docker build -t lab03 .

# Create a container instance of that image.
sudo docker run -it --name lab3 lab03
