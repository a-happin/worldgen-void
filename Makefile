OUTDIR=./build
OUTDIR_DATAPACKS=$(OUTDIR)/datapacks
OUTDIR_RESOURCEPACKS=$(OUTDIR)/resourcepacks

PROJECT_NAME=$(shell basename $(shell realpath ..))
GIT_TAG=$(shell git describe --tags --abbrev=0 --always)
TARGET=$(OUTDIR)/$(PROJECT_NAME)_$(GIT_TAG).zip

DATAPACKS=$(shell fd --hidden --exclude .git --max-depth 2 --type file --glob pack.mcmeta --exec sh -c '[ -d "{//}/data" ] && printf "%s\n" "{//}"')
RESOURCEPACKS=$(shell fd --hidden --exclude .git --max-depth 2 --type file --glob pack.mcmeta --exec sh -c '[ -d "{//}/assets" ] && printf "%s\n" "{//}"')
README=$(shell [ -f README.md ] && printf "README.md\n")

all: $(TARGET)

$(TARGET): clean | $(addprefix $(OUTDIR_DATAPACKS)/,$(addsuffix .zip,$(DATAPACKS))) $(addprefix $(OUTDIR_RESOURCEPACKS)/,$(addsuffix .zip,$(RESOURCEPACKS))) $(addprefix $(OUTDIR)/,$(README))
	@[ -e $(OUTDIR_RESOURCEPACKS)/resources.zip ] && mv -v $(OUTDIR_RESOURCEPACKS)/resources.zip $(OUTDIR_RESOURCEPACKS)/$(PROJECT_NAME).zip || :
	(cd $(OUTDIR); zip -r $(notdir $@) datapacks resourcepacks README.md)

$(OUTDIR):
	mkdir -p $@

$(OUTDIR_DATAPACKS):
	mkdir -p $@

$(OUTDIR_RESOURCEPACKS):
	mkdir -p $@

$(OUTDIR_DATAPACKS)/%.zip: $(OUTDIR_DATAPACKS) | %/data %/pack.mcmeta
	(cd $*; zip -r ../$@ *)

$(OUTDIR_RESOURCEPACKS)/%.zip: $(OUTDIR_RESOURCEPACKS) | %/assets %/pack.mcmeta
	(cd $*; zip -r ../$@ *)

resources.zip: resources/assets resources/pack.mcmeta
	(cd ./resources; zip -r ../../resources.zip *)

$(OUTDIR)/README.md: README.md
	cp -f README.md $@

clean:
	rm -rfv $(OUTDIR_DATAPACKS)/* $(OUTDIR_RESOURCEPACKS)/*

print:
	@echo PROJECT_NAME=$(PROJECT_NAME)
	@echo GIT_TAG=$(GIT_TAG)
	@echo TARGET=$(TARGET)
	@echo DATAPACKS=$(DATAPACKS)
	@echo RESOURCEPACKS=$(RESOURCEPACKS)
	@echo README=$(README)

.PHONY: all clean print resources.zip
