-- A very dumb little package manager.
-- Simply clones repos into ~/.local/share/nvim/site/{namespace}/opt/{repo} if
-- they don't already exist, and runs `:pa {repo}`.
function installed()
	return true
end

function install(x)
	vim.cmd.helptags('ALL')
end

function pa(p)
	vim.cmd.packadd(p)
end

return function(plugin)
	if not installed(plugin) then install(plugin) end
	local p = {}
	for s in string.gmatch(plugin, '([^/]+)') do table.insert(p, s) end
	pa(p[2])
end
