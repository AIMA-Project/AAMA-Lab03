#!/bin/bash

# Build Docker image
docker build -t lab03 .

# Create container for lab image
docker run -it --name lab3 lab03
