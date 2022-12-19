local plugins = {
  -- Plugin manager
  {
    "wbthomason/packer.nvim",
  },

  -- Optimiser
  { "lewis6991/impatient.nvim" },

  -- Lua functions
  { "nvim-lua/plenary.nvim", module = "plenary" },

  -- Popup API
  { "nvim-lua/popup.nvim" },

  -- Indent detection
  {
    "Darazaki/indent-o-matic",
    event = "BufRead",
    config = function()
      require("configs.indent-o-matic").config()
    end,
  },

  -- Notification Enhancer
  {
    "rcarriga/nvim-notify",
    event = "VimEnter",
    config = function()
      require("configs.notify").config()
    end,
  },

  -- Neovim UI Enhancer
  { "MunifTanjim/nui.nvim", module = "nui" },

  -- Cursorhold fix
  {
    "antoinemadec/FixCursorHold.nvim",
    event = { "BufRead", "BufNewFile" },
    config = function()
      vim.g.cursorhold_updatetime = 100
    end,
  },

  -- Smarter Splits
  {
    "mrjones2014/smart-splits.nvim",
    module = "smart-splits",
    config = function()
      require("configs.smart-splits").config()
    end,
  },

  -- Icons
  {
    "kyazdani42/nvim-web-devicons",
    event = "VimEnter",
    config = function()
      require("configs.icons").config()
    end,
  },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    after = "nvim-web-devicons",
    config = function()
      require("configs.bufferline").config()
    end,
  },

  -- Better buffer closing
  { "famiu/bufdelete.nvim", cmd = { "Bdelete", "Bwipeout" } },

  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    module = "neo-tree",
    cmd = "Neotree",
    requires = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("configs.neo-tree").config()
    end,
  },

  -- Required by choose win feature of Neo tree
  {
    's1n7ax/nvim-window-picker',
    tag = 'v1.*',
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("configs.lualine").config()
    end,
  },

  -- Parenthesis highlighting
  { "p00f/nvim-ts-rainbow", after = "nvim-treesitter" },

  -- Autoclose tags
  { "windwp/nvim-ts-autotag", after = "nvim-treesitter" },

  -- Context based commenting
  { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    event = { "BufRead", "BufNewFile" },
    cmd = {
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSDisableAll",
      "TSEnableAll",
    },
    config = function()
      require("configs.treesitter").config()
    end,
  },

  -- Snippet collection
  { "rafamadriz/friendly-snippets", event = "InsertEnter" },

  -- Snippet engine
  {
    "L3MON4D3/LuaSnip",
    after = "friendly-snippets",
    config = function()
      require("configs.luasnip").config()
    end,
  },

  -- Completion engine
  {
    "hrsh7th/nvim-cmp",
    after = "LuaSnip",
    config = function()
      require("configs.cmp").config()
    end,
  },

  -- Snippet completion source
  {
    "saadparwaiz1/cmp_luasnip",
    after = "nvim-cmp",
  },

  -- Buffer completion source
  {
    "hrsh7th/cmp-buffer",
    after = "nvim-cmp",
  },

  -- Path completion source
  {
    "hrsh7th/cmp-path",
    after = "nvim-cmp",
  },

  -- LSP completion source
  {
    "hrsh7th/cmp-nvim-lsp",
    after = "nvim-cmp",
  },

  -- Built-in LSP
  {
    "neovim/nvim-lspconfig",
    event = "VimEnter",
  },

  -- LSP manager
  {
    "williamboman/nvim-lsp-installer",
    after = "nvim-lspconfig",
    config = function()
      require("configs.nvim-lsp-installer").config()
    end,
  },

  -- LSP symbols
  {
    "stevearc/aerial.nvim",
    module = "aerial",
    branch = "nvim-0.5",
    cmd = { "AerialToggle", "AerialOpen", "AerialInfo" },
    config = function()
      require("configs.aerial").config()
    end,
  },

  -- Formatting and linting
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function ()
      require("configs.null-ls").config()
    end,
    event = { "BufRead", "BufNewFile" },
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    module = "telescope",
    config = function()
      require("configs.telescope").config()
    end,
  },

  -- Fuzzy finder syntax support
  {
    ("nvim-telescope/telescope-%s-native.nvim"):format(vim.fn.has "win32" == 1 and "fzy" or "fzf"),
    after = "telescope.nvim",
    run = "make",
    config = function()
      require("telescope").load_extension(vim.fn.has "win32" == 1 and "fzy_native" or "fzf")
    end,
  },

  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    opt = true,
    config = function()
      require("configs.gitsigns").config()
    end,
  },

  -- Start screen
  {
    "glepnir/dashboard-nvim",
    config = function()
      require("configs.dashboard").config()
    end,
  },

  -- Color highlighting
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("configs.colorizer").config()
    end,
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("configs.autopairs").config()
    end,
  },

  -- Terminal
  {
    "akinsho/nvim-toggleterm.lua",
    cmd = "ToggleTerm",
    module = { "toggleterm", "toggleterm.terminal" },
    config = function()
      require("configs.toggleterm").config()
    end,
  },

  -- Commenting
  {
    "numToStr/Comment.nvim",
    module = { "Comment", "Comment.api" },
    keys = { "gc", "gb", "g<", "g>" },
    config = function()
      require("configs.Comment").config()
    end,
  },

  -- Indentation
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require("configs.indent-line").config()
    end,
  },

  -- Keymaps popup
  {
    "folke/which-key.nvim",
    config = function()
      require("configs.which-key").config()
    end,
  },

  -- Smooth scrolling
  {
    "declancm/cinnamon.nvim",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("configs.cinnamon").config()
    end,
  },

  -- Smooth escaping
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    config = function()
      require("configs.better_escape").config()
    end,
  },

  -- Get extra JSON schemas
  { "b0o/SchemaStore.nvim", module = "schemastore" },

  -- Session manager
  {
    "Shatur/neovim-session-manager",
    module = "session_manager",
    cmd = "SessionManager",
    event = "BufWritePost",
    config = function()
      require("configs.session_manager").config()
    end,
  },

  -- The BEST theme ever

  { "folke/tokyonight.nvim", },

  -- Focus layout

  {
    "Pocco81/TrueZen.nvim",
    cmd = {
      "TZFocus",
      "TZAtaraxis",
      "TZMinimalist",
    },
    setup = function()
      require("configs.true-zen").setup()
    end
  },

  -- Jump to with <leader><leader> w or b
  {
    "easymotion/vim-easymotion"
  },

  -- Multi cursor
  {
    "mg979/vim-visual-multi"
  },

  -- Choose win with <leader>a
  {
    "t9md/vim-choosewin",
  },

  -- Go integration
  {
    "crispgm/nvim-go"
  },

  -- JS conde formating
  {
    'heavenshell/vim-jsdoc',
    run = 'make install'
  },

  -- NOTE pretty comments
  {
    "folke/todo-comments.nvim",
    event = "BufEnter",
    branch = "neovim-pre-0.8.0",
    setup = require("configs.todo-comments").setup()
  },

  -- Emmet for HTML and CSS shortcuts
  {
    "mattn/emmet-vim"
  },

  -- Git commands
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    requires = 'tpope/vim-rhubarb'
  },

  -- Get documentation inside nvim
  {
    "dbeniamine/cheat.sh-vim"
  },

  -- Rest API

  {
    "NTBBloodbath/rest.nvim",
    module = "rest",
    after = "plenary",
    setup = function ()
      require("configs.rest").setup()
    end
  },

  -- {
  --   "gelfand/copilot.vim",
  --   config = function()
  --     vim.g.copilot_no_tab_map = true
  --     vim.g.copilot_assume_mapped = true
  --     vim.g.copilot_filetypes = {
  --       ["*"] = false,
  --       ["javascript"] = true,
  --       ["typescript"] = true,
  --       ["lua"] = true,
  --       ["rust"] = true,
  --       ["c"] = true,
  --       ["c#"] = true,
  --       ["c++"] = true,
  --       ["go"] = true,
  --       ["python"] = true,
  --     }
  --   end
  -- },
}

local packer = utils.initialize_packer()
packer.startup {
  function(use)
    for _, plugin in ipairs(plugins) do
      use(plugin)
    end
  end,
  config = {
    compile_path = utils.default_compile_path,
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
    profile = {
      enable = true,
      threshold = 0.0001,
    },
    git = {
      clone_timeout = 300,
      subcommands = {
        update = "pull --rebase",
      },
    },
    auto_clean = true,
    compile_on_sync = true,
  }
}
utils.compiled()
