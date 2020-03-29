# ---------------------------------------------------
# MakeInc
# ---------------------------------------------------
# include ./include/MakeScripts
# ---------------------------------------------------
# Intro
# ---------------------------------------------------

AUTHER			= Robert Vigorito
VERSION 		= 0.0.1
DESCRIPTION 	= Make include functions for dcc makefile

# ---------------------------------------------------
# Test
# ---------------------------------------------------

# Test copy script, make a directory called .build and from there copy the scripts file
# into script with executable permission

# Find Script

SCRIPTS.ROOT = ./test
SCRIPTS.FILES = $(shell find $(SCRIPTS.ROOT) -type f -name "*")


.PHONY: test all install

test:
	@mkdir -p .build/scripts
	install -m 555 $(SCRIPTS.FILES) .build/scripts/ ; \

all: clean test
	@echo do something

clean:
	echo Cleaning the .build directory
	@rm -f -r .build
