shlib.io.readline() {
	local line

	if IFS='' read -r line || [[ -n $line ]]; then
		echo "$line"
	else
		return 1
	fi
}
