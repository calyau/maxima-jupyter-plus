VERSION = 1.0.0
D_ORG = calyau
USER = oubiwann

default: all

all: latex-image dark-image dark-latex-image cl-image polyglot-image polyglot-latex-image polyglot-dark-latex-image
release-all: latex-release dark-release dark-latex-release cl-release polyglot-release polyglot-latex-release polyglot-dark-latex-release

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
	@docker tag $(D_ORG)/$(D_PROJ_LATEX) $(D_ORG)/$(D_PROJ_LATEX):$(VERSION)

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

#############################################################################
###   Polyglot Support   ####################################################
#############################################################################

D_PROJ_POLYG = maxima-jupyter-polyglot
D_DIR_POLYG = ./docker/polyglot

polyglot-image:
	@docker build --build-arg NB_USER=$(USER) \
	--tag $(D_ORG)/$(D_PROJ_POLYG) $(D_DIR_POLYG)
	@docker tag $(D_ORG)/$(D_PROJ_POLYG) $(D_ORG)/$(D_PROJ_POLYG):latest

polyglot-tag:
	@docker tag $(D_ORG)/$(D_PROJ_POLYG) $(D_ORG)/$(D_PROJ_POLYG):$(VERSION)

polyglot-push:
	@docker push $(D_ORG)/$(D_PROJ_POLYG):latest
	@docker push $(D_ORG)/$(D_PROJ_POLYG):$(VERSION)

polyglot-release: polyglot-tag polyglot-push

polyglot-bash:
	@docker run --entrypoint=bash -it $(D_ORG)/$(D_PROJ_POLYG):latest

#############################################################################
###   Polyglot LaTeX Support   ##############################################
#############################################################################

D_PROJ_POLYG_LATEX = maxima-jupyter-polyglot-latex
D_DIR_POLYG_LATEX = ./docker/polyglot-latex

polyglot-latex-image:
	@docker build --build-arg NB_USER=$(USER) \
	--tag $(D_ORG)/$(D_PROJ_POLYG_LATEX) $(D_DIR_POLYG_LATEX)
	@docker tag $(D_ORG)/$(D_PROJ_POLYG_LATEX) $(D_ORG)/$(D_PROJ_POLYG_LATEX):latest

polyglot-latex-tag:
	@docker tag $(D_ORG)/$(D_PROJ_POLYG_LATEX) $(D_ORG)/$(D_PROJ_POLYG_LATEX):$(VERSION)

polyglot-latex-push:
	@docker push $(D_ORG)/$(D_PROJ_POLYG_LATEX):latest
	@docker push $(D_ORG)/$(D_PROJ_POLYG_LATEX):$(VERSION)

polyglot-latex-release: polyglot-latex-tag polyglot-latex-push

polyglot-latex-bash:
	@docker run --entrypoint=bash -it $(D_ORG)/$(D_PROJ_POLYG_LATEX):latest

#############################################################################
###   Polyglot Dark LaTeX Support   #########################################
#############################################################################

D_PROJ_POLYG_DARK_LATEX = maxima-jupyter-polyglot-dark-latex
D_DIR_POLYG_DARK_LATEX = ./docker/polyglot-dark-latex

polyglot-dark-latex-image:
	@docker build --build-arg NB_USER=$(USER) \
	--tag $(D_ORG)/$(D_PROJ_POLYG_DARK_LATEX) $(D_DIR_POLYG_DARK_LATEX)
	@docker tag $(D_ORG)/$(D_PROJ_POLYG_DARK_LATEX) $(D_ORG)/$(D_PROJ_POLYG_DARK_LATEX):latest

polyglot-dark-latex-tag:
	@docker tag $(D_ORG)/$(D_PROJ_POLYG_DARK_LATEX) $(D_ORG)/$(D_PROJ_POLYG_DARK_LATEX):$(VERSION)

polyglot-dark-latex-push:
	@docker push $(D_ORG)/$(D_PROJ_POLYG_DARK_LATEX):latest
	@docker push $(D_ORG)/$(D_PROJ_POLYG_DARK_LATEX):$(VERSION)

polyglot-dark-latex-release: polyglot-dark-latex-tag polyglot-dark-latex-push

polyglot-dark-latex-bash:
	@docker run --entrypoint=bash -it $(D_ORG)/$(D_PROJ_POLYG_DARK_LATEX):latest