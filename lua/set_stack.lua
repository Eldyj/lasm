function stack_pop(register)
	if not is_register(register) then return end
	registers[register] = spop()
end

function stack_push(value)
	if is_register(value) then
		spush(registers[value])
	elseif is_number(value) then
		spush(tonumber(value))
	elseif is_string(value) then
		spush(str(value))
	end
end
