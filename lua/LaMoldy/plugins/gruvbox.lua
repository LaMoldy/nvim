local function init()
  -- Theme Settings
  vim.g.gruvbox_baby_function_style = "NONE"
  vim.g.gruvbox_baby_keyword_style = "NONE"
  vim.g.gruvbox_baby_telescope_theme = 1
  vim.g.gruvbox_baby_transparent_mode = 1
  -- Load colourscheme
  vim.cmd[[colorscheme gruvbox-baby]]
end

return {
  init = init
}