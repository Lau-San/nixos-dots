local lsp_utils = require('util.lsp')

local lspconfig = {
    'neovim/nvim-lspconfig',
    event = require('util').lazy_file_events,
    dependencies = {
        -- 'mason.nvim',
        -- { 'williamboman/mason-lspconfig.nvim', config = function() end },
        {
            'folke/lazydev.nvim',
            ft = 'lua',
            opts = {
                library = {
                    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                    { path = 'snacks.nvim', words = { 'Snacks' } },
                    { path = 'obsidian.nvim', words = { 'obsidian' } },
                },
            },
        },
    },
    opts = {
        diagnostics = {
            severity_sort = true,
            virtual_text = {
                spacing = 4,
                source = 'if_many',
                prefix = ' ',
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = ' ',
                    [vim.diagnostic.severity.WARN] = ' ',
                    [vim.diagnostic.severity.HINT] = ' ',
                    [vim.diagnostic.severity.INFO] = ' ',
                },
            },
        },
        capabilities = {
            workspace = {
                fileOperations = {
                    didRename = true,
                    willRename = true,
                },
            },
        },
        servers = {
            -- Add server configurations here
            -- pylsp = true,
            pyright = true,
            lua_ls = true,
            gdscript = {
                name = 'godot',
                cmd = vim.lsp.rpc.connect('127.0.0.1', 6005),
            },
            cssls = true,
            nixd = {
                cmd = { 'nixd' },
                settings = {
                    nixpkgs = { expr = 'import <nixpkgs> { }' },
                    formatting = { command = { 'alejandra' } },
                    options = {
                        nixos = {
                            expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.nixos.options',
                        },
                        home_manager = {
                            expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations.laura.options',
                        },
                    },
                },
            },
        },
    },
    keys = {
        { '<leader>cl', '<cmd>LspInfo<cr>', desc = 'Lsp Info' },
    },
    config = function(_, opts)
        lsp_utils.setup()

        -- Setup diagnostics

        for severity, icon in pairs(opts.diagnostics.signs.text) do
            local name = vim.diagnostic.severity[severity]:lower():gsub('^%l', string.upper)
            name = 'DiagnosticSign' .. name
            vim.fn.sign_define(name, { text = icon, texthl = name, numhl = '' })
        end

        vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

        -- Setup servers

        local blink = require('blink.cmp')
        local servers = opts.servers
        local capabilities = vim.tbl_deep_extend(
            'force',
            {},
            vim.lsp.protocol.make_client_capabilities(),
            blink.get_lsp_capabilities(),
            opts.capabilities or {}
        )

        local function setup(server)
            local server_opts = vim.tbl_deep_extend('force', {
                capabilities = vim.deepcopy(capabilities),
            }, server[server] or {})

            require('lspconfig')[server].setup(server_opts)
        end

        -- Get serevers available through mason-lspconfig
        -- local mlsp = require('mason-lspconfig')
        -- local all_mlsp_servers = vim.tbl_keys(require('mason-lspconfig.mappings.server').lspconfig_to_package)

        -- local ensure_installed = {}
        for server, server_opts in pairs(servers) do
            if server_opts then
                server_opts = server_opts == true and {} or server_opts
                if server_opts.enabled ~= false then
                    setup(server)
                    -- if server_opts.mason == false or not vim.tbl_contains(all_mlsp_servers, server) then
                    --     setup(server)
                    -- else
                    --     ensure_installed[#ensure_installed+1] = server
                    -- end
                end
            end
        end

        -- local util = require('util')
        -- mlsp.setup({
        --     ensure_installed = vim.tbl_deep_extend(
        --         'force',
        --         ensure_installed,
        --         util.get_plugin_opts('mason-lspconfig.nvim').ensure_installed or {}
        --     ),
        --     handlers = { setup },
        --     automatic_installation = true
        -- })
    end,
}

local mason = {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    keys = {
        { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' },
    },
    build = ':MasonUpdate',
    -- opts_extend = { 'ensure_installed' },
    opts = {
        ensure_installedd = {},
        -- ensure_installed = {
        --     -- 'lua-language-server',
        --     -- 'stylua',
        --     -- 'shfmt',
        --     -- 'python-lsp-server',
        --     -- 'gdtoolkit',
        --     -- 'hyprls'
        -- }
    },
    config = function(_, opts)
        require('mason').setup(opts)
        -- local mr = require('mason-registry')
        -- mr:on("package:install:success", function()
        --     vim.defer_fn(function()
        --         -- trigger FileType event to possibly load this newly installed LSP server
        --         require("lazy.core.handler.event").trigger({
        --             event = "FileType",
        --             buf = vim.api.nvim_get_current_buf(),
        --         })
        --     end, 100)
        -- end)
        --
        -- mr.refresh(function()
        --     for _, tool in pairs(opts.ensure_installed) do
        --         local p = mr.get_package(tool)
        --         if not p:is_installed() then
        --             p:install()
        --         end
        --     end
        -- end)
    end,
}

return {
    lspconfig,
}
