source potpourri.shlib.bool.bash
source potpourri.shlib.io.symlink_deref.bash
source potpourri.shlib.path.normalize.bash

shlib.io.symlink_fullderef() {
	local path="$1"
	local realpath=''

	while [[ "$path" != '.' && "$path" != '/' ]]; do
		if [[ -L "$path" ]]; then
			path="$(shlib.io.symlink_deref "$path" "$shlib_TRUE")"
		fi
		realpath="$(basename "$path")/$realpath"
		path="$(dirname "$path")"
	done
	realpath="$path/$realpath"
	realpath="$(shlib.path.normalize "$realpath")"
	echo "$realpath"
}
