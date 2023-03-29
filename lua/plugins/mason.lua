return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      local ok, mason = pcall(require, 'mason')
      if (not ok) then return end

      mason.setup(
        -- ui = {
        --   icons = {
        --     package_installed = "✓",
        --     package_pending = "➜",
        --     package_uninstalled = "✗"
        --   }
        -- }
      )
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function ()
      local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
      if (not ok) then return end
      mason_lspconfig.setup {
      }
    end
  }
}