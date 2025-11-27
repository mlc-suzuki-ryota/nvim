-- (同じ) パッケージマネージャー(mason)をセットアップする
require 'mason'.setup()

-- (同じ) masonを介してlanguage serverを自動インストールする
local ensure_installed = {
  'lua_ls',
  'vtsls'
}
require 'mason-lspconfig'.setup {
  automatic_installation = true,
  ensure_installed = ensure_installed, -- 自動でインストールしたいlanguage server
  dependencies = { 'saghen/blink.cmp' },
}

-- (NEW) language serverの設定をする
vim.lsp.config('lua_ls', {
  -- nvim-lspconfig が設定したコンフィグにsettingsを追加する
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
    }
  },
})
vim.lsp.enable(ensure_installed)

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    -- 補完の設定
    if client:supports_method('textDocument/completion') then
      -- 補完を有効化
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
    -- フォーマット
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 3000 })
        end,
      })
    end

    -- キーマップ
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = args.buf, noremap = true, silent = true, desc = desc })
    end
    -- よく使うLSPのキーマップ
    map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
    map('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    map('K', vim.lsp.buf.hover, 'Hover Documentation')
  end,
})
