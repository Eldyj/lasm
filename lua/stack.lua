stack = {}

function spop()
	return table.remove(stack,#stack)
end

function spush(v)
	table.insert(stack,v)
end
