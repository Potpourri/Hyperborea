shlib.array.join() {
	local -r sep=${*: -1}
	local str

	str=$(printf "%s$sep" "${@:1:$#-1}")
	echo "${str%$sep}"
}
