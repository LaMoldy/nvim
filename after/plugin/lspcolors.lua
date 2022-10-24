local ok, lspcolors = pcall(require, 'lsp-colors')
if (not ok) then return end

lspcolors.setup()