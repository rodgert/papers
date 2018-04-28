.PHONY: help clean html deploy

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html       to make standalone HTML files"
	@echo "  deploy     to deploy to github.io"

clean:
	rm -rf $(BUILDDIR)/*

html:
	bikeshed update
	find ./source/ -name "*.bs" -type f | xargs -I{} -t -n1 bikeshed spec {}
	mv ./source/*.html $(BUILDDIR)/html/
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/html."

deploy: clean html
	./deploy.sh
