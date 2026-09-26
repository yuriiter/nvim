-- ====================================================
-- ==> init.lua (Corrected and Consolidated) <==
-- ====================================================
local toggle_bg_mod = require 'custom.plugins.toggle_bg'

local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable providers we don't use (silences checkhealth noise)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0

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
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.termguicolors = true
vim.opt.cmdheight = 1
vim.opt.shortmess:append "cW"

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
vim.keymap.set('n', '<leader><Tab>n', '<cmd>tabedit<cr>', { desc = 'Create new tab' })
vim.keymap.set('n', '<leader>w', '<cmd>wa<cr>', { desc = 'Write all' })
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>T', '<cmd>terminal<cr>', { desc = 'Create new terminal' })
vim.keymap.set('n', '<leader>n', '<cmd>cnext<cr>', { silent = true, desc = 'Next item in quickfix list' })
vim.keymap.set('n', '<leader>p', '<cmd>cprev<cr>', { silent = true, desc = 'Previous item in quickfix list' })
vim.keymap.set('n', '<C-U>', '<C-U>zz', { noremap = true, silent = true, desc = 'Scroll half page up, center cursor' })
vim.keymap.set('n', '<C-D>', '<C-D>zz', { noremap = true, silent = true, desc = 'Scroll half page down, center cursor' })
vim.keymap.set('n', '<C-B>', '<C-B>zz', { noremap = true, silent = true, desc = 'Scroll full page up, center cursor' })
vim.keymap.set('n', '<C-F>', '<C-F>zz', { noremap = true, silent = true, desc = 'Scroll full page down, center cursor' })

-- Diagnostics (work with or without an attached LSP server)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })

