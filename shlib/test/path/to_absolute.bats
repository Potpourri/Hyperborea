#!/usr/bin/env bats

@test "path.to_absolute: /foo/bar" {
	source potpourri.shlib.path.to_absolute.bash

	run shlib.path.to_absolute /foo/bar

	[[ $status == 0 ]]
	[[ $output == "/foo/bar" ]]
}

@test "path.to_absolute: foo/bar" {
	source potpourri.shlib.path.to_absolute.bash

	run shlib.path.to_absolute foo/bar

	[[ $status == 0 ]]
	[[ $output == "$PWD/foo/bar" ]]
}

@test "path.to_absolute: foo/bar, relativeBase='/'" {
	source potpourri.shlib.path.to_absolute.bash

	run shlib.path.to_absolute foo/bar '/'

	[[ $status == 0 ]]
	[[ $output == "/foo/bar" ]]
}

@test "path.to_absolute: foo/bar, relativeBase='/baz'" {
	source potpourri.shlib.path.to_absolute.bash

	run shlib.path.to_absolute foo/bar '/baz'

	[[ $status == 0 ]]
	[[ $output == "/baz/foo/bar" ]]
}

@test "path.to_absolute: foo/bar, relativeBase='qux' ; returns an error code" {
	source potpourri.shlib.path.to_absolute.bash

	run shlib.path.to_absolute foo/bar 'qux'

	[[ $status == 1 ]]
}
