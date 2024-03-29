local M = {}

local status = require "core.status"

local function get_hl_by_name(name)
  return string.format("#%06x", vim.api.nvim_get_hl_by_name(name.group, true)[name.prop])
end

local function get_hl_prop(group, prop, default)
  local status_ok, color = pcall(get_hl_by_name, { group = group, prop = prop })
  if status_ok then
    default = color
  end
  return default
end

function M.config()
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end

  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand "%:t") ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
      local filepath = vim.fn.expand "%:p:h"
      local gitdir = vim.fn.finddir(".git", filepath .. ";")
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
  }

  local spacer = {
    function()
      return " "
    end,
    padding = { left = 0, right = 0 },
  }

  local colors = {
    bg = "#202328",
    fg = "#bbc2cf",
    yellow = "#ECBE7B",
    cyan = "#008080",
    darkblue = "#081633",
    green = "#98be65",
    orange = "#FF8800",
    violet = "#a9a1e1",
    magenta = "#c678dd",
    purple = "#c874fc",
    blue = "#51afef",
    red = "#ec5f67",
  }

  local icons = {
    linux = " ",
    macos = " ",
    windows = " ",

    errs = " ",
    warns = " ",
    infos = " ",
    hints = " ",

    lsp = " LSP: ",
    git = "",
  }

  local config = {
    options = {
      disabled_filetypes = { "NvimTree", "neo-tree", "dashboard", "Outline" },
      component_separators = "",
      section_separators = "",
      globalstatus = true,
    },
    sections = {
      lualine_a = { spacer },
      lualine_b = {},
      lualine_c = {
        {
          "branch",
          icon = icons.git,
          color = { fg = colors.blue, gui = "italic" },
          padding = { left = 2, right = 1 },
        },
        {
          "filetype",
          cond = conditions.buffer_not_empty,
          padding = { left = 2, right = 1 },
        },
        {
          "diff",
          symbols = { added = " ", modified = "柳", removed = " " },
          cond = conditions.hide_in_width,
          padding = { left = 2, right = 1 },
        },
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = { error = " ", warn = " ", info = " ", hint = " " },
          padding = { left = 2, right = 1 },
        },
        {
          function()
            return "%="
          end,
        },
        {
          function()
            local msg = "No Active Lsp"
            local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then
              return msg
            end
            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
              end
            end
            return msg
          end,
          icon = icons.lsp,
          color = { fg = "#ffffff", gui = "bold" },
        },
      },
      lualine_x = {
        {
          status.treesitter_status,
          color = { fg = get_hl_prop("GitSignsAdd", "foreground", colors.green) },
          padding = { left = 1, right = 0 },
          cond = conditions.hide_in_width,
        },
        {
          "location",
          padding = { left = 1, right = 1 },
        },
        {
          "progress",
          color = { gui = "none" },
          padding = { left = 0, right = 0 },
        },
        {
          status.progress_bar,
          padding = { left = 1, right = 2 },
          color = { fg = colors.blue },
          cond = nil,
        },
      },
      lualine_y = { "aerial" },
      lualine_z = { spacer },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
  }

  lualine.setup(config)
end

return M