vim.keymap.set(
  'n',
  '<leader>nf',
  [[:lua vim.cmd("edit " .. vim.fn.system("uuidgen"):gsub("\n", "") .. ".yaml")<CR>]],
  { noremap = true, silent = true, desc = 'New UUID-named YAML file' }
)
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

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Lazy.nvim setup
if not vim.uv.fs_stat(lazypath) then
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

  { 'numToStr/Comment.nvim',    event = 'VeryLazy', opts = {} },

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
    'hedyhli/outline.nvim',
    cmd = { 'Outline', 'OutlineOpen' },
    keys = { { '<leader>cs', '<cmd>Outline<CR>', desc = '[C]ode [S]ymbols Outline' } },
    opts = {},
  },

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
    branch = 'master',
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
      pcall(require('telescope').load_extension, 'live_grep_args')
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
  -- LSP, LINTING, AND FORMATTING
  -- ==========================================================================
  -- Kept separate so `:Mason` works without loading the rest of the LSP stack.
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    opts = {},
  },

  {
    'neovim/nvim-lspconfig',
    -- Lazy: the LSP stack is only pulled in once a real buffer is read.
    -- Individual servers still start per filetype, so only needed ones run.
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim',      opts = {} },
      { 'folke/lazydev.nvim',     ft = 'lua', opts = {} },
      'hrsh7th/cmp-nvim-lsp',
      'SmiteshP/nvim-navic',
      'b0o/schemastore.nvim',
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Buffer-local keymaps + breadcrumbs. LspAttach runs even for servers that
      -- ship their own on_attach, so nothing gets clobbered.
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('user-lsp-attach', { clear = true }),
        callback = function(event)
          local bufnr = event.buf
          local client = vim.lsp.get_client_by_id(event.data.client_id)
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

          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, '[T]oggle Inlay [H]ints')
          end

          -- navic supports a single client per buffer; skip if already attached.
          if client and client.server_capabilities.documentSymbolProvider and vim.b[bufnr].navic_client_id == nil then
            require('nvim-navic').attach(client, bufnr)
          end
        end,
      })

      -- Advertise cmp capabilities to every server.
      vim.lsp.config('*', { capabilities = capabilities })

      -- Vue: vue_ls owns template + CSS/HTML, vtsls owns <script> through the
      -- @vue/typescript-plugin bundled with mason's vue-language-server.
      local vue_ts_plugin = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server'
      local vue_plugins = vim.uv.fs_stat(vue_ts_plugin) and {
        {
          name = '@vue/typescript-plugin',
          location = vue_ts_plugin,
          languages = { 'vue' },
          configNamespace = 'typescript',
          enableForWorkspaceTypeScriptVersions = true,
        },
      } or {}

      -- Per-server overrides (merged on top of the wildcard defaults above).
      local servers = {
        lua_ls = {
          settings = { Lua = { workspace = { checkThirdParty = false }, telemetry = { enable = false }, completion = { callSnippet = 'Replace' } } },
        },
        vtsls = {
          filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
          settings = {
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              tsserver = { globalPlugins = vue_plugins },
            },
            typescript = { updateImportsOnFileMove = { enabled = 'always' }, suggest = { completeFunctionCalls = true } },
          },
        },
        jsonls = {
          settings = { json = { schemas = require('schemastore').json.schemas(), validate = { enable = true } } },
        },
        yamlls = {
          settings = { yaml = { schemaStore = { enable = false }, schemas = require('schemastore').yaml.schemas() } },
        },
        eslint = {
          settings = { quiet = true, workingDirectories = { mode = 'auto' } },
        },
      }

      for server, config in pairs(servers) do
        vim.lsp.config(server, config)
      end

      -- Installed by mason, enabled here. Each one only starts when a matching
      -- filetype is opened.
      local ensure_installed = {
        -- web / markup / styles
        'vtsls', 'vue_ls', 'eslint', 'jsonls', 'cssls', 'html', 'tailwindcss',
        'emmet_language_server', 'astro', 'svelte', 'graphql', 'prismals',
        -- scripting / config
        'lua_ls', 'bashls', 'vimls',
        -- python
        'pyright', 'ruff',
        -- systems
        'clangd', 'gopls', 'rust_analyzer',
        -- other languages
        'jdtls', 'phpactor', 'ruby_lsp',
        -- data / docs / infra
        'yamlls', 'taplo', 'marksman', 'texlab', 'sqls',
        'dockerls', 'docker_compose_language_service', 'terraformls', 'ansiblels', 'helm_ls',
      }

      local mason = require 'mason'
      if not mason.has_setup then
        mason.setup()
      end

      require('mason-lspconfig').setup {
        ensure_installed = ensure_installed,
        automatic_enable = false,
      }

      require('mason-tool-installer').setup {
        ensure_installed = {
          -- formatters
          'stylua', 'prettierd', 'black', 'isort', 'goimports',
          'clang-format', 'php-cs-fixer', 'rubocop', 'shfmt',
          -- linters
          'shellcheck', 'hadolint', 'markdownlint', 'luacheck', 'yamllint',
        },
        run_on_start = true,
      }

      vim.lsp.enable(ensure_installed)
    end,
  },

  -- Linter bridge for languages without an LSP (or where a CLI linter is
  -- better). Runs on save/leave and only for the filetypes configured below.
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('lint').linters_by_ft = {
        bash = { 'shellcheck' },
        sh = { 'shellcheck' },
        zsh = { 'shellcheck' },
        dockerfile = { 'hadolint' },
        markdown = { 'markdownlint' },
        lua = { 'luacheck' },
        yaml = { 'yamllint' },
      }

      vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave' }, {
        group = vim.api.nvim_create_augroup('user-lint', { clear = true }),
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },

  {
    'stevearc/conform.nvim',
    -- Lazy: loads on the first save (or when <leader>f is used).
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      -- Format on save whenever a formatter (or an LSP with formatting) exists.
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 1000, lsp_format = 'fallback' }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        javascript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescript = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        vue = { 'prettierd' },
        astro = { 'prettierd' },
        svelte = { 'prettierd' },
        json = { 'prettierd' },
        jsonc = { 'prettierd' },
        css = { 'prettierd' },
        scss = { 'prettierd' },
        less = { 'prettierd' },
        html = { 'prettierd' },
        markdown = { 'prettierd' },
        yaml = { 'prettierd' },
        graphql = { 'prettierd' },
        go = { 'goimports' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        rust = { 'rustfmt' },
        php = { 'php_cs_fixer' },
        ruby = { 'rubocop' },
        sh = { 'shfmt' },
        bash = { 'shfmt' },
        zsh = { 'shfmt' },
      },
    },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
      vim.api.nvim_create_user_command('FormatDisable', function(args)
        if args.bang then
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, { desc = 'Disable autoformat-on-save', bang = true })
      vim.api.nvim_create_user_command('FormatEnable', function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, { desc = 'Re-enable autoformat-on-save' })
    end,
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
        group_empty_dirs = true,
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

  { 'ellisonleao/gruvbox.nvim', name = 'gruvbox',   priority = 1000 },
  -- 1. Catppuccin (Soft, pastel, very popular)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      term_colors = true,
      transparent_background = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        neotree = true,
        telescope = true,
        treesitter = true,
        mini = { enabled = true },
      },
    },
  },

  -- 2. Tokyo Night (Clean, professional, vibrant dark)
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- 3. Kanagawa (Inspired by Japanese art, desaturated, elegant)
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    opts = {
      transparent = false,
      theme = "wave", -- wave, dragon, lotus
      background = { dark = "wave", light = "lotus" },
    },
  },

  -- 4. Nightfox (Highly customizable, has 7 variants like Nord, Terra, etc.)
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
  },
  { 'maxmx03/fluoromachine.nvim', name = 'fluoromachine', priority = 1000 },
  { 'Mofiqul/vscode.nvim',        name = 'vscode',        priority = 1000 },
  {
    'MagicDuck/grug-far.nvim',
    config = function()
      require('grug-far').setup({
        -- options, see Configuration section below
        -- there are no required options whatsoever
      })
    end,
    keys = {
      {
        '<leader>rs',
        function()
          local grug = require('grug-far')
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            }
          })
        end,
        mode = { 'n', 'v' },
        desc = '[R]eplace [R]ipples (Global Search/Replace)',
      },
      {
        '<leader>rw',
        function()
          require('grug-far').open({ prefills = { search = vim.fn.expand("<cword>") } })
        end,
        mode = { 'n' },
        desc = '[R]eplace [W]ord (Global)',
      },
      {
        '<leader>rf',
        function()
          require('grug-far').open({ prefills = { paths = vim.fn.expand("%") } })
        end,
        mode = { 'n' },
        desc = '[R]eplace in Current [F]ile',
      },
    },
  },
  {
    'NvChad/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {
      filetypes = { "*", "!lazy", "!popup" },
      user_default_options = {
        names = false,       -- "Name" codes like Blue or Red
        rgb_fn = true,       -- CSS rgb() and rgba() functions
        hsl_fn = true,       -- CSS hsl() and hsla() functions
        css = true,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,       -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        tailwind = true,     -- Enable tailwind colors
      },
    },
  },
  {
    'tingey21/telescope-colorscheme-persist.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    lazy = false,
    config = function()
      require('telescope-colorscheme-persist').setup {
        keybind = '<leader>sc',
        fallback = 'tokyonight',
      }
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
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      bind = true,
      handler_opts = {
        border = "rounded"
      },
      hint_enable = true,     -- Show a small hint next to the cursor
      floating_window = true, -- Show a floating window with the full signature
    },
    config = function(_, opts)
      require('lsp_signature').setup(opts)
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

  -- nvim-treesitter on the `main` branch. The old `master` branch is frozen and
  -- crashes on Neovim 0.12 (e.g. markdown fenced code blocks). On `main`,
  -- highlighting and indentation have to be enabled manually.
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('user-treesitter', { clear = true }),
        callback = function()
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
    config = function()
      require('nvim-treesitter').setup {}
      -- No-op for parsers that are already installed.
      require('nvim-treesitter').install {
        'astro',
        'bash',
        'c',
        'cpp',
        'css',
        'dockerfile',
        'go',
        'graphql',
        'html',
        'java',
        'javascript',
        'json',
        'latex',
        'lua',
        'markdown',
        'markdown_inline',
        'php',
        'prisma',
        'python',
        'ruby',
        'rust',
        'scss',
        'sql',
        'svelte',
        'terraform',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'vue',
        'yaml',
      }
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    init = function()
      -- Avoid clashes with the built-in ftplugin mappings.
      vim.g.no_plugin_maps = true
    end,
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = { lookahead = true },
        move = { set_jumps = true },
      }

      local select = require 'nvim-treesitter-textobjects.select'
      local function textobject(query)
        return function()
          select.select_textobject(query, 'textobjects')
        end
      end
      vim.keymap.set({ 'x', 'o' }, 'af', textobject '@function.outer', { desc = 'Around function' })
      vim.keymap.set({ 'x', 'o' }, 'if', textobject '@function.inner', { desc = 'Inside function' })
      vim.keymap.set({ 'x', 'o' }, 'ac', textobject '@class.outer', { desc = 'Around class' })
      vim.keymap.set({ 'x', 'o' }, 'ic', textobject '@class.inner', { desc = 'Inside class' })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = 'VeryLazy',
    opts = { max_lines = 3 },
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

-- The active colorscheme is restored by telescope-colorscheme-persist
-- (fallback: tokyonight). Change it with <leader>sc.
