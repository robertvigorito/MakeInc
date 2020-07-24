# ---------------------------------------------------
# MakeInc
# ---------------------------------------------------
include ./include/MakeScripts
# ---------------------------------------------------
# Intro
# ---------------------------------------------------

AUTHER			= Robert Vigorito
PACKAGE			= make-inc
VERSION 		= 0.0.1
DESCRIPTION 	= Make include functions for dcc makefile

# ---------------------------------------------------
# Test
# ---------------------------------------------------

# Test copy script, make a directory called .build and from there copy the scripts file
# into script with executable permission

# Find Script

SCRIPTS.ROOT = ./test

# This could be a find function
SCRIPTS.FILES = $(shell find $(SCRIPTS.ROOT) -type f -name "*")


.PHONY: test all install

all: clean test

clean:
	@echo Cleaning the .build directory
	@rm -f -r .build

install: 
	$(eval TEMP=$(shell echo /software/scripts/$(PACKAGE)/ | tr A-Z a-z))
	@echo Installing scripts to $(TEMP)
	@rm -r -f $(TEMP)
	@mkdir -p $(TEMP)
	@install -v -m 555 $(SCRIPTS.FILES) $(TEMP)

test:
	@mkdir -p .build/scripts
	install -m 555 -v $(SCRIPTS.FILES) .build/scripts/
