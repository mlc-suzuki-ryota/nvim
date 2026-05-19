local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add({ source = 'rafamadriz/friendly-snippets' })
end)
now(function()
  vim.o.termguicolors = true
  vim.cmd('colorscheme miniwinter')
end)
now(function() require('mini.starter').setup() end)
now(function() require('mini.notify').setup() end)
now(function() require('mini.icons').setup() end)
now(function()
  require('mini.tabline').setup({ show_icons = true })
  -- アクティブなタブの視認性を向上させるためのハイライト設定
  local function set_tabline_hl()
    vim.api.nvim_set_hl(0, 'MiniTablineCurrent', { fg = '#ffffff', bg = '#444466', bold = true, force = true })
    vim.api.nvim_set_hl(0, 'MiniTablineVisible', { fg = '#bbbbbb', bg = '#333344', force = true })
    vim.api.nvim_set_hl(0, 'MiniTablineHidden', { fg = '#888888', bg = '#222233', force = true })
    vim.api.nvim_set_hl(0, 'MiniTablineFill', { bg = 'none', force = true })
  end


  set_tabline_hl()

  -- ステータスラインの視認性を向上させるためのハイライト設定
  local function set_statusline_hl()
    vim.api.nvim_set_hl(0, 'MiniStatuslineDevinfo', { fg = '#ffffff', bg = '#333355', bold = true, force = true })  -- Git情報など
    vim.api.nvim_set_hl(0, 'MiniStatuslineFilename', { fg = '#eeeeee', bg = '#222244', force = true })              -- ファイルパス
    vim.api.nvim_set_hl(0, 'MiniStatuslineFileinfo', { fg = '#ffffff', bg = '#333355', bold = true, force = true }) -- 言語・エンコーディング
  end

  set_statusline_hl()

  -- カラースキーム変更時にも再適用されるように設定
  vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function()
      set_tabline_hl()
      set_statusline_hl()
    end,
  })
end)
now(function() require('mini.statusline').setup() end)
now(function() require('mini.diff').setup() end)
now(function() require('mini.git').setup() end)
now(function() require('mini.cursorword').setup() end)
now(function()
  require('mini.files').setup()
  vim.keymap.set('n', '<Leader><Leader>', function()
    local MiniFiles = require('mini.files')
    if not MiniFiles.close() then
      MiniFiles.open(vim.fn.getcwd())
    end
  end, { silent = true, desc = 'Toggle File Explorer' })

  vim.api.nvim_create_autocmd('VimEnter', {
    callback = function(event)
      if vim.fn.isdirectory(event.file) == 1 then
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        require('mini.files').open(event.file)
      end
    end,
  })
end)

later(function() require('mini.ai').setup() end)
later(function() require('mini.comment').setup() end)
later(function()
  require('mini.surround').setup({
    mappings = {
      add = '<Leader>sa',
      delete = '<Leader>sd',
      find = '<Leader>sf',
      find_left = '<Leader>sF',
      highlight = '<Leader>sH',
      replace = '<Leader>sr',
      update_n_lines = '<Leader>sn',
    },
  })
end)
later(function() require('mini.indentscope').setup() end)
later(function() require('mini.pairs').setup() end)
later(function() require('mini.animate').setup() end)
later(function()
  local hipatterns = require('mini.hipatterns')
  hipatterns.setup({
    highlighters = {
      -- Hex color codes: #ffffff
      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })
end)
later(function()
  local map = require('mini.map')
  map.setup({
    integrations = {
      map.gen_integration.builtin_search(),
      map.gen_integration.diagnostic(),
      map.gen_integration.gitsigns(),
    },
    symbols = {
      scroll_line = ' ',
      scroll_view = '┃',
    },
    window = {
      width = 1,
      side = 'right',
      focusable = false,
    },
  })
  map.open()
end)
later(function()
  MiniIcons.tweak_lsp_kind('prepend')
  local gen_loader = require('mini.snippets').gen_loader
  require('mini.snippets').setup({
    snippets = {
      gen_loader.from_lang(),
    },
  })
  require('mini.completion').setup()
  MiniSnippets.start_lsp_server()
end)
later(function()
  require('mini.fuzzy').setup()
  -- ピッカー表示中: <Tab> プレビュー切替 / <S-Tab> キー一覧
  require('mini.pick').setup({
    mappings = {
      toggle_preview = '<Tab>',
      toggle_info = '<S-Tab>',
    },
  })
  require('mini.extra').setup()

  local pick_builtin = MiniPick.builtin
  vim.keymap.set('n', '<Leader>ff', pick_builtin.files, { silent = true, desc = '[F]ind [F]iles' })
  vim.keymap.set('n', '<Leader>fg', pick_builtin.grep_live, { silent = true, desc = '[F]ind by [G]rep' })
  vim.keymap.set('n', '<Leader>fb', pick_builtin.buffers, { silent = true, desc = '[F]ind [B]uffers' })
  vim.keymap.set('n', '<Leader>fh', pick_builtin.help, { silent = true, desc = '[F]ind [H]elp' })
  vim.keymap.set('n', '<Leader>fc', MiniExtra.pickers.commands, { silent = true, desc = '[F]ind [C]ommands' })
  vim.keymap.set('n', '<Leader>fr', MiniExtra.pickers.oldfiles, { silent = true, desc = '[F]ind [R]ecent files' })

  local miniclue = require('mini.clue')
  miniclue.setup({
    triggers = {
      { mode = { 'n', 'x' }, keys = '<Leader>' },
      { mode = 'n',          keys = '[' },
      { mode = 'n',          keys = ']' },
      { mode = 'i',          keys = '<C-x>' },
      { mode = { 'n', 'x' }, keys = 'g' },
      { mode = { 'n', 'x' }, keys = "'" },
      { mode = { 'n', 'x' }, keys = '`' },
      { mode = { 'n', 'x' }, keys = '"' },
      { mode = { 'i', 'c' }, keys = '<C-r>' },
      { mode = 'n',          keys = '<C-w>' },
      { mode = { 'n', 'x' }, keys = 'z' },
    },
    clues = {
      miniclue.gen_clues.square_brackets(),
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      miniclue.gen_clues.windows(),
      miniclue.gen_clues.z(),
      { mode = 'n', keys = '<Leader>f',  desc = '+Find' },
      { mode = 'n', keys = '<Leader>s',  desc = '+Surround / Split' },
      { mode = 'n', keys = '<Leader>sa', desc = 'Add surrounding' },
      { mode = 'n', keys = '<Leader>sd', desc = 'Delete surrounding' },
      { mode = 'n', keys = '<Leader>sr', desc = 'Replace surrounding' },
      { mode = 'n', keys = '<Leader>sf', desc = 'Find surrounding' },
      { mode = 'n', keys = '<Leader>sF', desc = 'Find surrounding (left)' },
      { mode = 'n', keys = '<Leader>sn', desc = 'Update n lines' },
      { mode = 'n', keys = '<Leader>sH', desc = 'Highlight surrounding' },
    },
    window = {
      delay = 400,
      config = { width = 'auto' },
    },
  })

  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
      MiniClue.ensure_buf_triggers(ev.buf)
    end,
  })
end)
