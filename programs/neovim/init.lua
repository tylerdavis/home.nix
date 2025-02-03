vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.keymap.set('i', 'jj', '<ESC>')
local opts = { noremap = true, silent = true, desc = 'Toggle comments' }
vim.keymap.set('n', '<space>c', 'gcc', opts)
vim.keymap.set('v', '<space>c', 'gc', opts)

-- vim.keymap.set("n", "<space>p", function()
--   require("telescope").extensions.file_browser.file_browser()
-- end)

-- vim.keymap.set('n', '<space>f', '<cmd>Telescope find_files<CR>', { desc = 'Find files with Telescope FZF' })
-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })


require('mini.comment').setup()
require('mini.icons').setup()
require('mini.ai').setup()
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.fuzzy').setup()


-- fuzzy
require('telescope').setup({
  defaults = {
    generic_sorter = require('mini.fuzzy').get_telescope_sorter
  }
})

-- Files explorer
require('mini.files').setup()
vim.keymap.set('n', '<space>f', MiniFiles.open)


-- Completion
require('mini.completion').setup()

local imap_expr = function(lhs, rhs)
  vim.keymap.set('i', lhs, rhs, { expr = true })
end
imap_expr('<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

local keycode = vim.keycode or function(x)
  return vim.api.nvim_replace_termcodes(x, true, true, true)
end
local keys = {
  ['cr']        = keycode('<CR>'),
  ['ctrl-y']    = keycode('<C-y>'),
  ['ctrl-y_cr'] = keycode('<C-y><CR>'),
}

_G.cr_action = function()
  if vim.fn.pumvisible() ~= 0 then
    -- If popup is visible, confirm selected item or add new line otherwise
    local item_selected = vim.fn.complete_info()['selected'] ~= -1
    return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
  else
    -- If popup is not visible, use plain `<CR>`. You might want to customize
    -- according to other plugins. For example, to use 'mini.pairs', replace
    -- next line with `return require('mini.pairs').cr()`
    return keys['cr']
  end
end

vim.keymap.set('i', '<CR>', 'v:lua._G.cr_action()', { expr = true })

