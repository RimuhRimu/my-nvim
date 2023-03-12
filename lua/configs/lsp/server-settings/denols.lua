local lsp = require("lspconfig")
return {
  root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc"),
  single_file_support = true
}
