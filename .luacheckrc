-- Global objects
globals = {
  "PACKER_BOOTSTRAP",
  "vim",
  "C",
  "packer_plugins",
}

exclude_files = {"lua/packer_compiled.lua"}

-- Rerun tests only if their modification time changed
cache = true

-- Don't report unused self arguments of methods
self = false

ignore = {
  "112",
  "113",
  "111",
  "631",  -- max_line_length
  "212/_.*",  -- unused argument, for vars with "_" prefix
}
