FROM calyau/maxima-jupyter-latex:latest

USER root
RUN pacman -Syu --noconfirm python-pip && \
    pip install jupyterthemes && \
    jt -t onedork
# XXX why isn't this working?
#USER ${NB_USER}
USER oubiwann