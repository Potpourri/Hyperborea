shlib.array.shift() {
	local -n arrRef=$1
	# shellcheck disable=SC2034
	local x
	local -n varRef=${2:-x}

	# shellcheck disable=SC2034
	varRef=${arrRef[0]}
	arrRef=("${arrRef[@]:1}")
}
