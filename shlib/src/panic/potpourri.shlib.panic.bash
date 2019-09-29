source potpourri.shlib.bool.bash
source potpourri.shlib.console.error.bash
source potpourri.shlib.console.info.bash
source potpourri.shlib.panic.__print_stacktrace__.bash
source potpourri.shlib.__globalvar__.bash

shlib.panic() {
	# disable shlib.panic.__err_exit_trap__
	trap - ERR EXIT

	local msg="panic!"
	local cmd="shlib.panic"
	local -i exitCode=1
	local stackTrace=$shlib_FALSE
	local -i frameStart=1
	local arg

	for arg; do
		case "$arg" in
		msg=*)
			msg=${arg#msg=}
			;;
		cmd=*)
			cmd=${arg#cmd=}
			;;
		exitCode=*)
			exitCode=${arg#exitCode=}
			;;
		stackTrace=*)
			stackTrace=${arg#stackTrace=}
			;;
		frameStart=*)
			frameStart=${arg#frameStart=}
			;;
		*)
			shlib.console.error "shlib.panic: wrong argument '$arg'"
			shlib.console.info "supported: msg=<str>, exitCode=<byte>, stackTrace=<bool>"
			shlib.panic.__print_stacktrace__ "$frameStart" "shlib.panic" 1
			exit 1
			;;
		esac
	done

	shlib.console.error "$msg"
	if ((stackTrace || shlib__DEBUG__)); then
		shlib.panic.__print_stacktrace__ "$frameStart" "$cmd" "$exitCode"
		touch "$shlib__ERR_CAUGHT_FLAG__"
	fi
	exit "$exitCode"
}
