local map = vim.keymap.set
local M = {}

map("", "<Space>", "<Nop>")
-- Normal --
-- Standard Operations
map("n", "<leader>m", "<cmd>mess<cr>", { desc = "Show messages" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>wa", "<cmd>wa<cr>", { desc = "Save all buffers" })
map("n", "<leader>wq", "<cmd>wq<cr>", { desc = "Save and quit" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>0", "<cmd>nohlsearch<cr>", { desc = "No Highlight" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("v", "<leader><leader>m", "<cmd>Man<cr>", { desc = "Manual of this" })
map("n", "<leader><leader>x", "<cmd>w<cr><cmd>source %<cr>", { desc = "Save and source file" })
map("n", "gx", function()
  utils.open_url()
end, { desc = "Open the file under cursor with system app" })
map("n", "<leader>ww", "<cmd>w!<cr>", { desc = "Force write" })
map("n", "<leader>qq", "<cmd>q!<cr>", { desc = "Force quit" })
map("n", "Q", "<Nop>")
map("n", "<S-t>", "<cmd>tabnew %<CR>")
-- Packer
map("n", "<leader>pc", "<cmd>PackerCompile<cr>", { desc = "Packer Compile" })
map("n", "<leader>pi", "<cmd>PackerInstall<cr>", { desc = "Packer Install" })
map("n", "<leader>ps", "<cmd>PackerSync<cr>", { desc = "Packer Sync" })
map("n", "<leader>pS", "<cmd>PackerStatus<cr>", { desc = "Packer Status" })
map("n", "<leader>pu", "<cmd>PackerUpdate<cr>", { desc = "Packer Update" })

-- TrueZen focus mode.
map("n", "<leader>fz", "<cmd>TZFocus<CR>", { desc = "TrueZen Focus" })
map("n", "<leader>fx", "<cmd>TZMinimalist<CR>", { desc = "TrueZen Minimalist" })

-- Split

map("n", "<Leader>h", ":<C-u>split<CR>", { desc = "Split horizontaly" })
map("n", "<Leader>v", ":<C-u>vsplit<CR>", { desc = "Split verticaly" })

map("n", "<Leader>shv", "<cmd>vs term://$SHELL<CR>", { desc = "Split a term verticaly" })
map("n", "<Leader>shj", "<cmd>terminal<CR>", { desc = "Split a term horizontaly" })
map("n", "<Leader>a", "<cmd>ChooseWin<CR>", { desc = "Pick a window" })

-- Dashboard
if utils.is_available "dashboard-nvim" then
  map("n", "<leader>d", "<cmd>Dashboard<cr>", { desc = "Dashboard" })
end

-- JSdoc

map("n", "<leader><leader>l", "<cmd>JsDocFormat<cr>", { desc = "Format js" })

-- Hop

map("n", "<leader><leader>w", "<cmd>HopWord<cr>", { desc = "Hop word" })
map("n", "<leader><leader>bc", "<cmd>HopWordBC<cr>", { desc = "Hop word before cursor" })
map("n", "<leader><leader>ac", "<cmd>HopWord<cr>", { desc = "Hop word after cursor" })
map("n", "<leader><leader>p", "<cmd>HopPattern<cr>", { desc = "Hop Pattern" })

-- Bufdelete
map("n", "<leader>bc", "<cmd>bd!<cr>", { desc = "Close buffer" })

-- Navigate buffers
if utils.is_available "bufferline.nvim" then
  map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer tab" })
  map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer tab" })
  map("n", ">b", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer tab right" })
  map("n", "<b", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer tab left" })
else
  map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
  map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
end

-- GitSigns
if utils.is_available "gitsigns.nvim" then
  map("n", "<leader>gj", function()
    require("gitsigns").next_hunk()
  end, { desc = "Next git hunk" })
  map("n", "<leader>gk", function()
    require("gitsigns").prev_hunk()
  end, { desc = "Previous git hunk" })
  map("n", "<leader>gl", function()
    require("gitsigns").blame_line()
  end, { desc = "View git blame" })
  map("n", "<leader>gp", function()
    require("gitsigns").preview_hunk()
  end, { desc = "Preview git hunk" })
  map("n", "<leader>gh", function()
    require("gitsigns").reset_hunk()
  end, { desc = "Reset git hunk" })
  map("n", "<leader>gr", function()
    require("gitsigns").reset_buffer()
  end, { desc = "Reset git buffer" })
  map("n", "<leader>gs", function()
    require("gitsigns").stage_hunk()
  end, { desc = "Stage git hunk" })
  map("n", "<leader>gu", function()
    require("gitsigns").undo_stage_hunk()
  end, { desc = "Unstage git hunk" })
  map("n", "<leader>gd", function()
    require("gitsigns").diffthis()
  end, { desc = "View git diff" })
end

--Git
map("n", "<leader><Leader>gc", ":Git commit<CR>", { desc = "Git commit" })
map("n", "<leader><Leader>gsh", ":Git push<CR>", { desc = "Git push" })
map("n", "<leader><Leader>gll", ":Git pull<CR>", { desc = "Git pull" })
map("n", "<leader><Leader>gss", ":Git status<CR>", { desc = "Git status" })
map("n", "<leader><Leader>gb", ":Git blame<CR>", { desc = "Git blame" })
map("n", "<leader><Leader>gd", ":Git diff<CR>", { desc = "Git diff" })
map("n", "<leader><Leader>grr", ":Git restore<CR>", { desc = "Git restore" })
map("n", "<leader><Leader>grs", ":!git restore --staged %<CR>", { desc = "Git restore staged" })
map("n", "<leader><Leader>g", ":Git<CR>", { desc = "Git" })
map("n", "<leader><Leader>gad", ":Git add .<CR>", { desc = "Git add EVERYTHING" })
map("n", "<leader><Leader>gfd", ":Git add %<CR>", { desc = "Git add this file" })
map("n", "<leader><Leader>ggo", ":GBrowse<CR>", { desc = "Git browse" })
map("n", "<leader><Leader>go", ":Git log<CR>", { desc = "Git log" })

-- NeoTree
if utils.is_available "neo-tree.nvim" then
  map("n", "<leader>nt", "<cmd>Neotree toggle<cr>", { desc = "Toggle Explorer" })
  map("n", "<leader>nb", "<cmd>Neotree buffers<cr>", { desc = "Toggle Explorer Buffers" })
  map("n", "<leader>ng", "<cmd>Neotree git_status<cr>", { desc = "Toggle Explorer Git Status" })
end

-- Session Manager
if utils.is_available "neovim-session-manager" then
  map("n", "<leader>Sl", "<cmd>SessionManager! load_last_session<cr>", { desc = "Load last session" })
  map("n", "<leader>Ss", "<cmd>SessionManager! save_current_session<cr>", { desc = "Save this session" })
  map("n", "<leader>Sd", "<cmd>SessionManager! delete_session<cr>", { desc = "Delete session" })
  map("n", "<leader>Sf", "<cmd>SessionManager! load_session<cr>", { desc = "Search sessions" })
  map(
    "n",
    "<leader>S.",
    "<cmd>SessionManager! load_current_dir_session<cr>",
    { desc = "Load current directory session" }
  )
end

-- LSP Installer
if utils.is_available "nvim-lsp-installer" then
  map("n", "<leader>lp", "<cmd>Mason<cr>", { desc = "LSP installer" })
end

-- Smart Splits
if utils.is_available "smart-splits.nvim" then
  -- Better window navigation
  map("n", "<A-h>", function()
    require("smart-splits").move_cursor_left()
  end, { desc = "Move to left split" })
  map("n", "<A-j>", function()
    require("smart-splits").move_cursor_down()
  end, { desc = "Move to below split" })
  map("n", "<A-k>", function()
    require("smart-splits").move_cursor_up()
  end, { desc = "Move to above split" })
  map("n", "<A-l>", function()
    require("smart-splits").move_cursor_right()
  end, { desc = "Move to right split" })

  -- Resize with arrows
  map("n", "<C-j>", function()
    require("smart-splits").resize_up()
  end, { desc = "Resize split up" })
  map("n", "<C-k>", function()
    require("smart-splits").resize_down()
  end, { desc = "Resize split down" })
  map("n", "<C-Left>", function()
    require("smart-splits").resize_left()
  end, { desc = "Resize split left" })
  map("n", "<C-Right>", function()
    require("smart-splits").resize_right()
  end, { desc = "Resize split right" })
else
  map("n", "<A-h>", "<C-w>h", { desc = "Move to left split" })
  map("n", "<A-j>", "<C-w>j", { desc = "Move to below split" })
  map("n", "<A-k>", "<C-w>k", { desc = "Move to above split" })
  map("n", "<A-l>", "<C-w>l", { desc = "Move to right split" })
  map("n", "<C-j>", "<cmd>resize -2<CR>", { desc = "Resize split up" })
  map("n", "<C-k>", "<cmd>resize +2<CR>", { desc = "Resize split down" })
  map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize split left" })
  map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize split right" })
end

-- SymbolsOutline
if utils.is_available "aerial.nvim" then
  map("n", "<leader>lS", "<cmd>AerialToggle<cr>", { desc = "Symbols outline" })
end

-- Telescope
if utils.is_available "telescope.nvim" then
  map("n", "<leader>fw", function()
    require("telescope.builtin").live_grep()
  end, { desc = "Search words" })
  map("n", "<leader>gt", function()
    require("telescope.builtin").git_status()
  end, { desc = "Git status" })
  map("n", "<leader>gb", function()
    require("telescope.builtin").git_branches()
  end, { desc = "Git branchs" })
  map("n", "<leader>gc", function()
    require("telescope.builtin").git_commits()
  end, { desc = "Git commits" })
  map("n", "<leader>ff", function()
    require("telescope.builtin").find_files()
  end, { desc = "Search files" })
  map("n", "<leader>fi", function()
    require("telescope").extensions.file_browser.file_browser()
  end, { desc = "Files Browser" })
  map("n", "<leader>fd", function()
    require("telescope").extensions.dap.commands()
  end, { desc = "Open dap options" })
  map("n", "<leader>fb", function()
    require("telescope.builtin").buffers()
  end, { desc = "Search buffers" })
  map("n", "<leader>fh", function()
    require("telescope.builtin").help_tags()
  end, { desc = "Search help" })
  map("n", "<leader>fm", function()
    require("telescope.builtin").marks()
  end, { desc = "Search marks" })
  map("n", "<leader>fo", function()
    require("telescope.builtin").oldfiles()
  end, { desc = "Search history" })
  map("n", "<leader>sb", function()
    require("telescope.builtin").git_branches()
  end, { desc = "Git branchs" })
  map("n", "<leader>sh", function()
    require("telescope.builtin").help_tags()
  end, { desc = "Search help" })
  map("n", "<leader>sm", function()
    require("telescope.builtin").man_pages()
  end, { desc = "Search man" })
  map("n", "<leader>sn", function()
    require("telescope").extensions.notify.notify()
  end, { desc = "Search notifications" })
  map("n", "<leader>sr", function()
    require("telescope.builtin").registers()
  end, { desc = "Search registers" })
  map("n", "<leader>sk", function()
    require("telescope.builtin").keymaps()
  end, { desc = "Search keymaps" })
  map("n", "<leader>sc", function()
    require("telescope.builtin").commands()
  end, { desc = "Search commands" })
  map("n", "<leader>ls", function()
    local aerial_avail, _ = pcall(require, "aerial")
    if aerial_avail then
      require("telescope").extensions.aerial.aerial()
    else
      require("telescope.builtin").lsp_document_symbols()
    end
  end, { desc = "Search symbols" })
  map("n", "<leader>lR", function()
    require("telescope.builtin").lsp_references()
  end, { desc = "Search references" })
  map("n", "<leader>lD", function()
    require("telescope.builtin").diagnostics()
  end, { desc = "Search diagnostics" })
end

-- Rest API

map("n", "<leader><leader>r", "<Plug>RestNvim", { desc = "Make a http resquest" })
map("n", "<leader><leader>rp", "<Plug>RestNvimPreview", { desc = "Preview the request CURL command" })
map("n", "<leader><leader>rr", "<Plug>RestNvimLast", { desc = "Rerun the las request" })

-- Terminal
if utils.is_available "nvim-toggleterm.lua" then
  for i = 1, 3, 1 do
    map("n", ("<leader>tf%s"):format(i), ("<cmd>%sToggleTerm direction=float<cr>"):format(i), { desc = ("ToggleTerm float terminal %s"):format(i) })
    map("n", ("<leader>th%s"):format(i), ("<cmd>%sToggleTerm size=10 direction=horizontal<cr>"):format(i), { desc = ("ToggleTerm horizontal split %s"):format(i) })
    map("n", ("<leader>tv%s"):format(i), ("<cmd>%sToggleTerm size=80 direction=vertical<cr>"):format(i), { desc = ("ToggleTerm vertical split %s"):format(i) })
  end
end

-- Stay in indent mode
map("v", "<", "<gv", { desc = "unindent line" })
map("v", ">", ">gv", { desc = "indent line" })

-- Improved Terminal Mappings
map("t", "<esc>", "<C-\\><C-n>", { desc = "Terminal normal mode" })
map("t", "jk", "<C-\\><C-n>", { desc = "Terminal normal mode" })
map("t", "<A-h>", "<c-\\><c-n><c-w>h", { desc = "Terminal left window navigation" })
map("t", "<A-j>", "<c-\\><c-n><c-w>j", { desc = "Terminal down window navigation" })
map("t", "<A-k>", "<c-\\><c-n><c-w>k", { desc = "Terminal up window navigation" })
map("t", "<A-l>", "<c-\\><c-n><c-w>l", { desc = "Terminal right window naviation" })

-- Plenary

map("n", "<leader>sp", "<Plug>PlenaryTestFile")

-- DAP

map("n", "<leader><leader>dc", "<cmd>DapContinue<CR>")
map("n", "<leader><leader>dsi", "<cmd>DapStepInto<CR>")
map("n", "<leader><leader>dso", "<cmd>DapStepOver<CR>")
map("n", "<leader><leader>dst", "<cmd>DapStepOut<CR>")
map("n", "<leader><leader>dt", "<cmd>DapToggleBreakpoint<CR>")

return M
