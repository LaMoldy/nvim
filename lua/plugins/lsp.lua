return {
    "neovim/nvim-lspconfig",
    lazy = false,
    priority = 1000,
    config = function()
      local status, nvim_lsp = pcall(require, "lspconfig")
      if (not status) then return end

      local protocol = require('vim.lsp.protocol')

      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        --Enable completion triggered by <c-x><c-o>
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { noremap = true, silent = true }

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

        -- Set some keybinds conditional on server capabilities
          if client.server_capabilities.document_formatting then
            buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
          end
          if client.server_capabilities.document_range_formatting then
            buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
          end

          -- Set autocommands conditional on server_capabilities
          if client.server_capabilities.document_highlight then
            vim.api.nvim_exec([[
              augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
              augroup END
            ]], false)
          end
      end

      local function make_config()
        -- Set up completion using nvim_cmp with LSP source
        local capabilities = require('cmp_nvim_lsp').default_capabilities(
          vim.lsp.protocol.make_client_capabilities()
        )

        capabilities.textDocument.completion.completionItem.snippetSupport = true
        capabilities.textDocument.completion.completionItem.resolveSupport = {
          properties = {
            'documentation',
            'detail',
            'additionalTextEdits',
          }
        }

        return {
          capabilities = capabilities,
          on_attach = on_attach
        }
      end

      local lspconfig_servers = {
        "tsserver",
        "prismals",
        "lua_ls",
        "omnisharp",
        "cssls",
        "pyright",
        "jdtls",
        "gopls",
        "jsonls",
        "clangd",
        "rust_analyzer",
        "html",
        "phpactor"
      }

      protocol.CompletionItemKind = {
        '', -- Text
        '', -- Method
        '', -- Function
        '', -- Constructor
        '', -- Field
        '', -- Variable
        '', -- Class
        'ﰮ', -- Interface
        '', -- Module
        '', -- Property
        '', -- Unit
        '', -- Value
        '', -- Enum
        '', -- Keyword
        '﬌', -- Snippet
        '', -- Color
        '', -- File
        '', -- Reference
        '', -- Folder
        '', -- EnumMember
        '', -- Constant
        '', -- Struct
        '', -- Event
        'ﬦ', -- Operator
        '', -- TypeParameter
      }

      for _, server in pairs(lspconfig_servers) do
        local config = make_config()

        if server == "sumneko_lua" then
            config.settings = {
              Lua = {
                diagnostics = { globals = { 'vim' } },
                runtime = { version = 'LuaJIT' },
                telemetry = { enable = false },
                workspace = { library = vim.api.nvim_get_runtime_file("", true) },
              }
            }
          end

          require("lspconfig").omnisharp.setup {
            cmd = { "dotnet", "C:/Users/Nikk/AppData/Local/nvim-data/lsp_servers/omnisharp/omnisharp/OmniSharp.dll"},
            organize_imports_on_format = true,
            enable_import_completion = true,
          }

        require'lspconfig'[server].setup(config)
      end

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      }
      )

      -- Diagnostic symbols in the sign column (gutter)
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      vim.diagnostic.config({
        virtual_text = {
          prefix = '●'
        },
        update_in_insert = true,
        float = {
          source = "always", -- Or "if_many"
        },
      })
    end
  }