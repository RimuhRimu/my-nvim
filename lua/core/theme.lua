local myTheme = "tokyonight"
local myTheme_is_available,_ = pcall(require,myTheme)
local theme = "default"
if myTheme_is_available then
  vim.g.tokyonight_style = "storm"
  vim.g.tokyonight_italic_functions = true
  vim.g.tokyonight_italic_comments = true
  vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "NeoTree" }

  vim.g.tokyonight_colors = { comment = "blue" }

  theme = myTheme
end

vim.api.nvim_command(("colorscheme %s"):format(theme))
