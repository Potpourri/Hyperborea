source potpourri.shlib.sys.get_type.bash

shlib.sys.is_keyword() {
	local -r name=$1

	if [[ $(shlib.sys.get_type "$name") == keyword ]]; then
		return 0
	fi
	return 1
}
