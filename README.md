# maxima-jupyter-plus

*[maxima-jupyter][maxima-jupyter] with additions*

[![][logo]][logo-large]

## About

This project provides the following additional features on top of the excellent
[maxima-jupyter][maxima-jupyter] project:

* A Common Lisp kernel along with the Maxima and Python kernels
* Dark-themed notebook support
* LaTeX install for PDF-download support from running notebooks (PDF files are 
  formatted as standard technical/research articles)
* Inkscape (SVG, PDF support)
* A "polyglot" image that contains Jupyter notebook support for Python,
  Maxima, Common Lisp, Clojure, and Go kernels

Forthcoming features may be viewed here: 
* https://github.com/calyau/maxima-jupyter-plus/issues

## Catalog of Docker Images

The following images generated by this project are available on Docker Hub
(sizes are also given):

* [calyau/maxima-jupyter-latex][maxima-jupyter-latex] - 5.12 GB
* [calyau/maxima-jupyter-dark][maxima-jupyter-dark] - 3.85 GB
* [calyau/maxima-jupyter-dark-latex][maxima-jupyter-dark-latex] - 5.36 GB
* [calyau/maxima-jupyter-cl][maxima-jupyter-cl] - 2.04 GB
* [calyau/maxima-jupyter-polyglot][maxima-jupyter-polyglot] - 4.92 GB

Note that the Docker image for the standard `maxima-jupyter` weighs in at
~2 GB.

## Usage

Run with LaTeX support:

```shell
docker run -it \
    -v `pwd`/notebooks:/home/oubiwann/maxima-jupyter/examples \
    -p 8888:8888 \
    calyau/maxima-jupyter-latex:latest \
    notebook --ip=0.0.0.0 --port=8888
```

Run with dark theme support:

```shell
docker run -it \
    -v `pwd`/notebooks:/home/oubiwann/maxima-jupyter/examples \
    -p 8888:8888 \
    calyau/maxima-jupyter-dark:latest \
    notebook --ip=0.0.0.0 --port=8888
```

Run with dark theme + latex support:

```shell
docker run -it \
    -v `pwd`/notebooks:/home/oubiwann/maxima-jupyter/examples \
    -p 8888:8888 \
    calyau/maxima-jupyter-dark-latex:latest \
    notebook --ip=0.0.0.0 --port=8888
```

Run with Common Lisp (SBCL), Maxima, and Python kernels:

```shell
docker run -it \
    -v `pwd`/notebooks:/home/oubiwann/maxima-jupyter/examples \
    -p 8888:8888 \
    calyau/maxima-jupyter-cl:latest \
    notebook --ip=0.0.0.0 --port=8888
```

Run with Common Lisp (SBCL), Maxima, Clojure, Go, and Python kernels:

```shell
docker run -it \
    -v `pwd`/notebooks:/home/oubiwann/maxima-jupyter/examples \
    -p 8888:8888 \
    calyau/maxima-jupyter-polyglot:latest \
    notebook --ip=0.0.0.0 --port=8888
```

## Notes

### Docker Images Sizes

The images generated by this repo are very large, due to the additional
dependencies that are pulled in. As such, these images are not intended for
general use, but rather for the special cases where Docker image size is
a secondary concern to the primary needs addressed by the additional 
features.

### LaTeX Support

When creating aligned equations in Markdown text, be careful: MathJAX (used by
Jupyter for web-based LaTeX support) adds LaTeX and this can cause Pandoc to
exit with an error when attempting to download a PDF of the notebook. In 
particular, it is recommended that aligned equations be declared in the 
Markdown cells as the following:

```latex
$$\begin{split}
\frac {d x}{d t} & = s(y - x) \\
\frac {d y}{d t} & = rx - y - xz \\
\frac {d x}{d t} & = xy - bz \\
\end{split}$$
```

Note the absence of `{align}` or `{equation}` blocks. 

<!-- Named page links below: /-->

[logo]: https://avatars0.githubusercontent.com/u/24504053?s=200&v=4
[logo-large]: https://avatars0.githubusercontent.com/u/24504053?v=4
[maxima-jupyter]: https://github.com/robert-dodier/maxima-jupyter
[maxima-jupyter-latex]: https://hub.docker.com/r/calyau/maxima-jupyter-latex
[maxima-jupyter-dark]: https://hub.docker.com/r/calyau/maxima-jupyter-dark
[maxima-jupyter-dark-latex]: https://hub.docker.com/r/calyau/maxima-jupyter-dark-latex
[maxima-jupyter-cl]: https://hub.docker.com/r/calyau/maxima-jupyter-cl
[maxima-jupyter-polyglot]: https://hub.docker.com/r/calyau/maxima-jupyter-polyglot
