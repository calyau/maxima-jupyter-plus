# maxima-jupyter-plus

*[maxima-jupyter][maxima-jupyter] with additions*

[![][logo]][logo-large]

## About

This project provides the following additional features on top of the excellent
[maxima-jupyter][maxima-jupyter] project:

* LaTeX install for PDF-download support from running notebooks (PDF files are 
  formatted as standard technical/research articles)
* Inkscape (SVG, PDF support)

Forthcoming features may be viewed here: 
* https://github.com/calyau/maxima-jupyter-plus/issues

## Usage

### From Docker

TBD

## Notes

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