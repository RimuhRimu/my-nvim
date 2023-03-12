local M = {}
M.setup = function()
  local handlers = require("configs.lsp.handlers")
  local lspconfig = require("lspconfig")
  local tbl_deep_extend = vim.tbl_deep_extend

  local status_ok, mason = pcall(require,"mason")
  local is_present, masonlsp = pcall(require,"mason-lspconfig")

  if status_ok then
    mason.setup {
       ui = {
           icons = {
               package_installed = "✓"
           }
       }
   }
  end

  if is_present then
    masonlsp.setup {
       ensure_installed = { "lua_ls" },
   }

   handlers.setup()

   masonlsp.setup_handlers({
     handlers.myHandler
   })

   for _,server in ipairs(masonlsp.get_installed_servers()) do
     local old_on_attach = lspconfig[server].on_attach
     local opts = {
       on_attach = function(client,bufnr)
         if old_on_attach then
          old_on_attach(client,bufnr)
         end
         handlers.on_attach(client,bufnr)
       end,
       capabilities = tbl_deep_extend("force", handlers.capabilities, lspconfig[server].capabilities or {}),
     }
     local present, av_overrides = pcall(require, "configs.lsp.server-settings." .. server)
     if present then
       opts = tbl_deep_extend("force", av_overrides, opts)
     end
     lspconfig[server].setup(opts)
    end
  end
end
return M
