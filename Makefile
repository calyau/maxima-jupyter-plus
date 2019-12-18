VERSION = 1.0.0
D_ORG = calyau
USER = oubiwann

default: all

all: latex-image dark-image dark-latex-image cl-image
release-all: latex-release dark-release dark-latex-release cl-release

#############################################################################
###   LaTeX Support   #######################################################
#############################################################################

D_PROJ_LATEX = maxima-jupyter-latex
D_DIR_LATEX = ./docker/latex

latex-image:
	@docker build --build-arg NB_USER=$(USER) \
	--tag $(D_ORG)/$(D_PROJ_LATEX) $(D_DIR_LATEX)
	@docker tag $(D_ORG)/$(D_PROJ_LATEX) $(D_ORG)/$(D_PROJ_LATEX):latest

latex-tag:
	@docker tag $(D_ORG)/$(D_PROJ_LATEX) $(D_ORG)/$(D_LATEX_PROJ):$(VERSION)

latex-push:
	@docker push $(D_ORG)/$(D_PROJ_LATEX):latest
	@docker push $(D_ORG)/$(D_PROJ_LATEX):$(VERSION)

latex-release: latex-tag latex-push

latex-bash:
	@docker run --entrypoint=bash -it $(D_ORG)/$(D_PROJ_LATEX):latest

#############################################################################
###   Dark Support   ########################################################
#############################################################################

D_PROJ_DARK = maxima-jupyter-dark
D_DIR_DARK = ./docker/dark

dark-image:
	@docker build --build-arg NB_USER=$(USER) \
	--tag $(D_ORG)/$(D_PROJ_DARK) $(D_DIR_DARK)
	@docker tag $(D_ORG)/$(D_PROJ_DARK) $(D_ORG)/$(D_PROJ_DARK):latest

dark-tag:
	@docker tag $(D_ORG)/$(D_PROJ_DARK) $(D_ORG)/$(D_PROJ_DARK):$(VERSION)

dark-push:
	@docker push $(D_ORG)/$(D_PROJ_DARK):latest
	@docker push $(D_ORG)/$(D_PROJ_DARK):$(VERSION)

dark-release: dark-image dark-tag dark-push

dark-bash:
	@docker run --entrypoint=bash -it $(D_ORG)/$(D_PROJ_DARK):latest

#############################################################################
###   Dark LaTeX Support   ##################################################
#############################################################################

D_PROJ_DARK_LATAEX = maxima-jupyter-dark-latex
D_DIR_DARK_LATEX = ./docker/dark-latex

dark-latex-image:
	@docker build --build-arg NB_USER=$(USER) \
	--tag $(D_ORG)/$(D_PROJ_DARK_LATAEX) $(D_DIR_DARK_LATEX)
	@docker tag $(D_ORG)/$(D_PROJ_DARK_LATAEX) $(D_ORG)/$(D_PROJ_DARK_LATAEX):latest

dark-latex-tag:
	@docker tag $(D_ORG)/$(D_PROJ_DARK_LATAEX) $(D_ORG)/$(D_PROJ_DARK_LATAEX):$(VERSION)

dark-latex-push:
	@docker push $(D_ORG)/$(D_PROJ_DARK_LATAEX):latest
	@docker push $(D_ORG)/$(D_PROJ_DARK_LATAEX):$(VERSION)

dark-latex-release: dark-latex-image dark-latex-tag dark-latex-push

dark-latex-bash:
	@docker run --entrypoint=bash -it $(D_ORG)/$(D_PROJ_DARK_LATAEX):latest

#############################################################################
###   Common Lisp Support   #################################################
#############################################################################

D_PROJ_CL = maxima-jupyter-cl
D_DIR_CL = ./docker/common-lisp

cl-image:
	@git clone https://github.com/fredokun/cl-jupyter.git $(D_DIR_CL)/cl-jupyter
	@docker build --build-arg NB_USER=$(USER) \
	--tag $(D_ORG)/$(D_PROJ_CL) $(D_DIR_CL)
	@docker tag $(D_ORG)/$(D_PROJ_CL) $(D_ORG)/$(D_PROJ_CL):latest
	@rm -rf $(D_DIR_CL)/cl-jupyter

cl-tag:
	@docker tag $(D_ORG)/$(D_PROJ_CL) $(D_ORG)/$(D_PROJ_CL):$(VERSION)

cl-push:
	@docker push $(D_ORG)/$(D_PROJ_CL):latest
	@docker push $(D_ORG)/$(D_PROJ_CL):$(VERSION)

cl-release: cl-tag cl-push

cl-bash:
	@docker run --entrypoint=bash -it $(D_ORG)/$(D_PROJ_CL):latest
