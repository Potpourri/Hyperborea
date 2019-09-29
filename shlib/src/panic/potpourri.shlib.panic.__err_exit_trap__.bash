source potpourri.shlib.bool.bash
source potpourri.shlib.panic.__print_stacktrace__.bash
source potpourri.shlib.__globalvar__.bash

trap 'shlib.panic.__err_exit_trap__ ERR' ERR
trap 'shlib.panic.__err_exit_trap__ EXIT' EXIT

shlib.panic.__err_exit_trap__() {
	local -r exitCode=$?
	local -r cmd=$BASH_COMMAND
	# disable xtrace`s tracing before print our stack trace
	set +o xtrace

	local -r sig=$1
	local -r docopt_exit=$'eval "$(docopt "$@")"'

	if [[ $exitCode == 0 || -f $shlib__ERR_CAUGHT_FLAG__ || $cmd == *$docopt_exit* ]]; then
		if [[ $sig == EXIT ]]; then
			rm -f "$shlib__ERR_CAUGHT_FLAG__"
		fi
		exit "$exitCode"
	fi
	shlib.panic.__print_stacktrace__ 1 "$cmd" "$exitCode"
	if [[ $sig == ERR ]]; then
		touch "$shlib__ERR_CAUGHT_FLAG__"
	fi
	exit "$exitCode"
}
