local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
  impatient.enable_profile()
end

for _, source in ipairs{
  "core.utils",
  "core.options",
  "core.plugins",
  "configs.lsp.init",
  "core.maps",
  "configs.which-key-register",
} do
  local is_ok, fault = pcall(require, source)
  if not is_ok then
    error("Failed to load ".. source .. "\n\n" .. fault)
  end
end

local myTheme = "tokyonight"
local myTheme_is_available,_ = pcall(require,myTheme)
local theme = "default"
if myTheme_is_available then
  theme = myTheme
end

vim.api.nvim_command(("colorscheme %s"):format(theme))
