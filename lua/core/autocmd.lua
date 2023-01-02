local create_autocmd = vim.api.nvim_create_autocmd
create_autocmd({"BufEnter"}, {
    callback = function ()
        local filetype = vim.bo.filetype
        if filetype ~= "neo-tree" and filetype ~= "" then
            vim.cmd("exe 'normal zx'")
            vim.cmd("exe 'normal zR'")
        end
    end
})
