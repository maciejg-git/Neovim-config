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
-- vim.opt.foldmethod="expr"
-- vim.opt.foldexpr="v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldmethod="indent"
vim.opt.foldmethod="manual"
vim.opt.foldcolumn='0'
vim.opt.foldlevel=99
vim.opt.foldtext=""
vim.opt.conceallevel = 2
vim.opt.completeopt={'menuone', 'noselect'}
vim.opt.breakindent = true
vim.opt.breakindentopt={shift = 2}
vim.opt.guifont='Hack Nerd Font Mono:h12'
vim.opt.wildignore:append("**/share/nvim/runtime/colors/*.vim")
vim.opt.wildignore:append("**/share/nvim/runtime/colors/*.lua")

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

vim.keymap.set('n', '<C-A>', "ggVG", {remap = false})
vim.keymap.set('i', '<C-A>', "<C-O>gg<C-O>VG", {remap = false})
vim.keymap.set('c', '<C-A>', "<C-C>ggV<C-O>G", {remap = false})
vim.keymap.set('o', '<C-A>', "<C-C>ggV<C-O>G", {remap = false})
vim.keymap.set('s', '<C-A>', "<C-C>ggV<C-O>G", {remap = false})
vim.keymap.set('x', '<C-A>', "<C-C>ggVG", {remap = false})

vim.keymap.set('n', '<F2>', ":Lazy<CR>")
vim.keymap.set('n', '<F3>', ":Mason<CR>")
vim.keymap.set('n', '<F9>', ":OverseerToggle<CR>")
vim.keymap.set('n', '<F10>', ":OverseerRun<CR>")
vim.keymap.set('n', '<F11>', ":OverseerLoadBundle<CR>")

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

vim.keymap.set('n', '<2-LeftMouse>', "foldclosed(line('.')) == -1 ? '<2-LeftMouse>' : 'zo'", {remap = false, expr = true})
vim.keymap.set('n', '<C-CR>', "&foldlevel == 0 ? 'zR' :'zM'", {remap = false, expr = true})
vim.keymap.set('n', '<M-CR>', "&foldlevel == 0 ? 'zRzMzo' :'zMzo'", {remap = false, expr = true})

vim.keymap.set('n', '<leader>t', ":tabnew<CR>")

vim.lsp.config('vtsls', {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {{
          name = '@vue/typescript-plugin',
          languages = { 'vue' },
          configNamespace = 'typescript',
          location = vim.fn.stdpath('data') .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
        }},
      },
    },
  },
})

