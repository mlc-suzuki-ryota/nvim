local add, later = MiniDeps.add, MiniDeps.later

later(function()
  add({
    source = 'windwp/nvim-ts-autotag',
    checkout = 'main',
    monitor = 'main',
  })
  require('nvim-ts-autotag').setup()
end)

later(function()
  add({
    source = 'stevearc/conform.nvim',
  })

  require('conform').setup({
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
      yaml = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "prettierd", "prettier", stop_after_first = true },
      php = { "php_cs_fixer", "phpcbf", stop_after_first = true },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  })

  vim.keymap.set({ "n", "v" }, "<leader>mp", function()
    require("conform").format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    })
  end, { desc = "Format file or range (in visual mode)" })
end)
