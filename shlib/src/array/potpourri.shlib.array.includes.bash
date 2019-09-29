shlib.array.includes() {
	local -r match=${*: -1}
	local x

	for x in "${@:1:$#-1}"; do
		if [[ $x == "$match" ]]; then
			return 0
		fi
	done
	return 1
}
