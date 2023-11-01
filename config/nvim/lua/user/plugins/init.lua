require("user/plugins/packer-setup")

local packer = require("packer")

return packer.startup(function(use)
    use("wbthomason/packer.nvim") -- Packer can manage itself

    ---------------------------------
    -- Movement and text manipulation
    use({"ggandor/leap.nvim"}) -- Jump to text in the visible buffer

    -- Automatic setup of configuration
    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)
