source fidian.ansi.bash
source mrowa44.emojify.bash

shlib.console.success() {
	local -r msg=$1
	local icon

	icon=$(emojify.token ":heavy_check_mark:")
	icon=${icon:0:1}
	echo "$(ansi::green)${icon}SUCCESS:$(ansi::resetForeground) $msg"
}
