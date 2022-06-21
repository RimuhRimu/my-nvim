local M = {}

function M.config()
  local present, null_ls = pcall(require, "null-ls")
  if present then
    local sources = {
      null_ls.builtins.code_actions.eslint,
      null_ls.builtins.formatting.stylua
    }
    null_ls.setup(sources)
  end
end

return M
