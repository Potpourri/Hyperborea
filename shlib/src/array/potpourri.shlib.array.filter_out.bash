shlib.array.filter_out() {
	# shellcheck disable=SC2178
	local -n arrRef=$1
	local -r match=$2
	local -a tmp
	local x

	for x in "${arrRef[@]}"; do
		if [[ $x != "$match" ]]; then
			tmp+=("$x")
		fi
	done
	arrRef=("${tmp[@]}")
}
