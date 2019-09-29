shlib.array.includes_glob() {
	local -r match=${*: -1}
	local x

	for x in "${@:1:$#-1}"; do
		# shellcheck disable=SC2053
		if [[ $x == $match ]]; then
			return 0
		fi
	done
	return 1
}
