return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim"
  },
  lazy = true,
  config = function()
    local ok, telescope = pcall(require, 'telescope')
    if (not ok) then return end

    telescope.setup {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "secret.d/.*",
          "%.pem",
          ".git",
          ".next",
          "\\target",
          "target"
        }
      }
    }
  end
}