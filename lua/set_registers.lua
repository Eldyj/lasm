function mv(register, value)
	if not is_register(register) then return end

	if is_number(value) then
		registers[register] = tonumber(value)
	elseif is_string(value) then
		registers[register] = str(value)
	elseif is_register(value) then
		registers[register] = registers[value]
	end
end
