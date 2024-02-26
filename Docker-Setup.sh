#!/bin/bash

# Build Docker image for lab
docker build -t lab3 .

# Create a container instance of that image.
docker run -it --entrypoint /bin/bash --user lab3 --memory="4g" lab3
