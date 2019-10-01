source potpourri.shlib.panic.bash
source potpourri.gitlib.cd_gitroot.bash

gitlib.assert_all_committed() (
	gitlib.cd_gitroot

	local -r repoName=${PWD##*/}
	local -a gitArgs
	for arg in "$@"; do
		gitArgs+=("--$arg")
	done

	if [[ -n $(git status --porcelain "${gitArgs[@]}") ]]; then
		git status --short "${gitArgs[@]}" >&2
		shlib.panic msg="$repoName has uncommitted files!"
	fi
)
