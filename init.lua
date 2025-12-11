-- ====================================================
-- ==> init.lua (Corrected and Consolidated) <==
-- ====================================================
local toggle_bg_mod = require 'custom.plugins.toggle_bg'

vim.loader.enable()

local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Indentation settings
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.copyindent = true

vim.g.have_nerd_font = true

vim.g.tagbar_ctags_bin = '/usr/bin/ctags'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.pumheight = 8
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.lazyredraw = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 10
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true

-- Keymaps
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })
vim.keymap.set('n', '<leader>l', toggle_bg_mod.toggle_background, { desc = 'Toggle Background Light/Dark' })
vim.keymap.set('n', '<leader><Tab>d', '<cmd>tabclose<cr>', { desc = 'Close tab' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete Buffer' })
-- vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste without yanking' })
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
vim.keymap.set('n', '<leader>o', ':Neotree focus<CR>', { desc = 'Focus Neo-tree' })
vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Left in insert mode' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Right in insert mode' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Down in insert mode' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'Up in insert mode' })
vim.keymap.set('i', '<C-s>', '<cmd>wa<cr>', { desc = 'Save all in insert mode' })
vim.keymap.set('n', '<C-s>', '<cmd>wa<cr>', { desc = 'Save all in normal mode' })
vim.keymap.set({ 'i', 'n' }, '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move line down' })
vim.keymap.set({ 'i', 'n' }, '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move line up' })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<S-h>', 'gT', { desc = 'Move to the previous tab' })
vim.keymap.set('n', '<S-l>', 'gt', { desc = 'Move to the next tab' })
vim.keymap.set('n', '<leader>b', '<cmd>tabedit<cr>', { desc = 'Create new tab' })
vim.keymap.set('n', '<leader>w', '<cmd>wa<cr>', { desc = 'Write all' })
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>t', '<cmd>terminal<cr>', { desc = 'Create new terminal' })
vim.keymap.set('n', '<leader>n', '<cmd>cnext<cr>', { silent = true, desc = 'Next item in quickfix list' })
vim.keymap.set('n', '<leader>p', '<cmd>cprev<cr>', { silent = true, desc = 'Previous item in quickfix list' })
vim.keymap.set('n', '<C-U>', '<C-U>zz', { noremap = true, silent = true, desc = 'Scroll half page up, center cursor' })
vim.keymap.set('n', '<C-D>', '<C-D>zz', { noremap = true, silent = true, desc = 'Scroll half page down, center cursor' })
vim.keymap.set('n', '<C-B>', '<C-B>zz', { noremap = true, silent = true, desc = 'Scroll full page up, center cursor' })
vim.keymap.set('n', '<C-F>', '<C-F>zz', { noremap = true, silent = true, desc = 'Scroll full page down, center cursor' })
vim.keymap.set('n', '<leader>rf', [[:lua vim.cmd("edit " .. vim.fn.system("uuidgen"):gsub("\n", "") .. ".yaml")<CR>]],
  { noremap = true, silent = true })
vim.keymap.set(
  'n',
  '<Leader>rm',
  ':!mcv % --template=cv/v2/main.tex --output=yurii-tereshchenko-cv.pdf && mcv % --template=cover_letter/variant_2/main.tex --output=yurii-tereshchenko-cover-letter.pdf<CR>',
  { noremap = true }
)

vim.keymap.set('n', '<leader>:', function()
  require('telescope.builtin').commands({
    -- Add custom configuration to execute on selection
    attach_mappings = function(prompt_bufnr, map)
      local actions = require('telescope.actions')

      -- Map <CR> to close the picker and execute the command immediately
      actions.select_default:enhance({
        exec = function(_, entry)
          actions.close(prompt_bufnr)
          -- entry.value contains the command string (e.g., "qall!", "wa")
          vim.cmd(entry.value)
        end
      })

      return true -- Signal that the default mappings should be attached
    end,
    -- Custom prompt title for clarity
    prompt_title = 'Plugin & Vim Commands'
  })
end, { desc = '[S]earch & Execute Commands (Telescope)' })

