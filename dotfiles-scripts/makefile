DEPS := $(wildcard $(PROJECT_ROOT)/shlib/src/**/*.bash $(PROJECT_ROOT)/git-scripts/src/lib/*.bash)
LIB_MODULES := src/lib/potpourri.dotfileslib.globalvar.bash
BIN_MODULES := backup-cmos \
	backup-junk \
	dotfiles
SHELLCHECK_IGNORE := src/lib/potpourri.dotfileslib.globalvar.bash
NO_TEST := 1

include ../tools/cfg/hyperborea.mk
