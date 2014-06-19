REPO_ASSERT := $(shell git config --get remote.origin.url)
REPO ?= $(REPO_ASSERT)
GHPAGES = gh-pages

default: $(GHPAGES)

$(GHPAGES):
	git clone "$(REPO)" "$(GHPAGES)"
	(cd $(GHPAGES) && git checkout $(GHPAGES)) || (cd $(GHPAGES) && git checkout --orphan $(GHPAGES) && git rm -rf .)
	cd $(GHPAGES) && git rm -r ./*
	cp -r _site/* $(GHPAGES)