vim.lsp.enable('vtsls')
vim.lsp.enable('vue_ls')
vim.lsp.enable('emmet_ls')
vim.lsp.enable('eslint')

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '▶',
      [vim.diagnostic.severity.WARN] = '▶',
      [vim.diagnostic.severity.HINT] = '▶',
      [vim.diagnostic.severity.INFO] = '▶',
    },
  },
  -- virtual_lines = true
  virtual_text = true

  -- Alternatively, customize specific options
  -- virtual_lines = {
  --  -- Only show virtual line diagnostics for the current cursor line
  --  current_line = true,
  -- },
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
          flavour = "latte",
          integrations = {
            flash = false,
          }
        })
        vim.cmd([[colorscheme catppuccin]])
      end,
    },
    {
      'sainnhe/everforest',
      priority = 1000,
    },
    {
      'EdenEast/nightfox.nvim',
      priority = 1000,
    },
    {
      "savq/melange-nvim",
      priority = 1000,
    },
    {
      "abreujp/scholar.nvim",
      priority = 1000,
      config = function()
        require("scholar").setup()
      end,
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
      'echasnovski/mini.diff', 
      opts = {
        view = {
            style = vim.go.number and 'number' or 'sign',
            signs = {
              add = '+',
              change = '~',
              delete = '-',
            },
          },
      },
      keys = {
        { "<leader>d", mode = { "n" }, function() MiniDiff.toggle_overlay() end, desc = "Toggle diff" },
      },
      lazy = false,
      version = false 
    },
    {
      'neovim/nvim-lspconfig',
    },
    {
      'folke/trouble.nvim',
      opts = {},
    },
    {
      'nvim-lualine/lualine.nvim',
      opts = {
        options = {
          section_separators='',
          component_separators={ left = '│', right = '' },
          theme='auto'
        },
        sections = {
          -- lualine_b = { {'b:gitsigns_head', icon = ''}, 'diff', 'diagnostics', 'overseer' },
          lualine_b = { 'branch', 'diff', 'diagnostics', 'overseer' },
        },
        extensions = {
          'overseer'
        }
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
          always_show_bufferline = false,
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
      },
      keys = {
        { '<c-n>', mode = { "n" }, function() require("conform").format() end }
      }
    },
    {
      "MunifTanjim/nui.nvim",
    },
    {
      "vuki656/package-info.nvim",
      ft = "json",
      opts = {},
      keys = {
        { "<LEADER>ns", mode = { "n" }, function() require("package-info").show() end },
        { "<LEADER>nc", mode = { "n" }, function() require("package-info").hide() end },
        { "<LEADER>nt", mode = { "n" }, function() require("package-info").toggle() end },
        { "<LEADER>nu", mode = { "n" }, function() require("package-info").update() end },
        { "<LEADER>nd", mode = { "n" }, function() require("package-info").delete() end },
        { "<LEADER>ni", mode = { "n" }, function() require("package-info").install() end },
        { "<LEADER>np", mode = { "n" }, function() require("package-info").change_version() end },
      }
    },
    {
      'stevearc/oil.nvim',
      event = "VeryLazy",
      opts = {
        float = {
          padding = 4,
          max_width = 0,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          preview_split = "right",
        },
      },
      keys = {
        { "-", mode = { "n" }, function() require("oil").open_float() end, desc = "Open parent directory" },
      }
    },
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      opts = {
        modes = {
          char = {
            keys = { "f", "F" },
          }
        }
      },
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
          filetypes = { "text", "markdown" }
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
      version = "v1.3.1",
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
                ["<C-c>"] = "cancel",
              }
            }
          }
        },
        zen = {
          enabled = true,
          toggles = {
            dim = false,
          }
        },
        scratch = {
          ft = "markdown",
          filekey = {
            cwd = true,
            branch = false,
            count = true,
          },
        }
      },
      keys = {
        { "<space>", function() Snacks.picker.buffers({ layout = { preset = "select" }, current = false }) end, desc = "Buffers" },
        { "<leader>l", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>;", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>:", function() Snacks.picker.commands() end, desc = "Commands" },
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
        { "<leader>T", function() Snacks.picker.todo_comments() end, desc = "Todo" },
        { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
        { "<leader>G", function() Snacks.lazygit() end, desc = "Lazygit" },
        { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
        { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      }
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {},
    },
    {
      'stevearc/overseer.nvim',
      opts = {
        task_list = {
          min_height = 16,
        }
      },
    },
    {
      "FabijanZulj/blame.nvim",
      lazy = false,
      config = function()
        require('blame').setup()
      end,
    },
    {
      "mason-org/mason.nvim",
      opts = {},
    },
    { 
      'echasnovski/mini.files', 
      version = false,
      opts = {
        mappings = {
          close       = 'q',
          go_in       = '<right>',
          go_in_plus  = 'L',
          go_out      = '<left>',
          go_out_plus = 'H',
          mark_goto   = "'",
          mark_set    = 'm',
          reset       = '<leader>h',
          reveal_cwd  = '@',
          show_help   = 'g?',
          synchronize = '=',
          trim_left   = '<',
          trim_right  = '>',
        },
        windows = {
          width_focus = 50,
          width_nofocus = 20,
        },
      },
      keys = {
        { "<leader>e", function() MiniFiles.open() end, desc = "Mini Files" },
      }
    },
    {
      'echasnovski/mini.surround',
      version = false,
      opts = {
        mappings = {
          add = 'ta',
          delete = 'td',
          find = 'tf',
          find_left = 'tF',
          highlight = 'th',
          replace = 'tr',
          update_n_lines = 'tn',

          suffix_last = 'l',
          suffix_next = 'n',
        },
        respect_selection_type = true,
      }
    },
    {
      "monaqa/dial.nvim",
      config = function()
        local augend = require("dial.augend")
        require("dial.config").augends:register_group{
          default = {
            augend.integer.alias.decimal_int,
            augend.integer.alias.hex,
            augend.constant.alias.bool,
            augend.constant.alias.alpha,
            augend.constant.alias.Alpha,
            augend.hexcolor.new{
              case = "prefer_lower",
            },
          },
        }
        vim.keymap.set("n", "<M-a>", require("dial.map").inc_normal(), { noremap = true })
        vim.keymap.set("n", "<M-x>", require("dial.map").dec_normal(), { noremap = true })
      end
    },
    {
      "andrewferrier/debugprint.nvim",
      opts = {
        keymaps = {
          normal = {
            plain_below = "gpp",
            plain_above = "gpP",
            variable_below = "gpv",
            variable_above = "gpV",
            surround_plain = "gpsp",
            surround_variable = "gpsv",
            textobj_below = "gpo",
            textobj_above = "gpO",
            textobj_surround = "gpso",
          },
          insert = {
            plain = "<C-G>p",
            variable = "<C-G>v",
          },
          visual = {
            variable_below = "gpv",
            variable_above = "gpV",
          },
        },
      },
      lazy = false,
    }
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = false },
})
