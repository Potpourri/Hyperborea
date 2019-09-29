source potpourri.shlib.sys.get_type.bash

shlib.sys.is_function() {
	local -r name=$1

	if [[ $(shlib.sys.get_type "$name") == function ]]; then
		return 0
	fi
	return 1
}
