EMACS ?= emacs
EMACS_VERSION :="27.2"

all: test
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

test:
	nix-build nix/emacs-${EMACS_VERSION}.nix --run '${emacs}/bin/emacs --batch -q -l company-tailwindcss.el -l ert-runner'

compile: deps
	nix-build nix/emacs-${EMACS_VERSION}.nix --run '${emacs}/bin/emacs --batch -q -L . -f batch-byte-compile company-tailwindcss.el'

clean-elc:
	rm -f company-tailwindcss.elc

.PHONY:	all test docs unit
