#!/usr/bin/lua

local lasm_dir = os.getenv("LASM_DIR")
if lasm_dir == nil then
	print("WARN: using PWD as lasm_dir")
	lasm_dir = os.getenv("PWD")
end

function import(file)
	dofile(lasm_dir .. "/lua/"..file..'.lua')
end

import('registers')
import('checks')
import('str')
import('set_registers')
import('stack')
import('set_stack')
import('fd')
import('sysfns')
import('syscall')
import('sysmath')
import('sysops')
import('macro')
import('tokenize')
import('file')
import('eval')

if arg[1] == nil then
	print('first argument should be file')
	os.exit(1)
end

if not file.exists(arg[1]) then
	print('no such file: '.. arg[1])
	os.exit(1)
end

eval_string(file.read(arg[1]))
