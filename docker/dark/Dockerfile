FROM calyau/maxima-jupyter:latest

USER root
RUN pacman -Syu --noconfirm python-pip && \
    pip install jupyterthemes && \
    jt -t onedork
# XXX why isn't this working?
#USER ${NB_USER}
USER oubiwann