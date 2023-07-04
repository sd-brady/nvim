vim.g.mapleader = ' '

-- Bring up file explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Toggle NetRW File Explorer' })

-- Set keymaps to navigate windows
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')

-- window management
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split Window Vertically' }) -- split window vertically
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split Window Horizontally' }) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make Split Windows Equal Size' }) -- make split windows equal width & height
vim.keymap.set('n', '<leader>sx', ':close<CR>', { desc = 'Close Current Split Window' }) -- close current split window

-- Don't know what this does. Got it fron kickstart
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Remap to make it so we only scroll half pages
vim.keymap.set({ 'n', 'v' }, '<C-b>', '<C-u>')
vim.keymap.set({ 'n', 'v' }, '<C-f>', '<C-d>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

----------------------
-- Plugin Keybinds
----------------------

-- Lspsaga keymaps
vim.keymap.set({ 'n', 't' }, '<A-i>', '<cmd>Lspsaga term_toggle<CR>', { desc = 'Open LspSaga Terminal' }) -- see outline on right hand side

-- Vim-Maximizer
vim.keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>', { desc = 'Vim-Maximizer: Toggle Maximize' }) -- toggle split window maximization

-- Telescope Keybinds
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- Git keybinds
vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = 'Search [G]it [S]tatus' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_commits, { desc = 'Search [G]it [C]ommits' })
vim.keymap.set('n', '<leader>gb', require('telescope.builtin').git_branches, { desc = 'Search [G]it [B]rances' })

-- General Search Keybinds
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>ft', require('telescope.builtin').builtin, { desc = '[F]ind [T]elescopes' })
