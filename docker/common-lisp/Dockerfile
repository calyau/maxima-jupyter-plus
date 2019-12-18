FROM calyau/maxima-jupyter:latest

COPY cl-jupyter /cl-jupyter
RUN python /cl-jupyter/install-cl-jupyter.py && \
    sbcl --load /cl-jupyter/cl-jupyter.lisp && \
    cp /cl-jupyter/about-cl-jupyter.ipynb /home/oubiwann/maxima-jupyter/examples/ && \
    echo quit | jupyter-console --no-confirm-exit --kernel=lisp --ZMQTerminalInteractiveShell.kernel_timeout=240
#RUN rm -rf /cl-jupyter

CMD ["console"]
ENTRYPOINT ["jupyter"]
