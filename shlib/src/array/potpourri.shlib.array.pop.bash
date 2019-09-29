shlib.array.pop() {
	# shellcheck disable=SC2178
	local -n arrRef=$1
	# shellcheck disable=SC2034
	local x
	local -n varRef=${2:-x}

	# shellcheck disable=SC2034
	varRef=${arrRef[-1]}
	unset -v "arrRef[-1]"
}
