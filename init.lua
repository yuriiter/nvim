local toggle_bg_mod = require 'custom.plugins.toggle_bg'

vim.loader.enable()

local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

vim.opt.shiftwidth = 2

vim.opt.pumheight = 8
vim.opt.relativenumber = true

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

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>l', toggle_bg_mod.toggle_background, { desc = 'Toggle Background Light/Dark' })
vim.keymap.set('n', '<leader><Tab>d', '<cmd>tabclose<cr>==', { desc = 'Close tab' })

vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
vim.keymap.set('n', '<leader>o', ':Neotree focus<CR>', { desc = 'Focus Neo-tree' })

vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Left in insert mode' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Right in insert mode' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Down in insert mode' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'Up in insert mode' })
vim.keymap.set('i', '<C-s>', '<cmd>wa<cr>', { desc = 'Save all in insert mode' })
vim.keymap.set('n', '<C-s>', '<cmd>wa<cr>', { desc = 'Save all in normal mode' })

vim.keymap.set({ 'i', 'n' }, '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move line up' })
vim.keymap.set({ 'i', 'n' }, '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move line down' })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })

-- vim.keymap.set('n', '<leader>l', ':DarkLightSwitch<CR>', { noremap = true })
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
--
vim.keymap.set('n', '<leader>n', '<cmd>cnext<cr>', { silent = true, desc = 'Next item in quickfix list' })
vim.keymap.set('n', '<leader>p', '<cmd>cprev<cr>', { silent = true, desc = 'Previous item in quickfix list' })

vim.keymap.set('n', '<C-U>', '<C-U>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-D>', '<C-D>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-B>', '<C-B>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-F>', '<C-F>zz', { noremap = true, silent = true })

-- Search and replace in the current file
-- vim.api.nvim_set_keymap('n', '<leader>r', ':%s/', { noremap = true })

