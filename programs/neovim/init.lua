vim.keymap.set('i', 'jj', '<ESC>')

vim.keymap.set("n", "<space>f", function()
  require("telescope").extensions.file_browser.file_browser()
end)

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.autoindent = true
require('telescope').load_extension('fzf')
