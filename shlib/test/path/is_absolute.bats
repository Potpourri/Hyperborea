#!/usr/bin/env bats

@test "path.is_absolute: /foo/bar" {
	source potpourri.shlib.path.is_absolute.bash

	shlib.path.is_absolute /foo/bar
}

@test "path.is_absolute: /" {
	source potpourri.shlib.path.is_absolute.bash

	shlib.path.is_absolute /
}

@test "path.is_absolute: foo/bar ; returns an error code" {
	source potpourri.shlib.path.is_absolute.bash

	run shlib.path.is_absolute foo/bar

	[[ $status == 1 ]]
}

@test "path.is_absolute: x ; returns an error code" {
	source potpourri.shlib.path.is_absolute.bash

	run shlib.path.is_absolute x

	[[ $status == 1 ]]
}

@test "path.is_absolute: ./foo/bar ; returns an error code" {
	source potpourri.shlib.path.is_absolute.bash

	run shlib.path.is_absolute ./foo/bar

	[[ $status == 1 ]]
}

@test "path.is_absolute: . ; returns an error code" {
	source potpourri.shlib.path.is_absolute.bash

	run shlib.path.is_absolute .

	[[ $status == 1 ]]
}

@test "path.is_absolute: '' ; returns an error code" {
	source potpourri.shlib.path.is_absolute.bash

	run shlib.path.is_absolute ''

	[[ $status == 1 ]]
}

@test "path.is_absolute: ' ' ; returns an error code" {
	source potpourri.shlib.path.is_absolute.bash

	run shlib.path.is_absolute ' '

	[[ $status == 1 ]]
}
