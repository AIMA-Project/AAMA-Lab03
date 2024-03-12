# AI-Assisted Malware Analysis Lab 03: Adversarial Machine Learning

## Warning
Due to concerns relating to computer security and legality, no malware or malcious code is distributed as part of this
lab. It is left as an exercise to the instructor or student to seek out a sufficiently-large dataset for use with the
lab. There are a number of (ironically) reputable malware distributors that can be found with a simple Internet search.

By using any part of this lab, you acknowledge the threat to your privacy and device security, and you are to take sole
responsibility for any consequences resulting from this. This includes, but is not limited to, damage to devices and
systems, loss of data, and compromised security and/or privacy.

Please check your local laws as well to ensure obtaining malware is legal in your jurisdiction.

As the saying goes: _"Caveat emptor, quia ignorare non debult quod jus alienum emit."_


## Preinstallation
This lab requires Docker to be installed on the machine running it. Instructions for installing Docker on various
platforms can be found on their website:
- [Windows](https://docs.docker.com/desktop/install/windows-install/)
- [Mac](https://docs.docker.com/desktop/install/mac-install/)
- [Linux](https://docs.docker.com/desktop/install/linux-install/)

Docker Desktop is not needed so long as the command line tools are installed. However, it may be useful to have a GUI
to Docker for managing containers and images.

Once Docker is installed, the lab image can either be downloaded from Docker Hub or built from the repository's files.
See the below section for more information.


## Building Lab Images
**It is important to note that Linux users will have to run Docker commands as root or using the `sudo` command!**

A pre-built image is available on [Docker Hub](https://hub.docker.com/r/wheelercs/aama-lab03) if you wish to skip the
building process. This image is automatically built, so it stays up to date with the repository. A set of directions is
provided by Docker Hub to pull and run the image.

Building the image requires Docker to be installed and running on the user's computer. These instructions are
applicable to both Windows and Linux operating systems. To assist with building, "docker_setup.ps1" (Windows) and
"docker_setup.sh" (Linux) have be provided to automatically build and run the lab container.


## Running Lab 3
Lab 3 requires a relatively large set of goodware and malware to be obtained as part of adversarial sample generation.
Malware can easily be obtained online from a number of websites (see the warning above).

Finding or generating large sets of goodware can be more difficult. If you have access to a machine running Windows,
there are a number of system executable files that can be found in "C:\Windows". You can search your entire operating
system for executable files by navigating to the root ("C:\") and entering the string `*.exe` in the search in the upper
right-hand corner.

Searching may take some time to complete, depending on the number of files on your system and the type of storage medium
that is used (HDD, SSD). Once the search is complete, any number of files can be taken from this list and used as part
of the lab. **Be sure to copy (not move) the files.** You may need administrator rights to access some of the files.


## Future Access
Accessing Docker can vary depending on the IDE and operating system you use. Visual Studio Code has a number of plugins
that make accessing a Docker container fairly straightforward.

Without any plugins or GUI, accessing an already existing container requires first starting it in the background, then
attaching a terminal session to it.

```
$ docker start lab3
$ docker attach lab3
```


## Deleting Containers
Running a new container under the name "lab3" requires deletion of the old one. This can be done by simply deleting the
container using Docker's command line tools.

```
$ docker container rm lab3
```

After this, the `docker run` command provided as part of the lab's scripting can be ran again to generate a fresh
container instance.
