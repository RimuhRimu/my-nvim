local M = {}

function M.config()
  local g = vim.g
  local fn = vim.fn

  local is_ok, db = pcall(require,"dashboard")
  if is_ok then
    local plugins_count = fn.len(vim.fn.globpath(fn.stdpath "data" .. "/site/pack/packer/start", "*", 0, 1))
    db.custom_header = {
      " ",
      " ",
      " ",
      " ",
      " ",
      '⢕⢕⢕⢕⢕⠅⢗⢕⠕⣠⠄⣗⢕⢕⠕⢕⢕⢕⠕⢠⣿⠐⢕⢕⢕⠑⢕⢕⠵⢕',
      '⢕⢕⢕⢕⠁⢜⠕⢁⣴⣿⡇⢓⢕⢵⢐⢕⢕⠕⢁⣾⢿⣧⠑⢕⢕⠄⢑⢕⠅⢕',
      '⢕⢕⠵⢁⠔⢁⣤⣤⣶⣶⣶⡐⣕⢽⠐⢕⠕⣡⣾⣶⣶⣶⣤⡁⢓⢕⠄⢑⢅⢑',
      '⠍⣧⠄⣶⣾⣿⣿⣿⣿⣿⣿⣷⣔⢕⢄⢡⣾⣿⣿⣿⣿⣿⣿⣿⣦⡑⢕⢤⠱⢐',
      '⢠⢕⠅⣾⣿⠋⢿⣿⣿⣿⠉⣿⣿⣷⣦⣶⣽⣿⣿⠈⣿⣿⣿⣿⠏⢹⣷⣷⡅⢐',
      '⣔⢕⢥⢻⣿⡀⠈⠛⠛⠁⢠⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⠛⠛⠁⠄⣼⣿⣿⡇⢔',
      '⢕⢕⢽⢸⢟⢟⢖⢖⢤⣶⡟⢻⣿⡿⠻⣿⣿⡟⢀⣿⣦⢤⢤⢔⢞⢿⢿⣿⠁⢕',
      '⢕⢕⠅⣐⢕⢕⢕⢕⢕⣿⣿⡄⠛⢀⣦⠈⠛⢁⣼⣿⢗⢕⢕⢕⢕⢕⢕⡏⣘⢕',
      '⢕⢕⠅⢓⣕⣕⣕⣕⣵⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣷⣕⢕⢕⢕⢕⡵⢀⢕⢕',
      '⢑⢕⠃⡈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⢕⢕⢕',
      " ",
      " ",
      " ",
    }

    db.custom_center = {
      {
        icon = '  ',
        desc = 'Find file                   ',
        shortcut = 'SPC f f',
        action = "Telescope find_files"
      },
      {
        icon = '  ',
        desc = 'Recents                     ',
        shortcut = 'SPC f o',
        action = "Telescope oldfiles"
      },
      {
        icon = '  ', 
        desc = 'Find Word                   ',
        shortcut = 'SPC f w',
        action = "Telescope live_grep"
      },
      {
        icon = '  ',
        desc ='Bookmarks                    ',
        shortcut = 'SPC b m',
        action = "Telescope marks"
      },
      {
        icon = '  ',
        desc = 'Last Session                 ',
        shortcut = 'SPC s l',
        action = "SessionLoad"
      },
      {
        icon = '  ',
        desc = 'Terminal                   ',
        shortcut = 'SPC s h j',
        action = "term"
      },
    }

    db.custom_footer = {
      " ",
      "Welcome back!, loaded " .. plugins_count .. " plugins ",
    }
  end
end

return M
