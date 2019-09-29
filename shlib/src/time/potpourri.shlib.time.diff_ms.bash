source potpourri.shlib.str.splice.bash

shlib.time.diff_ms() {
	local -i x=$1
	local -i y=$2
	local tmp

	tmp=$(((y - x) / 1000000))
	if ((${#tmp} < 4)); then
		tmp=0000$tmp
	fi
	tmp=$(shlib.str.splice "$tmp" $((${#tmp} - 3)) 0 '.')
	LC_ALL=C printf '%.3f\n' "$tmp"
}
