-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.cmd [[
  source $VIMRUNTIME/scripts/mswin.vim

  syntax on

  filetype plugin indent on
]]

vim.opt.undofile = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.textwidth=0 
vim.opt.wrapmargin=0
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff=1
vim.opt.lines=40 
vim.opt.columns=164
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.mouse='a'
vim.opt.keymodel:remove('stopsel')
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.list = false
vim.opt.formatoptions=l
vim.opt.swapfile = false
vim.opt.tabstop=2
vim.opt.expandtab = true
vim.opt.splitbelow = true
vim.opt.shiftwidth=2
vim.opt.hlsearch = true
vim.opt.selectmode='key'
vim.opt.selection='inclusive'
vim.opt.updatetime=300
vim.opt.cursorline = true
vim.opt.fillchars={eob = ' ', fold = "-"} 
vim.opt.wildignorecase = true
vim.opt.breakindent = true
vim.opt.startofline = false
vim.opt.title = true
vim.opt.equalalways = false
vim.opt.signcolumn='yes:1'
vim.opt.shada:append(",!")
vim.opt.viewoptions={'cursor', 'folds'}
vim.opt.sessionoptions:remove('folds')
vim.opt.sessionoptions:remove('help')
vim.opt.hidden = true
vim.opt.foldmethod="expr"
vim.opt.foldexpr="v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn='0'
vim.opt.foldlevel=99
vim.opt.foldtext=""
vim.opt.conceallevel = 2
vim.opt.completeopt={'menuone', 'noselect'}
vim.opt.breakindent = true
vim.opt.breakindentopt={shift = 2}
vim.opt.guifont='Hack Nerd Font Mono:h12'

vim.keymap.set("n", "-", require("oil").open_float, { desc = "Open parent directory" })

