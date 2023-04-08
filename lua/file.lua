file = {}

function file.exists(fn)
	local f = io.open(fn, "rb")
	if f then f:close() end
	return f ~= nil
end

function file.readlines(fn)
	if not file.exists(fn) then return {} end
	lines = {}
	for line in io.lines(fn) do 
		lines[#lines + 1] = line
	end
	return lines
end

function file.read(fn)
	if not file.exists(fn) then return "" end
	result = ""
	local lines = file.readlines(fn)

	for _,line in pairs(lines) do
		result = result .. line .. "\n"
	end

	return result
end
