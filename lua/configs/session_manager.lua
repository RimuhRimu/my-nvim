local M = {}

function M.config()
  local status_ok, session_manager = pcall(require, "session_manager")
  if status_ok then
    session_manager.setup { autosave_last_session = false }
  end
end

return M
