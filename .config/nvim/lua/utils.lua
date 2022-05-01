local utils = {}

function utils.executable(name)
	return vim.fn.executable(name) > 0
end

function utils.read_file(path)
	local file = io.open(path, "rb")
	if not file then
		return nil
	end
	local content = file:read("*a")
	file:close()
	return content
end

function utils.read_yaml(path)
    local lyaml = require("lyaml")
    local content = utils.read_file(path)
    return lyaml.load(content)
end

return utils
