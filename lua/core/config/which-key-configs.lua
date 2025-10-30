local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

wk.add({
  {
    mode = { "n", "v" },
    { "<leader>b",  group = "Buffers" },
    { "<leader>bD", "<cmd>BufferLineSortByDirectory<cr>",         desc = "Sort by directory" },
    { "<leader>bL", "<cmd>BufferLineSortByExtension<cr>",         desc = "Sort by language" },
    { "<leader>bb", "<cmd>BufferLineCyclePrev<cr>",               desc = "Previous" },
    { "<leader>be", "<cmd>BufferLinePickClose<cr>",               desc = "Pick which buffer to close" },
    { "<leader>bf", "<cmd>Telescope buffers previewer=false<cr>", desc = "Find" },
    { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>",               desc = "Close all to the left" },
    { "<leader>bj", "<cmd>BufferLinePick<cr>",                    desc = "Jump" },
    { "<leader>bl", "<cmd>BufferLineCloseRight<cr>",              desc = "Close all to the right" },
    { "<leader>bn", "<cmd>BufferLineCycleNext<cr>",               desc = "Next" },
    { "<leader>C",  group = "Code Actions" },
    { "<leader>W",  group = "Workspace Actions" },
    { "<leader>s",  group = "Search" },
  }, })
