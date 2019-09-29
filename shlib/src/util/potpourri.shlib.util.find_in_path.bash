source potpourri.shlib.str.split.bash
source potpourri.shlib.array.filter_out.bash

shlib.util.find_in_path() {
	local -r file=$1
	local -r paths=${2:-$PATH}
	local -a result

	shlib.str.split "$paths" ':' result
	shlib.array.filter_out result ''
	find "${result[@]}" -maxdepth 1 -type f -name "$file" -print -quit 2>/dev/null
}
