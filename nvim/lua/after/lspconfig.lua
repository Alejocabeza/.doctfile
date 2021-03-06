local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')

local function on_attach(client, bufnr)

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Mappings.
    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'gk', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    -- formating
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[ augroup Format ]]
        vim.api.nvim_command [[ autocmd! * <buffer> ]]
        vim.api.nvim_command [[ autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync() ]]
        vim.api.nvim_command [[ augroup END ]]
    end


    protocol.CompletionItemKind = {
        '???', -- Text
        '???', -- Method
        '???', -- Function
        '???', -- Constructor
        '???', -- Field
        '???', -- Variable
        '???', -- Class
        '???', -- Interface
        '???', -- Module
        '???', -- Property
        '???', -- Unit
        '???', -- Value
        '???', -- Enum
        '???', -- Keyword
        '???', -- Snippet
        '???', -- Color
        '???', -- File
        '???', -- Reference
        '???', -- Folder
        '???', -- EnumMember
        '???', -- Constant
        '???', -- Struct
        '???', -- Event
        '???', -- Operator
        '???', -- TypeParameter
    }

end

nvim_lsp.flow.setup {
    on_attach = on_attach
}

nvim_lsp.tsserver.setup{
  on_attach = on_attach,
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' }
}

nvim_lsp.intelephense.setup{
    on_attach = on_attach,
    filetypes = { 'php' }
}

nvim_lsp.dockerls.setup {
    on_attach = on_attach,
    filetypes = { 'dockerfile' }
}

nvim_lsp.vimls.setup{
    on_attach = on_attach,
    filetypes = { 'vim' }
}

nvim_lsp.yamlls.setup{
    on_attach = on_attach,
    filetypes = { 'yaml', 'yaml.docker-compose', 'yml' }
}

nvim_lsp.sqls.setup{
    on_attach = on_attach,
    filetypes = { "sql", "mysql" }
}

nvim_lsp.diagnosticls.setup{
    on_attach = on_attach,
}
