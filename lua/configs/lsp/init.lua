local status_ok, lspconfig = pcall(require, "lspconfig")
local installer_avail, lsp_installer = pcall(require, "nvim-lsp-installer")
if status_ok and installer_avail then
  local tbl_deep_extend = vim.tbl_deep_extend
  local handlers = require "configs.lsp.handlers"
  local on_attach = handlers.on_attach
  handlers.setup()

  if installer_avail then
    lsp_installer.setup {}
    for _, server in ipairs(lsp_installer.get_installed_servers()) do
      local old_on_attach = lspconfig[server.name].on_attach
      local opts = {
        on_attach = function(client, bufnr)
          if old_on_attach then
            old_on_attach(client, bufnr)
          end
          on_attach(client, bufnr)
        end,
        capabilities = tbl_deep_extend("force", handlers.capabilities, lspconfig[server.name].capabilities or {}),
      }

      local present, av_overrides = pcall(require, "configs.lsp.server-settings." .. server.name)
      if present then
        opts = tbl_deep_extend("force", av_overrides, opts)
      end

      lspconfig[server.name].setup(opts)
    end
  end
end
