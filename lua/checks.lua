function is_register(v)
	return registers[v] ~= nil
end

function is_string(v)
	if type(v) ~= type("s") then return false end
	if #v < 2 then return false end
	return v == [["]] .. v:sub(2, #v - 1) .. [["]]
end

function is_number(v)
	if type(v) ~= type("s") then return false end
	return tonumber(v) ~= nil
end
