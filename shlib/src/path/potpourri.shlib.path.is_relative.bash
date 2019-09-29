shlib.path.is_relative() {
	local -r path=$1

	if [[ $path =~ ^[^[:space:]/].* ]]; then
		return 0
	fi
	return 1
}
