#!/bin/bash

set -a # automatically export all variables
source $1
set +a

docker run --rm -v $PROJECT:/home/latex/project latex-docker_texlive pdflatex $DOCUMENT
