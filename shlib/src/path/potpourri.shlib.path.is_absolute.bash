shlib.path.is_absolute() {
	local -r path=$1

	if [[ $path == /* ]]; then
		return 0
	fi
	return 1
}
