#!/usr/bin/env bats

@test "bash-bundler: script self-sourced" {
	local -r outpath="$BATS_TMPDIR/main.bash"

	run bin/bash-bundler \
		--path=test/fixtures/self-sourced \
		test/fixtures/self-sourced/main.bash \
		"$outpath"

	[[ $status == 1 ]]
	[[ $output == *"$outpath:1: script 'test/fixtures/self-sourced/main.bash' self-sourced!" ]]

	rm "$outpath"
}
