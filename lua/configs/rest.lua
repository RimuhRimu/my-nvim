local is_available,rest = pcall(require,"rest-nvim")

local M = {}

if is_available then
  M.setup = function ()
    local configs = {
      -- Open request results in a horizontal split
      result_split_horizontal = true,
      -- Keep the http file buffer above|left when split horizontal|vertical
      result_split_in_place = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        show_http_info = true,
        show_headers = true,
      },
      -- Jump to request line on run
      jump_to_request = false,
      env_file = '.env',
      -- env_file = '.env.local',
      custom_dynamic_variables = {},
      yank_dry_run = true,
    }
    rest.setup(configs)
  end
end

return M
