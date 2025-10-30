local M = {}

-- Configuración por defecto
local config = {
  default_frames = { "🔴", "🟠", "🟡", "🟢", "🔵", "🟣", "🟤", "⚫" },
  default_speed = 150
}

-- Función para configurar globalmente
function M.setup(opts)
  config = vim.tbl_extend("force", config, opts or {})
end

local notif_data = {}

local function get_notif_data(key)
  if not notif_data[key] then
    notif_data[key] = {}
  end
  return notif_data[key]
end

local function update_spinner(key)
  local data = get_notif_data(key)
  if data.spinner and data.spinner_frames then
    local new_spinner = (data.spinner % #data.spinner_frames) + 1
    data.spinner = new_spinner
    data.notification = vim.notify(data.last_message or "", data.last_level or vim.log.levels.INFO, {
      icon = data.spinner_frames[new_spinner],
      replace = data.notification,
      hide_from_history = true,
      timeout = false,
      title = data.title,
    })
    vim.defer_fn(function()
      update_spinner(key)
    end, data.speed or config.default_speed)
  end
end

-- Función principal de notificación progresiva
function M.notif_progressive(key, title, opts)
  opts = opts or {}
  local spinner_frames = opts.spinner or config.default_frames
  local speed = opts.speed or config.default_speed

  local data = get_notif_data(key)
  data.title = title
  data.spinner_frames = spinner_frames
  data.speed = speed

  return {
    begin = function(msg)
      data.last_message = msg
      data.last_level = vim.log.levels.INFO
      -- data.notification = vim.notify(msg, vim.log.levels.INFO, {
      --   title = title,
      --   icon = spinner_frames[1],
      --   timeout = false,
      --   hide_from_history = true,
      -- })
      data.spinner = 1

      -- Esperar antes de empezar a actualizar
      vim.defer_fn(function()
        update_spinner(key)
      end, speed)
    end,

    report = function(msg, level)
      level = level or vim.log.levels.INFO
      data.last_message = msg
      data.last_level = level
    end,

    done = function(msg, level)
      data.spinner = nil
      level = level or vim.log.levels.INFO
      data.notification = vim.notify(msg, level, {
        icon = level == vim.log.levels.ERROR and "❌" or "✅",
        replace = data.notification,
        timeout = 3000,
        title = title,
        hide_from_history = false,
      })
      data.last_message = nil
      data.last_level = nil
      data.spinner_frames = nil
      data.speed = nil
    end
  }
end

-- Función para notificaciones estáticas simples
function M.notif_static(msg, level, opts)
  opts = opts or {}
  vim.notify(msg, level or vim.log.levels.INFO, opts)
end

return M
