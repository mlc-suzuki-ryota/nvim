return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'auto' -- Or your favorite theme
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = {
        {
          -- This function gets the name of the parent directory of the current file
          function()
            local current_file_path = vim.fn.expand('%:p:h')
            local parent_dir_name = vim.fn.fnamemodify(current_file_path, ':t')
            return parent_dir_name
          end,
          icon = '', -- Folder icon
        },
        {
          'filename',
          path = 0, -- Show only the filename itself
          icon = '',
        },
      },
      lualine_c = { 'branch', 'diff', 'diagnostics' },
      lualine_x = { 'encoding' },
      lualine_y = { 'lsp_status' },
      lualine_z = { 'filetype' },
    },
    inactive_sections = {
      lualine_c = { { 'filename', path = 1 } },
      lualine_x = { 'location' },
    }
  }
}
