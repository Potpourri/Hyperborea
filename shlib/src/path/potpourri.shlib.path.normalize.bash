source potpourri.shlib.bool.bash
source potpourri.shlib.str.split.bash
source potpourri.shlib.array.join.bash
source potpourri.shlib.path.is_absolute.bash

shlib.path.normalize() {
	local -r path=$1
	local -a result parts
	local isAbsolute part normalized

	if shlib.path.is_absolute "$path"; then
		isAbsolute=$shlib_TRUE
	else
		isAbsolute=$shlib_FALSE
	fi

	shlib.str.split "$path" '/' result
	for part in "${result[@]}"; do
		case "$part" in
		.)
			# drop self link '.'
			;;
		..)
			if ((${#parts[@]} > 0)) && [[ ${parts[-1]} != ".." ]]; then
				unset -v "parts[-1]"
			else
				if ((!isAbsolute)); then
					parts+=("..")
				fi
				# drop parent link '..' in start of absolute path
			fi
			;;
		*)
			if [[ -n $part ]]; then
				parts+=("$part")
			fi
			# drop double slashes '//'
			;;
		esac
	done

	if ((isAbsolute)); then
		normalized='/'
	fi
	normalized+=$(shlib.array.join "${parts[@]}" '/')
	echo "$normalized"
}
