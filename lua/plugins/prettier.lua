return {
  "MunifTanjim/prettier.nvim",
  lazy = true,
  event = "InsertLeave",
  config = function()
    local ok, prettier = pcall(require, "prettier")
    if (not ok) then return end

    prettier.setup ({
      ["null-ls"] = {
        condition = function ()
          return prettier.config_exists({
            check_package_json = false
          })
        end,
        runtime_condition = function(params)
          return true
        end,
        timeout = 5000
      },
      bin = 'prettierd',
      filetypes = {
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "scss",
        "less"
      }
    })
  end
}