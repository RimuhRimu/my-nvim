local status_ok, which_key = pcall(require, "which-key")
if status_ok then
  local is_available = utils.is_available
  local mappings = {
    n = {
      ["<leader>"] = {
        f = { name = "File and Truezen" },
        p = { name = "Packer" },
        l = { name = "LSP" },
        b = { name = "Close"},
      },
    },
  }

  local extra_sections = {
    K = "cheatsheet",
    g = "Git",
    n = "Neo-tree",
    s = "Search",
    S = "Session",
    t = "Terminal",
  }

  local function init_table(mode, prefix, idx)
    if not mappings[mode][prefix][idx] then
      mappings[mode][prefix][idx] = { name = extra_sections[idx] }
    end
  end

  if is_available "bufferline" then
    init_table("n", "<leader>", "b")
  end

  if is_available "neovim-session-manager" then
    init_table("n", "<leader>", "S")
  end

  if is_available "gitsigns.nvim" then
    init_table("n", "<leader>", "g")
  end

  if is_available "nvim-toggleterm.lua" then
    init_table("n", "<leader>", "g")
    init_table("n", "<leader>", "t")
  end

  if is_available "telescope.nvim" then
    init_table("n", "<leader>", "s")
    init_table("n", "<leader>", "g")
  end

  -- support previous legacy notation, deprecate at some point
  for mode, prefixes in pairs(mappings) do
    for prefix, mapping_table in pairs(prefixes) do
      which_key.register(mapping_table, {
        mode = mode,
        prefix = prefix,
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = true,
      })
    end
  end
end