vim.keymap.set({ "n" }, "<LEADER>ns", require("package-info").show, { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<LEADER>nc", require("package-info").hide, { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<LEADER>nt", require("package-info").toggle, { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<LEADER>nu", require("package-info").update, { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<LEADER>nd", require("package-info").delete, { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<LEADER>ni", require("package-info").install, { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<LEADER>np", require("package-info").change_version, { silent = true, noremap = true })

vim.keymap.set('n', '<c-n>', require("conform").format)

vim.keymap.set('n', '<leader>r', '*``cgn', {remap = false})
vim.keymap.set('v', '<leader>r', [[ "y/\\v\<c-r>=escape(@\", '/')\<cr>\<cr>" . "``cgn" ]], {remap = false, expr = true})

vim.keymap.set('n', '<C-q>', ':q!<CR>')
vim.keymap.set('n', '<CR>', 'o')
vim.keymap.set('n', ';', ':', {remap = false})
vim.keymap.set('n', '<c-f>', '<c-u>', { remap = true })
vim.keymap.set('n', '<Leader><Leader>', 'V')
vim.keymap.set('v', '<Leader><Leader>', '<Esc>')
vim.keymap.set('x', '<', '<gv', {remap = false})
vim.keymap.set('x', '>', '>gv|', {remap = false})
vim.keymap.set({'n', 'i', 'v'}, '<PageUp>', '<left>')
vim.keymap.set({'n', 'i', 'v'}, '<PageDown>', '<right>')
vim.keymap.set('n', '<Backspace>', 'ciw')

vim.keymap.set('n', '<M-c>', 'gcc', {remap = true})
vim.keymap.set('v', '<M-c>', 'gc', {remap = true})
vim.keymap.set('n', '<M-S-c>', '<Leader>_b', {remap = true})
vim.keymap.set('v', '<M-S-c>', '<Leader>_b', {remap = true})

vim.keymap.set('n', '<C-L>', ':nohlsearch<cr>', {remap = false})

vim.keymap.set('n', 'n', 'nzz', {remap = false})
vim.keymap.set('n', 'N', 'Nzz', {remap = false})

vim.keymap.set('n', '<C-up>', ':m-2<CR>', {remap = false})
vim.keymap.set('n', '<C-down>', ':m+<CR>', {remap = false})
vim.keymap.set('v', '<C-up>', ':m-2<CR>gv=gv', {remap = false})
vim.keymap.set('v', '<C-down>', ":m'>+<CR>gv=gv", {remap = false})
vim.keymap.set('n', '<C-k>', ':m-2<CR>', {remap = false})
vim.keymap.set('n', '<C-j>', ':m+<CR>', {remap = false})
vim.keymap.set('v', '<C-k>', ':m-2<CR>gv=gv', {remap = false})
vim.keymap.set('v', '<C-j>', ":m'>+<CR>gv=gv", {remap = false})

vim.keymap.set('i', '<leader>c', "console.log(", { remap = true })

vim.keymap.set('i', '<leader>fa', "() => {<cr>", { remap = true })
vim.keymap.set('i', '<leader>ff', "function() {", { remap = true })

vim.keymap.set('n', '<leader>j', ":TSJJoin<cr>", { remap = true })
vim.keymap.set('n', '<leader>s', ":TSJSplit<cr>", { remap = true })
vim.keymap.set('n', '<M-j>', ":TSJJoin<cr>", { remap = true })
vim.keymap.set('n', '<M-s>', ":TSJSplit<cr>", { remap = true })

-- MAPPING WINDOWS

vim.keymap.set('n', '<C-A>', "ggVG", {remap = false})
vim.keymap.set('i', '<C-A>', "<C-O>gg<C-O>VG", {remap = false})
vim.keymap.set('c', '<C-A>', "<C-C>ggV<C-O>G", {remap = false})
vim.keymap.set('o', '<C-A>', "<C-C>ggV<C-O>G", {remap = false})
vim.keymap.set('s', '<C-A>', "<C-C>ggV<C-O>G", {remap = false})
vim.keymap.set('x', '<C-A>', "<C-C>ggVG", {remap = false})

-- MAPPING F

vim.keymap.set('n', '<F2>', ":Lazy<CR>")
vim.keymap.set('n', '<F3>', ":OverseerToggle<CR>")
vim.keymap.set('n', '<F4>', ":OverseerRun<CR>")
vim.keymap.set('n', '<F7>', ":tabnew<CR>")
vim.keymap.set('n', '<F8>', ":call system('explorer ' . expand('%:p:h'))<cr>")
vim.keymap.set('n', '<F9>', ":set number!<CR>")

-- MAPPING WINDOWS

vim.keymap.set('n', '<A-right>', ":set splitright<CR>:vnew<CR>")
vim.keymap.set('n', '<A-left>', ":set nosplitright<CR>:vnew<CR>")
vim.keymap.set('n', '<A-up>', ":set nosplitbelow<CR>:new<CR>")
vim.keymap.set('n', '<A-down>', ":set splitbelow<CR>:new<CR>")
vim.keymap.set('v', '<A-right>', "<esc>:set splitright<CR>:vnew<CR>", {remap = false})
vim.keymap.set('v', '<A-left>', "<esc>:set nosplitright<CR>:vnew<CR>", {remap = false})
vim.keymap.set('v', '<A-up>', "<esc>:set nosplitbelow<CR>:new<CR>", {remap = false})
vim.keymap.set('v', '<A-down>', "<esc>:set splitbelow<CR>:new<CR>", {remap = false})
vim.keymap.set('n', '<leader>=', "<C-w>=", {remap = false})
vim.keymap.set('n', '<Tab>', "<C-w><C-w>")

-- MAPPING FOLDS

vim.keymap.set('n', '<2-LeftMouse>', "foldclosed(line('.')) == -1 ? '<2-LeftMouse>' : 'zo'", {remap = false, expr = true})
vim.keymap.set('n', '<C-CR>', "&foldlevel == 0 ? 'zR' :'zM'", {remap = false, expr = true})
vim.keymap.set('n', '<M-CR>', "&foldlevel == 0 ? 'zRzMzo' :'zMzo'", {remap = false, expr = true})

-- MAPPING TABS

vim.keymap.set('n', '<leader>t', ":tabnew<CR>")

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', '<leader>f', function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})

vim.api.nvim_create_autocmd('TermOpen', { pattern = '*', command = 'setlocal nobuflisted' })

vim.api.nvim_create_autocmd('VimEnter', { pattern = '*', command = 'cd c:\\Users\\ender\\Desktop\\projects' })

local AutoSaveFolds = vim.api.nvim_create_augroup('AutoSaveFolds', {clear = true})
vim.api.nvim_create_autocmd('BufWinLeave', { pattern = '?*', group = AutoSaveFolds, command = 'silent! mkview!' })
vim.api.nvim_create_autocmd('BufLeave', { pattern = '?*', group = AutoSaveFolds, command = 'silent! mkview!' })
vim.api.nvim_create_autocmd('BufWritePost', { pattern = '?*', group = AutoSaveFolds, command = 'silent! mkview!' })
vim.api.nvim_create_autocmd('BufWinEnter', { pattern = '?*', group = AutoSaveFolds, command = 'silent! loadview' })

local CursorLine = vim.api.nvim_create_augroup('CursorLine', {clear = true})
vim.api.nvim_create_autocmd('InsertLeave', { pattern = '*', group = CursorLine, command = 'set cursorline' })
vim.api.nvim_create_autocmd('WinEnter', { pattern = '*', group = CursorLine, command = 'set cursorline' })
vim.api.nvim_create_autocmd('InsertEnter', { pattern = '*', group = CursorLine, command = 'set nocursorline' })
vim.api.nvim_create_autocmd('WinLeave', { pattern = '*', group = CursorLine, command = 'set nocursorline' })

require("lazy").setup({
  spec = {
    {
      'nvim-lua/plenary.nvim',
    },
    {
      "nvim-tree/nvim-web-devicons",
    },
    {
      'catppuccin/nvim',
      name = "catppuccin",
      priority = 1000,
      config = function()
        require("catppuccin").setup({
          flavour = "macchiato",
          integrations = {
            flash = false,
          }
        })
        vim.cmd([[colorscheme catppuccin]])
      end,
    },
    {
      'sainnhe/everforest',
    },
    {
      'EdenEast/nightfox.nvim',
    },
    {
      "savq/melange-nvim"
    },
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      config = function()
        require 'nvim-treesitter.install'.compilers = { "clang" }

        require('nvim-treesitter.configs').setup{
          highlight = {
            enable = true,
          },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = ",",
              node_incremental = ",",
              node_decremental = "<C-,>",
            },
          },
          ensure_installed = { "javascript", "html", "json", "lua", "markdown", "css", "liquid", "vue" },
        }
      end,
    },
    {
      'pangloss/vim-javascript',
    },
    {
      'HerringtonDarkholme/yats.vim',
    },
    {
      "rafamadriz/friendly-snippets",
    },
    {
      'Wansmer/treesj',
      opts = {
        use_default_keymaps = false,
      }
    },
    {
      'lewis6991/gitsigns.nvim',
      opts = {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        signs_staged = {
          add          = { text = '+s' },
          change       = { text = '~s' },
          delete       = { text = '_s' },
          topdelete    = { text = '‾s' },
          changedelete = { text = '~s' },
        },
      }
    },
    {
      'neovim/nvim-lspconfig',
      config = function()
        require'lspconfig'.volar.setup{
          init_options = {
            typescript = {
              tsdk = 'C:/Users/ender/AppData/Roaming/npm/node_modules/typescript/lib'
            }
          },
          filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
        }

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        require('lspconfig').emmet_ls.setup({
            capabilities = capabilities,
            filetypes = { "css", "eruby", "html", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue", "liquid" },
            init_options = {
              html = {
                options = {
                  ["bem.enabled"] = true,
                },
              },
            }
        })

        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '▶',
                    [vim.diagnostic.severity.WARN] = '▶',
                    [vim.diagnostic.severity.HINT] = '▶',
                    [vim.diagnostic.severity.INFO] = '▶',
                },
            },
            virtual_lines = true

            -- Alternatively, customize specific options
            -- virtual_lines = {
            --  -- Only show virtual line diagnostics for the current cursor line
            --  current_line = true,
            -- },
        })
      end,
    },
    {
      'folke/trouble.nvim',
      opts = {},
    },
    {
      'nvim-lualine/lualine.nvim',
      opts = {
        options = {section_separators='', component_separators='', theme='auto'}
      }
    },
    {
      'karb94/neoscroll.nvim',
      opts = {
        mappings = {'<C-u>', '<C-d>', 'zt', 'zz', 'zb'},
      }
    },
    {
      "petertriho/nvim-scrollbar",
      config = function()
        require("scrollbar").setup()
        require("scrollbar.handlers.search").setup({
            override_lens = function() end,
        })
      end,
    },
    {
      'akinsho/bufferline.nvim',
      version = "*",
      opts = {
        options = {
          mode = "tabs",
          numbers = "none",
          themable = false,
          indicator = {
            icon = '▎',
            style = 'icon',
          },
          buffer_close_icon = '',
          modified_icon = '●',
          close_icon = '',
          left_trunc_marker = '',
          right_trunc_marker = '',
          max_name_length = 18,
          max_prefix_length = 15,
          tab_size = 18,
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          always_show_bufferline = false,
          separator_style = "slant",
          sort_by = 'tabs',
        }
      }
    },
    {
      'rcarriga/nvim-notify',
      config = function()
        vim.notify = require("notify")
      end,
    },
    {
      "folke/which-key.nvim",
      opts = {},
    },
    {
      "kevinhwang91/nvim-hlslens",
      opts = {},
    },
    {
      'folke/todo-comments.nvim',
      opts = {},
    },
    {
      'nacro90/numb.nvim',
      opts = {},
    },
    {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup{
          fast_wrap = {},
        }

        local Rule = require('nvim-autopairs.rule')
        local ts_conds = require 'nvim-autopairs.ts-conds'

        require('nvim-autopairs').add_rules {
          Rule('{{', '  }', 'vue')
            :set_end_pair_length(2)
            :with_pair(ts_conds.is_ts_node 'text'),
        }
      end,
    },
    {
      'max397574/better-escape.nvim',
      opts = {
        timeout = vim.o.timeoutlen,
        default_mappings = false,
        mappings = {
            i = { j = { j = "<Esc>" } },
            c = { j = { j = "<Esc>" } },
            t = { j = { j = "<Esc>" } },
            v = { j = { k = "<Esc>" } },
            s = { j = { k = "<Esc>" } },
        },
      }
    },
    {
      'kylechui/nvim-surround',
      opts = {},
    },
    {
      'numToStr/Comment.nvim',
      opts = {},
    },
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          javascript = { "prettier", stop_after_first = true, timeout_ms = 10000 },
          html = { "prettier", stop_after_first = true, timeout_ms = 10000 },
          liquid = { "prettier", stop_after_first = true, timeout_ms = 10000 },
        },
      }
    },
    {
      "MunifTanjim/nui.nvim",
    },
    {
      "vuki656/package-info.nvim",
      opts = {},
    },
    {
      'stevearc/oil.nvim',
      opts = {
        float = {
          padding = 4,
          max_width = 0,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
        },
      }
    },
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      opts = {},
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      }
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      opts = {
        scope = {
          enabled = false,  
          show_start = false,
        },
        exclude = {
          filetypes = { "text" }
        }
      },
      main = "ibl",
    },
    {
      "brenoprata10/nvim-highlight-colors",
      opts = {},
    },
    {
      "saghen/blink.cmp",
      version = "v1.1.1",
      opts = {
        keymap = {
          preset = "none",

          ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
          ['<C-e>'] = { 'hide', 'fallback' },
          ['<CR>'] = { 'accept', 'fallback' },

          ['<Tab>'] = {
            function(cmp)
              if cmp.snippet_active() then return cmp.accept()
              else return cmp.select_next() end
            end,
            'snippet_forward',
            'fallback'
          },
          ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

          ['<Up>'] = { 'select_prev', 'fallback' },
          ['<Down>'] = { 'select_next', 'fallback' },
          ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
          ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

          ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
          ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

          ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
        },
        completion = {
          trigger = {
            show_in_snippet = false,
          },
          list = {
            selection = {
              preselect = false,
            }
          },
          documentation = {
            auto_show = true,
          }
        },
      }
    },
    {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      opts = {
        picker = {
          layout = {
            preset = "telescope",
          },
          win = {
            input = {
              keys = {
                ["<Esc>"] = { "close", mode = { "n", "i" } },
              }
            }
          }
        },
        zen = {
          enabled = true,
          toggles = {
            dim = false,
          }
        }
      },
      keys = {
        { "<space>", function() Snacks.picker.buffers({ layout = { preset = "select" }, current = false }) end, desc = "Buffers" },
        { "<leader>l", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>;", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<C-p>", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
        { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
        { "<leader>gc", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
        { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
        { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
        { "<leader>f", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
        { "<M-1>", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        { "<F1>", function() Snacks.picker.help() end, desc = "Help Pages" },
        { "<leader>h", function() Snacks.picker.highlights() end, desc = "Highlights" },
        { "<leader>m", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
        { "<leader><cr>", function() Snacks.picker.resume() end, desc = "Resume" },
        { "<leader>u", function() Snacks.picker.undo() end, desc = "Undo History" },
        { "<leader>c", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
        { "<leader>i", function() Snacks.picker.icons() end, desc = "Icons" },
        { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
        { "<F11>", function() Snacks.lazygit() end, desc = "Lazygit" },
        { "<leader>G", function() Snacks.lazygit() end, desc = "Lazygit" },
      }
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {},
    },
    {
      'stevearc/overseer.nvim',
      opts = {},
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})
