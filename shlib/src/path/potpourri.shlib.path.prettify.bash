shlib.path.prettify() {
	local -r path=$1

	echo "${path/#$HOME/\~}"
}
