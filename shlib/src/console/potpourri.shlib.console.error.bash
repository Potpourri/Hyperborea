source fidian.ansi.bash
source mrowa44.emojify.bash

shlib.console.error() {
	local -r msg=$1
	local icon

	icon=$(emojify.token ":heavy_multiplication_x:")
	icon=${icon:0:1}
	echo "$(ansi::red)${icon}ERROR:$(ansi::resetForeground) $msg" >&2
}
