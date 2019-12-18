VERSION = 1.0.0
D_ORG = calyau
D_PROJ = maxima-jupyter-plus
D_DIR = ./docker/plus
D_PROJ_DARK = maxima-jupyter-plus-dark
USER = oubiwann

default: docker-image

docker-image:
	@docker build --build-arg NB_USER=$(USER) --tag $(D_ORG)/$(D_PROJ) $(D_DIR)
	@docker tag $(D_ORG)/$(D_PROJ) $(D_ORG)/$(D_PROJ):latest

docker-release:
	@docker tag $(D_ORG)/$(D_PROJ) $(D_ORG)/$(D_PROJ):$(VERSION)

docker-bash:
	@docker run --entrypoint=bash -it $(D_ORG)/$(D_PROJ):latest
