local lspconfig = require 'lspconfig'
local ts_utils = require 'nvim-lsp-ts-utils'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

-- Configure the signature help window
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  -- These settings prevent focus from moving to the signature window
  focusable = false,
  border = 'rounded',
  -- You can adjust these settings for position
  relative = 'cursor',
  row = 1,
  col = 0,
})

local function enable_signature_help(client, bufnr)
  -- Optional manual trigger
  vim.keymap.set('i', '<C-i>', vim.lsp.buf.signature_help, { noremap = true, silent = true, buffer = bufnr })
end

local on_attach = function(client, bufnr)
  enable_signature_help(client, bufnr)
end

-- Rest of your configuration remains the same
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        completion = { callSnippet = 'Replace' },
      },
    },
  },
  pyright = { capabilities = capabilities },
  clangd = { capabilities = capabilities },
  gopls = { capabilities = capabilities },
  ts_ls = {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      ts_utils.setup_client(client)
      on_attach(client, bufnr)
    end,
  },
  rust_analyzer = { capabilities = capabilities },
  cssls = { capabilities = capabilities },
  html = { capabilities = capabilities },
  jsonls = { capabilities = capabilities },
  volar = { capabilities = capabilities },
  csharp_ls = { capabilities = capabilities },
  jdtls = { capabilities = capabilities },
  eslint = {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        command = 'EslintFixAll',
      })
    end,
    settings = {
      quiet = true,
      workingDirectories = { mode = 'auto' },
    },
  },
}

-- Apply configurations to each server
for server_name, config in pairs(servers) do
  config.on_attach = config.on_attach or on_attach
  lspconfig[server_name].setup(config)
end

-- Setup mason-tool-installer
local ensure_installed = {
  'stylua',
  'pyright',
  'clangd',
  'gopls',
  'typescript-language-server',
  'rust-analyzer',
  'css-lsp',
  'html-lsp',
  'json-lsp',
  'vue-language-server',
  'csharp-language-server',
  'jdtls',
  'eslint-lsp',
}

require('mason-tool-installer').setup {
  ensure_installed = ensure_installed,
  auto_update = true,
}
