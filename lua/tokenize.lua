function tokenize(s)
	local tokens = {}
	local inquote = false
	local start = 1
	for i = 1, #s do
		if inquote then
			if s:sub(i, i) == '"' then
				inquote = false
				table.insert(tokens, s:sub(start, i))
				start = i + 1
			end
		else
			if (s:sub(i, i) == ' ') or (s:sub(i,i) == '\t') or (s:sub(i, i) == ',') or (s:sub(i, i) == '#') then
				if s:sub(start,i-1) ~= '' then
					table.insert(tokens, s:sub(start, i - 1))
				end
				if s:sub(i, i) == '#' then
					return tokens
				end
				start = i + 1
			elseif s:sub(i, i) == '"' then
				inquote = true
				start = i
			end
		end
	end
	table.insert(tokens, s:sub(start))
	return tokens
end

