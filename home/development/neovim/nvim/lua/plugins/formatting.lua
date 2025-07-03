local conform = {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            python = {
                'ruff_format',
                'ruff_organize_imports',
            },
            nix = { 'alejandra' },
        },
        format_on_save = {
            timeout_ms = 600,
        },
    },
}
return {
    conform,
}
