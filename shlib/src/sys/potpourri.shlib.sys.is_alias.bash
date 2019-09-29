source potpourri.shlib.sys.get_type.bash

shlib.sys.is_alias() {
	local -r name=$1

	if [[ $(shlib.sys.get_type "$name") == alias ]]; then
		return 0
	fi
	return 1
}
