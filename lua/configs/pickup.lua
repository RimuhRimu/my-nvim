local M = {}

M.config = function()
  local pickup_is_available, pickup = pcall(require, "nvim-window-picker")
  if pickup_is_available then
    pickup.setup {
      autoselect_one = true,
      include_current_win = true,
      selection_chars = "FJDKSLA;CMRUEIWOQP",
      filter_func = nil,
      filter_rules = {
        bo = {
          filetype = { "NvimTree", "neo-tree", "notify", "packer" },
          buftype = { "terminal" },
        },
      },
      fg_color = "#25db4a",
      current_win_hl_color = "#1a1b26",
      other_win_hl_color = "#24283d",
    }
  end
end

return M
