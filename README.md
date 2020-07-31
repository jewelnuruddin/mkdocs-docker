# README(WIP)

Here I will create a docker images and when I run container from that image it will display static page build by MkDocs tools.
I use docker because do not want to install MkDocs tool locally, also I keep project_dir locally so that I can change file and can manage version control.

#### Table of contents

1. [About MkDocs](#mkdocs)
2. [Pre Requirements](#requirements)
3. [Limitation](#limitation)
4. [How to run](#run)
5. [Nutshell](#nutshell)

## About MkDocs

MkDocs is fast and simple static site generator, you can host anywhere you choose.
For details please vist site [MkDocs](https://www.mkdocs.org/#mkdocs)

## Pre Requirements

I assume you will run this project locally so to creating docker image and container you must have to prepare your environment for docker.
Here I do not describe how to install/prepare your environment for docker. Hope you already have that, if not then please prepare otherwise this project will not run.


## Limitation

I did not tested it anywhere else, so there might be arise some issues like Dockerfile definition or inside bash script.

## How to run


First of all need to build image,

Image name can be anything as you like

```
docker build -t image_name .
```

Use wrapper script `mkdocs.sh` for passing arguments to container
from command line.

wrapper script `mkdocs.sh` take 3 options each time I execute it.

Options:

`-p produce` is for produce contents by MkDocs, `-p` take only "produce" value

`-s serve` this will read contents which I created by produce and start service internally by

MkDocs and we can browse that static page locally by "http://localhost:8000", `-s` take only "serve" value

`-l project_dir` name of local directory, I keep the local directory in my project root directory.

`-n image_name`, please use the same image_name, when we build image.

So wrapper script run like

To create contents
```
./mkdocs.sh -p produce -l my_dir -n image_name
```

To serve contents for browser
```
./mkdocs.sh -s serve -l my_dir -n image_name
```
Now you should be able to browse
http://localhost:8000

## Nutshell

So in a nutshell, if you execute the following command step by step

and exactly as it is, then you will be able to browse

http://localhost:8000

```
# Create image
docker build -t image_name .

# Build contents
./mkdocs.sh -p produce -l project_dir -n image_name

# Serve contents for browser
./mkdocs.sh -s serve -l project_dir -n image_name
```

## NOTE
Its only for test purpose and very simple, may be in future I will optimize it.
