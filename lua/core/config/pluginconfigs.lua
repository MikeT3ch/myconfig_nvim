require("bufferline").setup()
require("nvim-web-devicons").setup({
  strict = true,
  override_by_extension = {
    astro = {
      icon = "",
      color = "#EF8547",
      name = "astro",
    },
  },
})

-- vim.b.ale_javascript_eslint_executable = 'eslint_d'
-- vim.b.ale_javascript_eslint_use_global = 1
