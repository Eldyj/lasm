function l_and(v1,v2)
	if not is_register(v1) then
		print('l_and: non-register passed to 1st argument')
		os.exit(1)
	end

	val1 = registers[v1]

	if is_register(v2) then
		val2 = registers[v2]
	elseif is_number(v2) then
		val2 = tonumber(v2)
	elseif is_string(v2) then
		print('l_and: wrong type for 2nd argument')
	end

	registers[v1] = tonumber(val1 and val2)
end

function l_or(v1,v2)
	if not is_register(v1) then
		print('l_or: non-register passed to 1st argument')
		os.exit(1)
	end

	val1 = registers[v1]

	if is_register(v2) then
		val2 = registers[v2]
	elseif is_number(v2) then
		val2 = tonumber(v2)
	elseif is_string(v2) then
		print('l_or: wrong type for 2nd argument')
	end

	registers[v1] = tonumber(val1 or val2)
end

function l_xor(v1,v2)
	if not is_register(v1) then
		print('l_xor: non-register passed to 1st argument')
		os.exit(1)
	end

	val1 = registers[v1]

	if is_register(v2) then
		val2 = registers[v2]
	elseif is_number(v2) then
		val2 = tonumber(v2)
	elseif is_string(v2) then
		print('l_xor: wrong type for 2nd argument')
	end

	registers[v1] = tonumber((val1 or val2) and (val1 ~= val2))
end

function l_not(v1)
	if not is_register(v1) then
		print('l_not: non-register passed')
		os.exit(1)
	end

	val = registers[v1]

	if type(val) ~= type(0) then
		print('l_not: wrong type')
		os.exit(1)
	end

	registers[v1] = tonumber(not(val))
end

function to_str(s)
	if not is_register(s) then
		print('to_str: non-register passed')
		os.exit(1)
	end

	registers[s] =  tostring(registers[s])
end

function to_num(s)
	if not is_register(s) then
		print('to_num: non-register passed')
		os.exit(1)
	end

	registers[s] = tonumber(registers[s]) or 0
end

function cmp(v1, v2)
	local val1 = 0
	local val2 = 0
	local code = 0

	if is_register(v1) then
		val1 = registers[v1]
	elseif is_number(v1) then
		val1 = tonumber(v1)
	elseif is_string(v1) then
		val1 = str(v1)
	end

	if is_register(v2) then
		val2 = registers[v2]
	elseif is_number(v2) then
		val2 = tonumber(v2)
	elseif is_string(v2) then
		val2 = str(v2)
	end

	if type(val1) ~= type(val2) then code = 3
	elseif val1 == val2 then code = 0
	elseif type(val1) == type(0) then
		if val1 > val2 then code = 1
		elseif val1 < val2 then code = 2
		end
	elseif type(val1) == type('s') then
		if #val1 > #val2 then code = 1
		elseif #val1 < #val2 then code = 2
		end
	else
		code=4
	end
	
	mv('f',tostring(code))
end

function je(m)
	if registers['f'] == 0 then
		if is_macro(m) then eval_string(macro[m])
		else
			print("je: can't execute macros")
			os.exit(1)
		end
	end
end

function jne(m)
	if registers['f'] ~= 0 then
		if is_macro(m) then eval_string(macro[m])
		else
			print("jne: can't execute macros")
			os.exit(1)
		end
	end
end

function jl(m)
	if registers['f'] == 2 then
		if is_macro(m) then eval_string(macro[m])
		else
			print("jl: can't execute macros")
			os.exit(1)
		end
	end
end

function jle(m)
	if registers['f'] == 2 or registers['f'] == 0 then
		if is_macro(m) then eval_string(macro[m])
		else
			print("jle: can't execute macros")
			os.exit(1)
		end
	end
end

function jg(m)
	if registers['f'] == 1 then
		if is_macro(m) then eval_string(macro[m])
		else
			print("jg: can't execute macros")
			os.exit(1)
		end
	end
end

function jge(m)
	if registers['f'] == 1 or registers['f'] == 0 then
		if is_macro(m) then eval_string(macro[m])
		else
			print("jge: can't execute macros")
			os.exit(1)
		end
	end
end

function jnt(m)
	if registers['f'] == 3 then
		if is_macro(m) then eval_string(macro[m])
		else
			print("jnt: can't execute macros")
			os.exit(1)
		end
	end
end

function jt(m)
	if registers['f'] ~= 3 then
		if is_macro(m) then eval_string(macro[m])
		else
			print("jt: can't execute macros")
			os.exit(1)
		end
	end
end
