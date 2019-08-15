FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer="Satoshi HASEGAWA <shasegawa@yourinventit.com>" \
      description="Pandoc environment to generate Japanese PDF document."

RUN apt-get --yes update \
    && apt-get --yes upgrade \
    && apt-get install --yes wget zlib1g libghc-digest-prof \
    && apt-get install --yes texlive-xetex texlive-lang-japanese texlive-lang-cjk texlive-fonts-recommended texlive-fonts-extra \
    && apt-get install --yes pandoc \
    && apt-get install --yes cabal-install \
    && cabal update \
    && cabal install --global pandoc-crossref \
    && mkdir -p /root/.pandoc/templates \
    && wget https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/master/eisvogel.tex -O /root/.pandoc/templates/eisvogel.latex

VOLUME ["/workspace"]
WORKDIR /workspace
