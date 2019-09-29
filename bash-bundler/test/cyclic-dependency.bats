#!/usr/bin/env bats

@test "bash-bundler: script has cyclic dependency" {
	local -r outpath="$BATS_TMPDIR/main.bash"

	run bin/bash-bundler \
		--path=test/fixtures/cyclic-dependency \
		test/fixtures/cyclic-dependency/main.bash \
		"$outpath"

	[[ $status == 1 ]]
	[[ $output == *"$outpath:1: script 'test/fixtures/cyclic-dependency/foo.bash' has cyclic dependency!" ]]

	rm "$outpath"
}
