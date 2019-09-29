shlib.array.includes_re() {
	local -r regex=${*: -1}
	local x

	for x in "${@:1:$#-1}"; do
		if [[ $x =~ $regex ]]; then
			return 0
		fi
	done
	return 1
}
