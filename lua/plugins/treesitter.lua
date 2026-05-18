local add, later = MiniDeps.add, MiniDeps.later

later(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'master',
    monitor = 'main',
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })

  add({
    source = 'nvim-treesitter/nvim-treesitter-context',
    depends = { 'nvim-treesitter/nvim-treesitter' },
  })

  add({
    source = 'theHamsta/nvim-treesitter-pairs',
    depends = { 'nvim-treesitter/nvim-treesitter' },
  })

  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'vimdoc' },
    highlight = { enable = true },
    pairs = {
      enable = true,
    },
  })

  require('treesitter-context').setup({
    enable = true,
    max_lines = 3,
    trim_scope = 'outer',
  })
end)
