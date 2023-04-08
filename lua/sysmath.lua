function add(v1, v2)
	if not is_register(v1) then
		print("add: "..v1.." isn't register")
		os.exit(1)
	end

	if is_register(v2) then
		mv(v1, tostring(registers[v1] + registers[v2]))
	elseif is_number(v2) then
		mv(v1, tostring(registers[v1] + tonumber(v2)))
	else
		print('add: math operation with '..v2..' (non number)')
		os.exit(1)
	end
end

function sub(v1, v2)
	if not is_register(v1) then
		print("sub: "..v1.." isn't register")
		os.exit(1)
	end

	if is_register(v2) then
		mv(v1, tostring(registers[v1] - registers[v2]))
	elseif is_number(v2) then
		mv(v1, tostring(registers[v1] - tonumber(v2)))
	else
		print('sub: math operation with '..v2..' (non number)')
		os.exit(1)
	end
end

function mul(v1, v2)
	if not is_register(v1) then
		print("mul: "..v1.." isn't register")
		os.exit(1)
	end

	if is_register(v2) then
		mv(v1, tostring(registers[v1] * registers[v2]))
	elseif is_number(v2) then
		mv(v1, tostring(registers[v1] * tonumber(v2)))
	else
		print('mul: math operation with '..v2..' (non number)')
		os.exit(1)
	end
end

function div(v1, v2)
	if not is_register(v1) then
		print("div: "..v1.." isn't register")
		os.exit(1)
	end

	if is_register(v2) then
		mv(v1, tostring(registers[v1] / registers[v2]))
	elseif is_number(v2) then
		mv(v1, tostring(registers[v1] / tonumber(v2)))
	else
		print('div: math operation with '..v2..' (non number)')
		os.exit(1)
	end
end

function mod(v1, v2)
	if not is_register(v1) then
		print("mod: "..v1.." isn't register")
		os.exit(1)
	end

	if is_register(v2) then
		mv(v1, tostring(registers[v1] % registers[v2]))
	elseif is_number(v2) then
		mv(v1, tostring(registers[v1] % tonumber(v2)))
	else
		print('mod: math operation with '..v2..' (non number)')
		os.exit(1)
	end
end

function pow(v1, v2)
	if not is_register(v1) then
		print("pow: "..v1.." isn't register")
		os.exit(1)
	end

	if is_register(v2) then
		mv(v1, tostring(registers[v1] ^ registers[v2]))
	elseif is_number(v2) then
		mv(v1, tostring(registers[v1] ^ tonumber(v2)))
	else
		print('pow: math operation with '..v2..' (non number)')
		os.exit(1)
	end
end
