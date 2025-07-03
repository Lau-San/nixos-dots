local luasnip = {
    "L3MON4D3/LuaSnip",
    lazy = true,
    build = 'make install_jsregexp',
    -- I don't use snippets, so defer this plugin for these filetypes alone
    -- because suggestions for these languages need them
    ft = { 'css', 'scss', 'sass' },
    dependencies = {
        {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
                require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
            end,
        },
    },
    opts = function()
        return {
            history = true,
            delete_check_events = "TextChanged",
        }
    end,
}

local friendly_snippets = {
    "rafamadriz/friendly-snippets",
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
    end,
}

return {
    luasnip,
    -- friendly_snippets
}
