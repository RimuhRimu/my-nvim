local M = {}
local r = require("runthis")

function M.config()
  r.setup({
    programs = {
      ["js"] = "deno run"
    },
    window = {
      width = 50
    }
  })
end
return M
