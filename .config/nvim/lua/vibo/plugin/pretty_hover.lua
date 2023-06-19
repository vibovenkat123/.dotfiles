local nmap = require("util.keymap").nmap
return {
    "Fildo7525/pretty_hover",
    event = "LspAttach",
    config = function()
        require("pretty_hover").setup({})
        nmap {"K", require("pretty_hover").hover}
    end
}
