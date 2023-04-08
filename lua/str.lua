function str(s)
	if not is_string(s) then return "" end
	return s:sub(2, #s - 1):gsub([[\n]],'\n'):gsub([[\t]],'\t')
end
