require("tokyonight").setup({
  style = "moon",
  styles = {
    variables = { bold = true }
  },
  on_colors = function(colors)
    colors.error = "#ff0000"
  end
})
