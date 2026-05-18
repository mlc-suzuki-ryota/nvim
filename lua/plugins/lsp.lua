local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add({ source = 'williamboman/mason.nvim' })
  add({
    source = 'neovim/nvim-lspconfig',
    depends = { 'williamboman/mason.nvim' },
  })
  add({
    source = 'williamboman/mason-lspconfig.nvim',
    depends = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
  })
end)

later(function()
  -- nvim-lspconfig が vim.lsp に lua_ls などの定義を載せる（Neovim 0.11+）
  require('lspconfig')

  require('mason').setup()

  vim.lsp.config('lua_ls', {
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          checkThirdParty = false,
          library = vim.api.nvim_get_runtime_file('', true),
        },
        telemetry = { enable = false },
      },
    },
  })

  require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls' },
  })
end)
