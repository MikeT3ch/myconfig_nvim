require('core.config.keymaps')
require('core.config.options')
require('core.config.pluginconfigs')
require('core.config.LSP-config')
require('core.config.treesitter-config')
require('core.config.nvim-cmp-config')
require('core.config.wk-config')
require("tokyonight").setup({
  -- use the night style
  style = "moon",
  styles = {
    variables = { bold = true }
  },
  on_colors = function(colors)
    colors.error = "#ff0000"
  end
})
