local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {

   b.formatting.deno_fmt,
   b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "json", "yaml" } },
   b.formatting.taplo,
   -- Lua
   b.formatting.stylua,
   b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

   -- Shell
   b.formatting.shfmt.with {
      extra_args = { "-i", "4", "-ci" },
   },
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

   -- Python
   b.formatting.isort.with {
      extra_args = { "--stdout", "--profile", "black" },
   },
   b.formatting.black.with {
      extra_args = { "--quiet", "--fast", "-" },
   },
   b.formatting.cmake_format,
}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = false,
      sources = sources,
   }
end

return M