vim.keymap.set('n', '<leader>rf', [[:lua vim.cmd("edit " .. vim.fn.system("uuidgen"):gsub("\n", "") .. ".yaml")<CR>]], { noremap = true, silent = true })
vim.keymap.set(
  'n',
  '<Leader>rm',
  ':!mcv % --template=cv/v2/main.tex --output=yurii-tereshchenko-cv.pdf && mcv % --template=cover_letter/variant_2/main.tex --output=yurii-tereshchenko-cover-letter.pdf<CR>',
  { noremap = true }
)

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  'tpope/vim-sleuth',

  { 'numToStr/Comment.nvim', event = 'VeryLazy', opts = {} },
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '-' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  -- {
  --   'brianhuster/autosave.nvim',
  --   event = 'InsertEnter',
  --   opts = {},
  -- },

  -- {
  --   'yorik1984/zola.nvim',
  --   ft = { 'zola', 'markdown' },
  --   dependencies = 'Glench/Vim-Jinja2-Syntax',
  -- },

  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require('which-key').setup()
      require('which-key').add {
        { '', group = '[C]ode' },
        { '', group = '[S]earch' },
        { '', group = '[R]ename' },
        { '', group = 'Git [H]unk' },
        { '', desc = '', hidden = true, mode = { 'n', 'n', 'n', 'n' } },
      }
      require('which-key').add {
        { '', desc = '', mode = 'v' },
      }
    end,
  },

  {
    'simrat39/symbols-outline.nvim',
    event = 'BufReadPost',
    config = function()
      require('symbols-outline').setup()
    end,
  },
  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      show_modified = true,
      show_dirname = true,
      custom_section = function()
        return ' '
      end,
      -- You can remove the theme section entirely to use your colorscheme
      symbols = {
        modified = '●',
        ellipsis = '…',
        separator = '',
      },
      kinds = {
        -- ... your kinds configuration stays the same
      },
    },
    config = function(_, opts)
      -- Setup barbecue
      require('barbecue').setup(opts)

      -- Make sure navic gets attached when LSP server attaches
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local buffer = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          -- Only attach if the LSP server supports document symbols
          if client.server_capabilities.documentSymbolProvider then
            require('nvim-navic').attach(client, buffer)
          end
        end,
      })
    end,
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
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      local lga_actions = require 'telescope-live-grep-args.actions'
      local actions = require 'telescope.actions'
      require('telescope').setup {
        defaults = {
          preview = {
            filesize_limit = 0.5555,
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          file_browser = {
            theme = 'ivy',
            hijack_netrw = true,
            mappings = {
              -- ['i'] = {},
              -- ['n'] = {},
            },
          },
          live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            -- define mappings, e.g.
            mappings = { -- extend mappings
              i = {
                ['<C-k>'] = lga_actions.quote_prompt(),
                ['<C-i>'] = lga_actions.quote_prompt { postfix = ' --iglob ' },
                -- freeze the current list and start a fuzzy search in the frozen list
                ['<C-space>'] = actions.to_fuzzy_refine,
              },
            },
          },
        },
      }
      -- pcall(require('telescope').load_extension, 'file_browser')
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'telescope-live-grep-args')
      local builtin = require 'telescope.builtin'
      -- vim.keymap.set('n', '<space>e', ':Telescope file_browser<CR>')
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', require('telescope').extensions.live_grep_args.live_grep_args, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      vim.keymap.set('n', '<Tab>', '<cmd>bn<cr>', { desc = 'Next buffer' })
      vim.keymap.set('n', '<S-Tab>', '<cmd>bp<cr>', { desc = 'Previous buffer' })
      vim.keymap.set('i', '<Tab>', '<Esc>', { desc = 'Escape' })
      vim.keymap.set('v', '<', '<gv')
      vim.keymap.set('v', '>', '>gv')

      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'jose-elias-alvarez/nvim-lsp-ts-utils',
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
      }

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua',
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
      require 'custom/plugins/lsp'
    end,
  },
  {
    'stevearc/conform.nvim',
    lazy = false,
    opts = {
      notify_on_error = false,
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        typescript = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        javascript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        vue = { 'prettierd' },
        json = { 'prettierd' },
        css = { 'prettierd' },
        html = { 'prettierd' },
        markdown = { 'prettierd' },
        yaml = { 'prettierd' },
        python = { 'black' },
        rust = { 'rustfmt' },
        go = { 'gofmt' },
        php = { 'phpcbf' },
        ruby = { 'rubocop' },
        java = { 'google-java-format' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        swift = { 'swiftformat' },
        xml = { 'xmllint' },
        sql = { 'sqlfmt' }, -- For example, sqlfmt for SQL
        bash = { 'shfmt' },
        dockerfile = { 'dockfmt' },
        jsonc = { 'prettierd' }, -- For JSON with comments
        toml = { 'taplo' },
      },
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup {
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
          hijack_netrw = true, -- Replaces netrw with Neo-tree
          use_libuv_file_watcher = true,
        },
        window = {
          width = 30,
        },
        default_component_configs = {
          indent = {
            padding = 1,
          },
          icon = {
            folder_closed = '',
            folder_open = '',
            default = '*',
          },
        },
      }
    end,
  },
  -- {
  --   'nvim-telescope/telescope-file-browser.nvim',
  --   dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  -- },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPost',
    main = 'ibl',
    opts = {
      indent = {
        char = '│',
        tab_char = '│',
      },
      scope = { enabled = true },
      exclude = {
        filetypes = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
      },
    },
  },

  'mg979/vim-visual-multi',
  {
    'preservim/tagbar',
    cmd = 'TagbarToggle',
    config = function()
      vim.keymap.set('n', '<leader>;', '<cmd>TagbarToggle<cr>')
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    ft = { 'html', 'xml', 'javascript', 'typescriptreact', 'javascriptreact', 'svelte', 'vue' },
    config = function()
      require('nvim-ts-autotag').setup {
        filetypes = { 'html', 'xml', 'javascript', 'typescriptreact', 'javascriptreact', 'svelte', 'vue' },
        skip_tags = {
          'area',
          'base',
          'br',
          'col',
          'command',
          'embed',
          'hr',
          'img',
          'slot',
          'track',
          'wbr',
          'param',
          'source',
        },
        autotag = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
        },
      }
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
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
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },

  {
    'ellisonleao/gruvbox.nvim',
  },
  { 'maxmx03/fluoromachine.nvim' },
  {
    'tingey21/telescope-colorscheme-persist.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    lazy = false,
    config = function()
      require('telescope-colorscheme-persist').setup {
        keybind = '<leader>sc',
      }
    end,
  },
  {
    'Mofiqul/vscode.nvim',
    priority = 1000,
    -- init = function()
    --   vim.cmd.colorscheme 'vscode'
    --   vim.o.background = 'light'
    --
    --   vim.cmd.hi 'Comment gui=none'
    -- end,
  },

  {
    'folke/todo-comments.nvim',
    event = 'BufReadPost',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  'pteroctopus/faster.nvim',

  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
      modes = {
        search = {
          enabled = false,
        },
        char = {
          enabled = false,
        },
      },
    },
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
  -- {
  --   'eliseshaffer/darklight.nvim',
  --   config = function()
  --     require('darklight').setup()
  --   end,
  -- },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' },

      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
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
