.PHONY: clean
REPO_ASSERT := $(shell git config --get remote.origin.url)
REPO ?= $(REPO_ASSERT)
GHPAGES = gh-pages

default: $(GHPAGES)

site: site.hs
	ghc --make -threaded "$<"

_site: site
	./"$<" rebuild

$(GHPAGES): _site
	git clone "$(REPO)" "$(GHPAGES)"
	(cd $(GHPAGES) && git checkout $(GHPAGES)) || (cd $(GHPAGES) && git checkout --orphan $(GHPAGES) && git rm -rf .)
	cd $(GHPAGES) && git rm -r ./*
	cp -r _site/* $(GHPAGES)
	cd $(GHPAGES) && git add .

clean:
	rm -rf $(GHPAGES)
	rm -rf site
	rm -rf _site