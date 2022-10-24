local ok, _ = pcall(require, 'gruvbox-baby')
if (not ok) then return end

vim.g.gruvbox_baby_function_style = "NONE"
vim.g.gruvbox_baby_keyword_style= "NONE"
vim.g.gruvbox_baby_telescope_theme = 1
vim.g.gruvbox_baby_transparent_mode = 0
vim.g.gruvbox_background_color = "dark"

vim.cmd [[colorscheme gruvbox-baby]]