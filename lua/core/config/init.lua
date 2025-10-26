vim.notify = require("notify")
vim.notify('🔧 Cargando configuraciones...', vim.log.levels.INFO, {
  title = "Core Config"
})

local current_file = debug.getinfo(1, "S").source:sub(2)
local config_dir = vim.fn.fnamemodify(current_file, ":h")
local ignore_files = {
  'init.lua', -- Ignorar a sí mismo
  -- 'theme.lua',
  -- 'Lsp-configs.lua',
  -- 'options.lua',
  -- 'nvim-cmp-configs.lua',
  -- 'keymaps.lua',
  -- 'plugins-configs.lua',
  -- 'treesitter_configs.lua',
  -- 'which-key-configs.lua',
  -- 'ufo-config.lua'
}

-- Crear tabla hash para búsqueda rápida
local ignored = {}
for _, file in ipairs(ignore_files) do
  ignored[file] = true
end

local loaded = {}
local ignored_list = {}

-- Cargar todos los archivos .lua excepto los ignorados
for _, file in ipairs(vim.fn.readdir(config_dir)) do
  if file:match('%.lua$') and file ~= 'init.lua' then
    if ignored[file] then
      table.insert(ignored_list, file:gsub('%.lua$', ''))
    else
      local module = file:gsub('%.lua$', '')
      local ok, err = pcall(require, 'core.config.' .. module)
      if ok then
        table.insert(loaded, module)
      else
        vim.notify('❌ Error cargando ' .. module .. ': ' .. err, vim.log.levels.ERROR, {
          title = "Core Config"
        })
      end
    end
  end
end

if #ignored_list > 0 then
  vim.notify('⚠️  Configs desactivados: ' .. table.concat(ignored_list, '\n '), vim.log.levels.WARN, {
    title = "Core Config"
  })
else
  vim.notify('✅ Todas las configs están activas', vim.log.levels.INFO, {
    title = "Core Config"
  })
end
-- Opcional: Mostrar los que se cargaron exitosamente
