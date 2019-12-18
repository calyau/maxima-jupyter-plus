VERSION = 1.0.0
D_ORG = calyau
D_LATEX_PROJ = maxima-jupyter-latex
D_LATEX_DIR = ./docker/latex
D_PROJ_DARK = maxima-jupyter-plus-dark
USER = oubiwann

default: latex-image

#############################################################################
###   LaTeX Support   #######################################################
#############################################################################

latex-image:
	@docker build --build-arg NB_USER=$(USER) --tag $(D_ORG)/$(D_LATEX_PROJ) $(D_LATEX_DIR)
	@docker tag $(D_ORG)/$(D_LATEX_PROJ) $(D_ORG)/$(D_LATEX_PROJ):latest

latex-tag:
	@docker tag $(D_ORG)/$(D_LATEX_PROJ) $(D_ORG)/$(D_LATEX_PROJ):$(VERSION)

latex-push:
	@docker push $(D_ORG)/$(D_LATEX_PROJ):latest
	@docker push $(D_ORG)/$(D_LATEX_PROJ):$(VERSION)

latex-release: latex-tag latex-push

latex-bash:
	@docker run --entrypoint=bash -it $(D_ORG)/$(D_LATEX_PROJ):latest
