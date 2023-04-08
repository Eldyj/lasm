macro = {}

function is_macro(n)
	return macro[n] ~= nil
end

function add_macro(n,v)
	macro[n] = v
end
