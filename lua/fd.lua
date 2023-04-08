fd = {io.stdin, io.stdout, io.stderr}

function gfd(n)
	return fd[n + 1]
end
