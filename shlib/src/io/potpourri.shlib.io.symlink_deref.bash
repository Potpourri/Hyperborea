source potpourri.shlib.bool.bash
source potpourri.shlib.path.is_relative.bash
source potpourri.shlib.path.normalize.bash

shlib.io.symlink_deref() {
	local path=$1
	local -r doRec=${2:-$shlib_FALSE}
	local parent

	if [[ ! -L $path ]]; then
		return 1
	fi

	while [[ -L $path && $(ls -l "$path") =~ -\>\ (.*) ]]; do
		parent=$(dirname "$path")
		path=${BASH_REMATCH[1]}
		((!doRec)) && break
		if shlib.path.is_relative "$path"; then
			path="$parent/$path"
		fi
	done
	shlib.path.normalize "$path"
}
