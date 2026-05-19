local add, now = MiniDeps.add, MiniDeps.later

now(function()
  add({
    source = 'atelierbram/Base2Tone-nvim',
    checkout = 'master',
    monitor = 'main',
  })

  vim.o.termguicolors = true
  vim.cmd('colorscheme base2tone_drawbridge_dark')
end)
