local lsp = require("lspconfig")
return {
  root_dir = lsp.util.root_pattern("package.json"),
  single_file_support = false,
  exclude = {"**/api/*","**/node_modules/*"}
}
