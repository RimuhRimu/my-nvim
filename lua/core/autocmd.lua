local v = vim.api
local create_acutocmd = v.nvim_create_autocmd

-- FIX not folds found
create_acutocmd({ "BufEnter" }, {
  callback = function()
    local filetype = vim.bo.filetype
    if filetype ~= "neo-tree" and filetype ~= "" then
      vim.cmd "exe 'normal zx'"
      vim.cmd "exe 'normal zR'"
    end
  end,
})
