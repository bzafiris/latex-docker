#!/bin/bash
# Requires as argument a properties file with environment variables:
# PROJECT: absolute project path
# DOCUMENT: the main tex file of the project

set -a # automatically export all variables
source $1
set +a

docker run --rm -v $PROJECT:/home/latex/project latex-docker_texlive bibtex $DOCUMENT
