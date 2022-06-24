_G.utils = {}

local stdpath = vim.fn.stdpath

utils.default_compile_path = stdpath "config" .. "/lua/packer_compiled.lua"

function utils.initialize_packer()
  local packer_is_avalaible, packer = pcall(require, "packer")
  if not packer_is_avalaible then
    local packer_path = stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    vim.fn.delete(packer_path, "rf")
    vim.fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      packer_path,
    }
    print (string.format("Cloning packer .... \nSetup Simple Nvim at %s %s",stdpath,_G.os))
    vim.cmd[[packadd packer.nvim]]
    packer_is_avalaible,packer = pcall(require, "packer")
    if not packer_is_avalaible then
      error("Failed to load packer at:" .. packer_path .. "\n\n" .. packer)
    end
  end
  return packer
end

function utils.compiled()
  local run_me = loadfile(utils.default_compile_path)
  if run_me then
    run_me()
  else
    print "Please run :PackerSync"
  end
end

function utils.vim_opts(options)
  for scope, table in pairs(options) do
    for setting, value in pairs(table) do
      vim[scope][setting] = value
    end
  end
end

function utils.open_url()
  if vim.fn.has "mac" == 1 then
    vim.fn.jobstart({ "open", vim.fn.expand "<cfile>" }, { detach = true })
  elseif vim.fn.has "unix" == 1 then
    vim.fn.jobstart({ "xdg-open", vim.fn.expand "<cfile>" }, { detach = true })
  else
    vim.notify("gx is not supported on this OS!", "error", astronvim.base_notification)
  end
end

function utils.set_url_match()
  utils.delete_url_match()
  if vim.g.highlighturl_enabled then
    vim.fn.matchadd(
      "HighlightURL",
      "\\v\\c%(%(h?ttps?|ftp|file|ssh|git)://|[a-z]+[@][a-z]+[.][a-z]+:)%([&:#*@~%_\\-=?!+;/0-9a-z]+%(%([.;/?]|[.][.]+)[&:#*@~%_\\-=?!+/0-9a-z]+|:\\d+|,%(%(%(h?ttps?|ftp|file|ssh|git)://|[a-z]+[@][a-z]+[.][a-z]+:)@![0-9a-z]+))*|\\([&:#*@~%_\\-=?!+;/.0-9a-z]*\\)|\\[[&:#*@~%_\\-=?!+;/.0-9a-z]*\\]|\\{%([&:#*@~%_\\-=?!+;/.0-9a-z]*|\\{[&:#*@~%_\\-=?!+;/.0-9a-z]*})\\})+",
      15
    )
  end
end

function utils.delete_url_match()
  for _, match in ipairs(vim.fn.getmatches()) do
    if match.group == "HighlightURL" then
      vim.fn.matchdelete(match.id)
    end
  end
end

function utils.toggle_url_match()
  vim.g.highlighturl_enabled = not vim.g.highlighturl_enabled
  util.set_url_match()
end

function utils.is_available(plugin)
  return packer_plugins ~= nil and packer_plugins[plugin] ~= nil
end

return utils
