shlib.util.sponge() {
	local -r file=${1:-}
	local -a arr

	mapfile -t arr
	if [[ -n $file ]]; then
		: >"$file"
		for line in "${arr[@]}"; do
			echo "$line" >>"$file"
		done
	else
		for line in "${arr[@]}"; do
			echo "$line"
		done
	fi
}
