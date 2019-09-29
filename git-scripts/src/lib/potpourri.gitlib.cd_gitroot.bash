source potpourri.shlib.panic.bash

gitlib.cd_gitroot() {
	local gitDir

	if ! gitDir=$(git rev-parse --git-dir 2>/dev/null); then
		shlib.panic msg="This script must be run in git repo!"
	fi
	cd "${gitDir/%.git*/.}"
}
