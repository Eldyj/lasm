calls = {exit, write, read, open, close, garg}

function syscall()
	if type(registers['a']) ~= type(0) then
		print('syscall: wrong type')
		os.exit(1)
	end

	if registers['a'] >= #calls then
		print('syscall: index out of range')
		os.exit(1)
	end

	if registers['a'] < 0 then
		print('syscall: negative index')
		os.exit(1)
	end

	calls[registers['a'] + 1]()
end
