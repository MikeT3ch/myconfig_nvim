vim.notify = require("notify")
local prog = require("progress")
local notif = prog.progress_progressive("core_config", "Core Config")
local custom_spinner = prog.spinners.material
local notif2 = prog.progress_progressive("Test_win", "Test Title",
  { speed = 100, spinner = custom_spinner })

-- notif.begin('🔧 Loading Configuration...')
notif2.begin('Hiiiiiiiiiii...')


local current_file = debug.getinfo(1, "S").source:sub(2)
local config_dir = vim.fn.fnamemodify(current_file, ":h")

local ignore_files = {
  'init.lua',
  'ufo-config.lua'
}

local ignored = {}
for _, file in ipairs(ignore_files) do
  ignored[file] = true
end

local loaded = {}
local ignored_list = {}
local errors = {}

for _, file in ipairs(vim.fn.readdir(config_dir)) do
  if file:match('%.lua$') and file ~= 'init.lua' then
    local module = (file:gsub('%.lua$', ''))
    if ignored[file] then
      ignored_list[#ignored_list + 1] = module
    else
      local ok, err = pcall(require, 'core.config.' .. module)
      if ok then
        loaded[#loaded + 1] = module
      else
        errors[#errors + 1] = module .. ': ' .. err
        notif.notif_static('❌ Error: ' .. module, vim.log.levels.ERROR, {
          title = "Core Config",
          timeout = 5000,
        })
      end
    end
  end
end

-- vim.defer_fn(function()
--   if #errors > 0 then
--     notif.done(
--       string.format('Cargados %d módulos con %d errores', #loaded, #errors),
--       vim.log.levels.ERROR
--     )
--   else
--     notif.done(string.format('✓ %d módulos cargados correctamente', #loaded))
--   end
-- end, 2000)
vim.defer_fn(function()
  vim.defer_fn(function()
    notif2.report('Warning! ...', vim.log.levels.WARN)
  end, 1000)

  vim.defer_fn(function()
    notif2.done('All done!...')
  end, 3000)
end, 1000)
