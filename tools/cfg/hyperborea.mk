SHELL := bash
BASH_BUNDLER ?= bash-bundler
DEPS ?= $(wildcard $(PROJECT_ROOT)/shlib/src/**/*.bash)

.PHONY: inject-docopt-parser bundle build clean test static-analysis style-lint
all: build

ifdef BIN_MODULES
# Docopt stage:
build/%.docopted: src/%
	@mkdir -p build &&\
	<$< docopt.sh --line-length 100 - >$@
inject-docopt-parser: $(patsubst %,build/%.docopted,$(BIN_MODULES))
	@bashfnx potpourri.shlib.console.success "Inject docopt.sh parser complete."

# Bash-bundler stage:
build/%.bundled: build/%.docopted $(LIB_MODULES) $(DEPS)
	@$(BASH_BUNDLER) $< $@
bundle: $(patsubst %,build/%.bundled,$(BIN_MODULES))
	@bashfnx potpourri.shlib.console.success "Bundle complete."

# Final build stage:
bin/%: build/%.bundled
	@mkdir -p bin &&\
	cp $< $@ &&\
	chmod +x $@
build: $(patsubst %,bin/%,$(BIN_MODULES))
	@bashfnx potpourri.shlib.console.success "Build complete."

clean:
	@$(RM) -r build/ bin/
else
inject-docopt-parser: ;
bundle: ;
build: ;
clean: ;
endif

ifndef NO_TEST
test: $(patsubst %,bin/%,$(BIN_MODULES))
	@bats --recursive test/
else
test: ;
endif

static-analysis:
	@shellcheck --check-sourced --external-sources \
		$(patsubst %,src/%,$(BIN_MODULES)) \
		$(filter-out $(SHELLCHECK_IGNORE),$(LIB_MODULES)) &&\
	bashfnx potpourri.shlib.console.success "Static analysis complete."

style-lint:
	@declare -i exitCode=0 ;\
	shfmt -d $(SHFMT_OPTS) $(patsubst %,src/%,$(BIN_MODULES)) $(LIB_MODULES) || exitCode=$$? ;\
	cspell --config $(PROJECT_ROOT)/tools/cfg/cspell.json \
		$(patsubst %,src/%,$(BIN_MODULES)) \
		$(LIB_MODULES) \
		README.org || exitCode=$$? ;\
	if [[ $$exitCode == 0 ]]; then \
		bashfnx potpourri.shlib.console.success "Style linting complete." ;\
	else \
		exit "$$exitCode" ;\
	fi
