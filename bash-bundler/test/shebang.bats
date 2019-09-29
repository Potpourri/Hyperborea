#!/usr/bin/env bats

@test "bash-bundler: sourced script contains shebang" {
	local -r outpath="$BATS_TMPDIR/main.bash"

	run bin/bash-bundler \
		--path=test/fixtures/shebang \
		test/fixtures/shebang/main.bash \
		"$outpath"

	[[ $status == 1 ]]
	[[ $output == *"$outpath:1: sourced script 'test/fixtures/shebang/contains-shebang.bash' contains shebang!" ]]

	rm "$outpath"
}

@test "bash-bundler: main script contains shebang" {
	local -r outpath="$BATS_TMPDIR/main.bash"

	bin/bash-bundler \
		--path=test/fixtures/shebang \
		test/fixtures/shebang/contains-shebang.bash \
		"$outpath"

	rm "$outpath"
}
