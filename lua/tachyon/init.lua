local config = require "tachyon.config"
local M = {}

function M.load(opts)
  opts = config.extend(opts)

  local palette = require "tachyon.palette"
  local name = "tachyon"

  if vim.g.colors_name then
    vim.cmd "hi clear"
  end

  if vim.fn.exists "syntax_on" then
    vim.api.nvim_command "syntax reset"
  end

  vim.o.termguicolors = true
  vim.g.colors_name = name

  local util = require "tachyon.util"
  local groups = require "tachyon.groups"

  for _, group in ipairs(groups) do
    group = group.highlight(palette, opts)
    util.initialise(group)
  end
end

M.setup = config.setup

return M
