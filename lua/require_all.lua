local requireAll = function(name)
  local config_path = vim.fn.stdpath('config')
  local modules = {}
  for _, file in ipairs(vim.fn.readdir(config_path .. '/lua/' .. name, [[v:val =~ '\.lua$']])) do
    local module = require(name .. '.' .. file:gsub('%.lua$', ''))
    table.insert(modules, module)
  end
  return modules
end

return requireAll
