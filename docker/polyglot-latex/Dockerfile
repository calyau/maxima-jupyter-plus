FROM calyau/maxima-jupyter-polyglot:latest

USER root
RUN pacman -Syu --noconfirm inkscape pandoc texlive-core texlive-latexextra
# XXX why isn't this working?
#USER ${NB_USER}
USER oubiwann