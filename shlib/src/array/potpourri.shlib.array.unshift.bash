shlib.array.unshift() {
	local -n arrRef=$1
	local -r x=$2

	arrRef=("$x" "${arrRef[@]}")
}
