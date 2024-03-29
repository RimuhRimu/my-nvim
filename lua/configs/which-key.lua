local M = {}

function M.config()
  local status_ok, which_key = pcall(require, "which-key")
  if status_ok then
    local show = which_key.show
    local show_override = nil
    if type(show_override) == "function" then
      which_key.show = show_override(show)
    else
      which_key.show = function(keys, opts)
        if vim.bo.filetype ~= "TelescopePrompt" then
          show(keys, opts)
        end
      end
    end
    which_key.setup {
      plugins = {
        spelling = { enabled = true },
        presets = { operators = false },
      },
      window = {
        border = "rounded",
        padding = { 2, 2, 2, 2 },
      },
    }
  end
end

return M
