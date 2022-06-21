local status_ok, lspconfig = pcall(require, "lspconfig")
if status_ok then
  local handlers = require "configs.lsp.handlers"
  handlers.setup()

  lspconfig.sumneko_lua.setup {}
  local installer_avail, lsp_installer = pcall(require, "nvim-lsp-installer")
  if installer_avail then
    lsp_installer.setup()
    for _, server in ipairs(lsp_installer.get_installed_servers()) do
      lspconfig[server.name].setup()
    end
  end


  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
end
