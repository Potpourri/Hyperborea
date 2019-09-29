source potpourri.shlib.console.error.bash

shlib.panic.__print_stacktrace__() {
	# disable shlib.panic.__err_exit_trap__
	trap - ERR EXIT

	# hide the shlib.panic.__print_stacktrace__() call
	local -r frameStart=$(($1 + 1))
	local -r frameEnd=${#BASH_SOURCE[@]}
	local -r cmd=$2
	local -r exitCode=$3
	local i=0
	local j=0

	shlib.console.error "command '$cmd' exited with exit code $exitCode."
	echo "Stack trace (most recent call first):" >&2
	for ((i = frameStart; i < frameEnd; i++)); do
		j=$((i - 1))
		local function=${FUNCNAME[$i]}
		local file=${BASH_SOURCE[$i]}
		local line=${BASH_LINENO[$j]}
		echo "   $function() in $file:$line" >&2
	done
}
