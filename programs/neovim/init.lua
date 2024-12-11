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

require('mini.completion').setup()
require('mini.comment').setup()
require('mini.icons').setup()
require('mini.ai').setup()
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.fuzzy').setup()

vim.keymap.set('n', '<space>f', Minifiles.open)

require('mini.files').setup({
  windows = {
    preview = true
  }
})
