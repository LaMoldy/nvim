local function init()
    require 'LaMoldy.vim'.init()
    require 'LaMoldy.packer'.init()
end

return {
    init = init,
}