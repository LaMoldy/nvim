return {
  "preservim/nerdtree",
  lazy = true,
  event = "InsertLeave",
  config = function()
    vim.cmd("let NERDTreeShowHidden=1")
    vim.cmd("let NERDTreeIgnore = ['.next', 'node_modules']")
  end
}