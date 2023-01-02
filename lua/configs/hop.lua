local M = {}
function M.config()
  local status_ok, hop = pcall(require, "hop")
  if status_ok then
    hop.setup()
  end
  -- Not any conf yet
end
return M