-- Visual block indent/unindent continuously
vim.keymap.set('v', '<', '<gv', { desc = 'Unindent visual block (continuous)' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent visual block (continuous)' })

-- Keymap for Aerial (new)
-- vim.keymap.set('n', '<leader>at', '<cmd>AerialToggle<CR>', { desc = '[C]ode [A]erial Toggle' })

-- Keymap for Markdown Preview (new)
-- vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>', { desc = '[M]arkdown [P]review Toggle' })


vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Lazy.nvim setup
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-sleuth',

  {
    dir = vim.fn.stdpath 'config' .. '/lua/custom/plugins/html_to_bem_scss.nvim',
    name = 'html_to_bem_scss',
    lazy = false,
    config = function()
      local plugin_file = vim.fn.stdpath 'config' .. '/lua/custom/plugins/html_to_bem_scss.nvim/init.lua'
      dofile(plugin_file)
    end,
  },

  { 'numToStr/Comment.nvim',      event = 'VeryLazy',     opts = {} },

  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    opts = {
      signs = { add = { text = '|' }, change = { text = '|' }, delete = { text = '|' }, topdelete = { text = '|' }, changedelete = { text = '|' } },
      signcolumn = true,
      numhl = false,
      linehl = false,
      on_attach = function(bufnr)
        local gs = require 'gitsigns'
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gs.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git change' })
        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gs.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git change' })
        map('v', '<leader>hs', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Stage git hunk' })
        map('v', '<leader>hr', function()
          gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Reset git hunk' })
        map('n', '<leader>hs', gs.stage_hunk, { desc = 'Git stage hunk' })
        map('n', '<leader>hr', gs.reset_hunk, { desc = 'Git reset hunk' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = 'Git Stage buffer' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Git undo stage hunk' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = 'Git Reset buffer' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'Git preview hunk' })
        map('n', '<leader>hb', gs.blame_line, { desc = 'Git blame line' })
        map('n', '<leader>hd', gs.diffthis, { desc = 'Git diff against index' })
        map('n', '<leader>hD', function()
          gs.diffthis '@'
        end, { desc = 'Git diff against last commit' })
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Toggle git show blame line' })
        map('n', '<leader>tD', gs.toggle_deleted, { desc = 'Toggle git show Deleted' })
      end,
    },
  },

  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require('which-key').setup()
      require('which-key').add {
        { '<leader>c', group = '[C]ode' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>r', group = '[R]eplace' },
        { '<leader>h', group = 'Git [H]unk' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>m', group = '[M]arkdown' }, -- New group for Markdown
      }
    end,
  },

  {
    'simrat39/symbols-outline.nvim',
    cmd = 'SymbolsOutline',
    keys = { { '<leader>cs', '<cmd>SymbolsOutline<CR>', desc = '[C]ode [S]ymbols Outline' } },
    config = function()
      require('symbols-outline').setup()
    end,
  },

  -- Aerial Plugin (New)
  -- {
  --   'stevearc/aerial.nvim',
  --   cmd = { 'AerialToggle', 'AerialInfo' },
  --   keys = { { '<leader>at', '<cmd>AerialToggle<CR>', desc = 'Toggle [C]ode [A]erial Outline' } },
  --   opts = {
  --     close_on_select = true,
  --     layout = {
  --       max_width = 0.25,
  --     },
  --   },
  -- },

  -- Markdown Preview Plugin (New)
  -- {
  --   'iamcco/markdown-preview.nvim',
  --   cmd = { 'MarkdownPreview', 'MarkdownPreviewToggle' },
  --   ft = { 'markdown' },
  --   build = 'cd app && npm install',
  --   opts = {
  --     auto_start = false,
  --     -- Use a leader key mapping for convenience (already added in keymaps)
  --   }
  -- },

  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = { 'SmiteshP/nvim-navic', 'nvim-tree/nvim-web-devicons' },
    opts = {
      show_modified = true,
      show_dirname = true,
      custom_section = function()
        return ' '
      end,
      symbols = { modified = '●', ellipsis = '…', separator = '' },
    },
  },

  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-telescope/telescope-live-grep-args.nvim' },
      { 'nvim-tree/nvim-web-devicons',                 enabled = vim.g.have_nerd_font },
    },
    config = function()
      local lga_actions = require 'telescope-live-grep-args.actions'
      local actions = require 'telescope.actions'
      require('telescope').setup {
        extensions = {
          ['ui-select'] = { require('telescope.themes').get_dropdown() },
          live_grep_args = {
            auto_quoting = true,
            mappings = {
              i = {
                ['<C-k>'] = lga_actions.quote_prompt(),
                ['<C-i>'] = lga_actions.quote_prompt { postfix = ' --iglob ' },
                ['<C-space>'] = actions.to_fuzzy_refine,
              },
            },
          },
        },
      }
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'telescope-live-grep-args')
      local builtin = require 'telescope.builtin'

      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', require('telescope').extensions.live_grep_args.live_grep_args,
        { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false })
      end, { desc = '[/] Fuzzily search in current buffer' })
    end,
  },

  -- ==========================================================================
  -- LSP, FORMATTING, AND LINTING CONFIGURATION (THE IMPORTANT PART)
  -- ==========================================================================
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim',       opts = {} },
      { 'folke/neodev.nvim',       opts = {} },
      'hrsh7th/cmp-nvim-lsp',
      'SmiteshP/nvim-navic',
      'b0o/schemastore.nvim',
    },
    config = function()
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
      end

      map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
      map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
      map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
      map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      map('K', vim.lsp.buf.hover, 'Hover Documentation')
      map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      map('<leader>f', function()
        vim.lsp.buf.format { async = true }
      end, '[F]ormat Buffer')

      map('[d', vim.diagnostic.goto_prev, 'Go to previous diagnostic')
      map(']d', vim.diagnostic.goto_next, 'Go to next diagnostic')
      map('<leader>d', vim.diagnostic.open_float, 'Show line diagnostics')
      -- map('<leader>q', vim.diagnostic.setloclist, 'Set quickfix list from diagnostics')

      map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, '[T]oggle Inlay [H]ints')



      local on_attach = function(client, bufnr)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
        end

        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('<leader>f', function()
          vim.lsp.buf.format { async = true }
        end, '[F]ormat Buffer')

        map('[d', vim.diagnostic.goto_prev, 'Go to previous diagnostic')
        map(']d', vim.diagnostic.goto_next, 'Go to next diagnostic')
        map('<leader>d', vim.diagnostic.open_float, 'Show line diagnostics')
        -- map('<leader>q', vim.diagnostic.setloclist, 'Set quickfix list from diagnostics')

        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, '[T]oggle Inlay [H]ints')
        end

        if client.server_capabilities.documentSymbolProvider then
          require('nvim-navic').attach(client, bufnr)
        end
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Define server configurations
      local servers = {
        lua_ls = {
          settings = { Lua = { workspace = { checkThirdParty = false }, telemetry = { enable = false }, completion = { callSnippet = 'Replace' } } },
        },
        -- VTSLS is the single server for TS, JS, and Vue
        vtsls = {
          filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'vue' },
          settings = {
            vtsls = { enableMoveToFileCodeAction = true, autoUseWorkspaceTsdk = true },
            typescript = { updateImportsOnFileMove = { enabled = 'always' }, suggest = { completeFunctionCalls = true } },
          },
        },
        jsonls = {
          settings = { json = { schemas = require('schemastore').json.schemas(), validate = { enable = true } } },
        },
        eslint = {
          settings = { quiet = true, workingDirectories = { mode = 'auto' } },
        },
        -- Add other servers here as needed
        pyright = {},
        cssls = {},
        html = {},
        yamlls = {},
        bashls = {},
        tailwindcss = {},
        -- etc.
      }

      -- Mason setup
      require('mason').setup()

      -- List of LSPs to ensure are installed
      local ensure_installed = {
        'lua_ls',
        'vtsls', -- The ONLY server needed for Vue/TS/JS
        'eslint',
        'jsonls',
        'cssls',
        'html',
        'tailwindcss',
        'pyright',
        'yamlls',
        'bashls',
      }

      require('mason-lspconfig').setup {
        ensure_installed = ensure_installed,
        handlers = {
          function(server_name)
            local server_config = servers[server_name] or {}
            server_config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server_config.capabilities or {})
            server_config.on_attach = on_attach
            require('lspconfig')[server_name].setup(server_config)
          end,
        },
      }
    end,
  },

  {
    'stevearc/conform.nvim',
    lazy = false,
    opts = {
      notify_on_error = false,
      format_on_save = { lsp_fallback = true, timeout_ms = 500 },
      formatters_by_ft = {
        lua = { 'stylua' },
        typescript = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        javascript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        vue = { 'prettierd' }, -- Use prettierd for Vue
        json = { 'prettierd' },
        css = { 'prettierd' },
        scss = { 'prettierd' },
        html = { 'prettierd' },
        markdown = { 'prettierd' },
        yaml = { 'prettierd' },
        python = { 'black', 'isort' },
      },
    },
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim' },
    cmd = 'Neotree',
    keys = { { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } } },
    opts = {
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw = true,
        use_libuv_file_watcher = true,
      },
      window = { width = 30, mappings = { ['\\'] = 'close_window' } },
      default_component_configs = {
        indent = { padding = 1 },
        icon = { folder_closed = '', folder_open = '', default = '*' },
      },
    },
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPost',
    main = 'ibl',
    opts = {
      indent = { char = '│', tab_char = '│' },
      scope = { enabled = true },
      exclude = { filetypes = { 'help', 'alpha', 'dashboard', 'neo-tree', 'lazy', 'mason' } },
    },
  },

  'mg979/vim-visual-multi',

  {
    'preservim/tagbar',
    cmd = 'TagbarToggle',
    keys = { { '<leader>;', '<cmd>TagbarToggle<cr>', desc = 'Toggle Tagbar' } },
  },

  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },

  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp', dependencies = { 'rafamadriz/friendly-snippets' } },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      require('luasnip.loaders.from_vscode').lazy_load()
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-u>'] = cmp.mapping.scroll_docs(4),
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'buffer' },
        },
      }
    end,
  },

  { 'ellisonleao/gruvbox.nvim',   name = 'gruvbox',       priority = 1000 },
  { 'maxmx03/fluoromachine.nvim', name = 'fluoromachine', priority = 1000 },
  { 'Mofiqul/vscode.nvim',        name = 'vscode',        priority = 1000 },
  {
    'tingey21/telescope-colorscheme-persist.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    lazy = false,
    config = function()
      require('telescope-colorscheme-persist').setup { keybind = '<leader>sc' }
    end,
  },

  { 'folke/todo-comments.nvim', event = 'BufReadPost', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  'pteroctopus/faster.nvim',

  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup()
    end,
  },

  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      {
        's',
        mode = { 'n' },
        function()
          require('flash').jump {
            search = {
              mode = function(str)
                return '\\<' .. str
              end,
            },
            label = {
              after = false,
              before = true,
            },
          }
        end,
        desc = 'Flash Jump',
      },
    },
  },

  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.pairs').setup()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'css',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'python',
        'scss',
        'tsx',
        'typescript',
        'vim',
        'vue',
        'yaml',
        'go',
        'java',
        'php',
        'ruby',
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
      },
      context = { enable = true, max_lines = 3 },
    },
    config = function(_, opts)
      require('nvim-treesitter.install').prefer_git = true
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

local map = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
end
map('<leader>d', vim.diagnostic.open_float, 'Show line diagnostics')

-- Set a default colorscheme after all plugins are loaded
-- vim.cmd 'colorscheme vscode'
-- vim.o.background = 'dark'
