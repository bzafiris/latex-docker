FROM ubuntu:xenial

ARG USER_NAME=latex
ARG USER_HOME=/home/latex
ARG USER_ID=1000
ARG USER_GECOS=LaTeX

RUN adduser \
  --home "$USER_HOME" \
  --uid $USER_ID \
  --gecos "$USER_GECOS" \
  --disabled-password \
  "$USER_NAME"

ARG WGET=wget
ARG GIT=git
ARG MAKE=make
#ARG PANDOC=pandoc
#ARG PCITEPROC=pandoc-citeproc
#ARG PYGMENTS=python3-pygments
#ARG FIG2DEV=fig2dev
#ARG JRE=default-jre-headless

RUN apt-get update && apt-get install -y \
  # some auxiliary tools
  "$WGET" \
  "$GIT" \
  "$MAKE" \
  # markup format conversion tool
  #"$PANDOC" \
  #"$PCITEPROC" \
  # XFig utilities
  #"$FIG2DEV" \
  # syntax highlighting package
  #"$PYGMENTS" \
  # Java runtime environment (e.g. for arara)
  #"$JRE" && \
  # Removing documentation packages *after* installing them is kind of hacky,
  # but it only adds some overhead while building the image.
  && apt-get --purge remove -y .\*-doc$ && \
  # Remove more unnecessary stuff
  apt-get clean -y

ADD distr/install-tl-unx.tar.gz /install-tl-unx
ADD distr/texlive.profile /install-tl-unx/texlive.profile
WORKDIR /install-tl-unx

RUN ./install-tl-20200621/install-tl --profile=texlive.profile

ENV PATH="/home/latex/texlive/bin/x86_64-linux:${PATH}"

WORKDIR /home/latex/project

RUN tlmgr install multirow mdframed zref needspace

ADD scripts /home/latex/scripts