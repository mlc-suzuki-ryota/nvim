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

later(function()
  add({
    source = 'nvimdev/lspsaga.nvim',
    depends = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    }
  })

  require('lspsaga').setup({
    ui = {
      border = 'rounded',
      devicon = true,
    },
    hover = {
      max_width = 0.6,
      open_link = 'gx',
    },
  })

  -- LSP Saga のキーマップ
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", { silent = true, desc = "Hover Doc" })
  vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", { silent = true, desc = "Goto Definition" })
  vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<cr>", { silent = true, desc = "Peek Definition" })
  vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", { silent = true, desc = "Code Action" })
  vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", { silent = true, desc = "Rename" })
  vim.keymap.set("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<cr>", { silent = true, desc = "Show Line Diagnostics" })
  vim.keymap.set("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<cr>", { silent = true, desc = "Show Cursor Diagnostics" })
  vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { silent = true, desc = "Prev Diagnostic" })
  vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", { silent = true, desc = "Next Diagnostic" })
end)
