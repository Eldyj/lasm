macro_name = ''

function eval_line(s)
	local tokens = tokenize(s)
	local first = tokens[1]

	if macro_name ~= '' then
		if first == 'end' then
			macro_name = ''
			return
		end
		macro[macro_name] = macro[macro_name] .. s .. '\n'
		return
	end

	if     first == 'mv'   then mv(tokens[2], tokens[3])
	elseif first == 'sc'   then syscall()
	elseif first == 'not'  then l_not(tokens[2])
	elseif first == 'and'  then l_and(tokens[2], tokens[3])
	elseif first == 'or'   then l_or(tokens[2], tokens[3])
	elseif first == 'xor'  then l_xor(tokens[2], tokens[3])
	elseif first == 'add'  then add(tokens[2], tokens[3])
	elseif first == 'inc'  then add(tokens[2], '1')
	elseif first == 'sub'  then sub(tokens[2], tokens[3])
	elseif first == 'dec'  then sub(tokens[2], '1')
	elseif first == 'mul'  then mul(tokens[2], tokens[3])
	elseif first == 'div'  then div(tokens[2], tokens[3])
	elseif first == 'mod'  then mod(tokens[2], tokens[3])
	elseif first == 'pow'  then pow(tokens[2], tokens[3])
	elseif first == 'cmp'  then cmp(tokens[2], tokens[3])
	elseif first == 'swp'  then swp(tokens[2], tokens[3])
	elseif first == 'je'   then je(tokens[2])
	elseif first == 'jne'  then jne(tokens[2])
	elseif first == 'jl'   then jl(tokens[2])
	elseif first == 'jle'  then jle(tokens[2])
	elseif first == 'jg'   then jg(tokens[2])
	elseif first == 'jge'  then jge(tokens[2])
	elseif first == 'jt'   then jt(tokens[2])
	elseif first == 'jnt'  then jnt(tokens[2])
	elseif first == 'str'  then to_str(tokens[2])
	elseif first == 'num'  then to_num(tokens[2])
	elseif first == 'push' then stack_push(tokens[2])
	elseif first == 'pop'  then stack_pop(tokens[2])
	elseif first == 'use'  then eval_file(tokens[2])
	elseif first == 'mcr'  then add_macro(tokens[2], '') macro_name = tokens[2]
	elseif is_macro(first) then eval_string(macro[first])
	end
end

function eval_string(s)
	for i in s:gmatch("([^\n]*)\n?") do
		eval_line(i)
	end
end

function eval_file(fn)
	eval_string(file.read(fn))
end
