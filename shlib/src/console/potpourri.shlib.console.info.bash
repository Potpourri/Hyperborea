source fidian.ansi.bash
source mrowa44.emojify.bash

shlib.console.info() {
	local -r msg=$1
	local icon

	icon=$(emojify.token ":information_source:")
	icon=${icon:0:1}
	echo "$(ansi::blue)${icon}INFO:$(ansi::resetForeground) $msg"
}
