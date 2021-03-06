-----------------------------------------------------------
-- Treesitter configuration file
-----------------------------------------------------------

-- Plugin: nvim-treesitter
--- https://github.com/nvim-treesitter/nvim-treesitter
require('nvim-treesitter.configs').setup {
  ensure_install = {
    "lua",
    "bash",
    "dockerfile",
    "typescript",
    "html",
    "javascript",
    "markdown",
    "scss",
    "tsx",
    "vim",
    "yaml",
    "php"
  },
  sync_install = true,
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = true
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  compilers = { "gcc" }
}
