FROM calyau/maxima-jupyter-cl:latest

USER root
ENV GOPATH /home/oubiwann/go
COPY clojure /clojure-setup

# Root operations: install Java, Go, and deps; install Clojure & Clojupyter
RUN pacman -Syu --noconfirm jdk11-openjdk go go-tools imagemagick && \
    curl -O https://download.clojure.org/install/linux-install-1.10.1.492.sh  && \
    chmod +x linux-install-1.10.1.492.sh && \
    ./linux-install-1.10.1.492.sh && \
    cd /clojure-setup && \
    clojure -A:depstar -m hf.depstar.uberjar clojupyter-standalone.jar && \
    chown -R oubiwann .

USER oubiwann

# Perform user operations: Setup Clojupyter; setup gophernotes
RUN cd /clojure-setup && \
    clojure -m clojupyter.cmdline install --ident clj --jarfile clojupyter-standalone.jar && \
    clojure -m clojupyter.cmdline list-installs && \
    env GO111MODULE=on go get github.com/gopherdata/gophernotes && \
    mkdir -p ~/.local/share/jupyter/kernels/gophernotes && \
    cd ~/.local/share/jupyter/kernels/gophernotes && \
    cp "$(go env GOPATH)"/pkg/mod/github.com/gopherdata/gophernotes@v0.6.1/kernel/*  "." && \
    chmod 644 kernel.json && \
    sed "s|gophernotes|$(go env GOPATH)/bin/gophernotes|" < kernel.json.in > kernel.json
