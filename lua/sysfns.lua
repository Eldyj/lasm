function exit()
	os.exit(registers['b'])
end

function write()
	local l = registers['d']
	if l == -1 then l = #registers['c'] end
	gfd(registers['b']):write(registers['c']:sub(1, l))
	registers['a'] = registers['d']
end

function read()
	registers['a'] = gfd(registers['b']):read(registers['c'])
end

function open()
	table.insert(fd, io.open(registers['b'], registers['c']))
	registers['a'] = #fd - 1
end

function close()
	table.remove(fd, registers['b']):close()
end

function garg()
	if type(registers['b']) ~= type(0) then
		print('garg: wrong type')
		os.exit(1)
	end

	if registers['b'] >= #arg then
		print('garg: index out of range')
		os.exit(1)
	end

	if registers['b'] < 0 then
		print('garg: negative index')
		os.exit(1)
	end

	registers['a'] = arg[registers['b'] + 1]
end
