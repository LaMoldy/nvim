local ok, autotags = pcall(require, 'nvim-ts-autatag')
if (not ok) then return end

autotags.setup()