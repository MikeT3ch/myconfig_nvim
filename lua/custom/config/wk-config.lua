local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

local mappings = {
  b = {
    name = "Buffers",
    j = { "<cmd>BufferLinePick<cr>", "Jump" },
    f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
    b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
    n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
    e = {
      "<cmd>BufferLinePickClose<cr>",
      "Pick which buffer to close",
    },
    h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
    l = {
      "<cmd>BufferLineCloseRight<cr>",
      "Close all to the right",
    },
    D = {
      "<cmd>BufferLineSortByDirectory<cr>",
      "Sort by directory",
    },
    L = {
      "<cmd>BufferLineSortByExtension<cr>",
      "Sort by language",
    },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
}
wk.register(mappings, opts)

-- wk.register({
--   b = {
--     name = "Buffers",
--     j = { "<cmd>BufferLinePick<cr>", "Jump" },
--     f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
--     b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
--     n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
--     e = {
--       "<cmd>BufferLinePickClose<cr>",
--       "Pick which buffer to close",
--     },
--     h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
--     l = {
--       "<cmd>BufferLineCloseRight<cr>",
--       "Close all to the right",
--     },
--     D = {
--       "<cmd>BufferLineSortByDirectory<cr>",
--       "Sort by directory",
--     },
--     L = {
--       "<cmd>BufferLineSortByExtension<cr>",
--       "Sort by language",
--     },
--   },
-- })
