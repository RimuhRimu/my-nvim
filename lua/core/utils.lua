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
    print(string.format("Cloning packer .... \nSetup Simple Nvim at %s %s", stdpath, _G.os))
    vim.cmd [[packadd packer.nvim]]
    packer_is_avalaible, packer = pcall(require, "packer")
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
    vim.notify("gx is not supported on this OS!", "error")
  end
end

function utils.is_available(plugin)
  return packer_plugins ~= nil and packer_plugins[plugin] ~= nil
end

return utils
