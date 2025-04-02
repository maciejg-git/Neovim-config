lua << EOF

vim.cmd [[
  source $VIMRUNTIME/scripts/mswin.vim

  syntax on

  filetype plugin indent on

  cnoreabbrev qw wq
  cnoreabbrev Wq wq
  cnoreabbrev WQ wq
]]

-- OPTIONS

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

-- PACKER

require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'

  use 'NLKNguyen/papercolor-theme'
  use {'catppuccin/nvim', as = 'catppuccin'} 
  use 'sainnhe/everforest'
  use 'EdenEast/nightfox.nvim'
  use { 'Everblush/nvim', as = 'everblush' }
  use "savq/melange-nvim"

  use 'preservim/vim-markdown'
  use 'mustache/vim-mustache-handlebars'
  use 'pangloss/vim-javascript'
  use 'HerringtonDarkholme/yats.vim'
  use 'mattn/emmet-vim'
  use "rafamadriz/friendly-snippets"
  use({
    'Wansmer/treesj',
    requires = { 'nvim-treesitter' },
  })

  use 'lewis6991/gitsigns.nvim'

  use 'neovim/nvim-lspconfig'
  use 'ray-x/lsp_signature.nvim'

  use 'nvim-telescope/telescope.nvim'
  use 'folke/trouble.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/toggleterm.nvim'
  use 'karb94/neoscroll.nvim'
  use "petertriho/nvim-scrollbar" 
  use {'akinsho/bufferline.nvim', tag = '*' }
  use 'rcarriga/nvim-notify'
  use 'mbbill/undotree'
  use "folke/which-key.nvim"
  use 'voldikss/vim-floaterm'

  use "kevinhwang91/nvim-hlslens"
  use 'folke/todo-comments.nvim'
  use 'godlygeek/tabular'
  use 'nacro90/numb.nvim'
  use 'windwp/nvim-autopairs'
  use 'max397574/better-escape.nvim'
  use 'kylechui/nvim-surround'
  use 'numToStr/Comment.nvim'
  use "stevearc/conform.nvim"

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    tag = "v7.0.0"
  }
  use 'stevearc/oil.nvim'
  use "folke/flash.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "vuki656/package-info.nvim"
  use "MunifTanjim/nui.nvim"
  use "f-person/git-blame.nvim"
  use "brenoprata10/nvim-highlight-colors"
  use {"saghen/blink.cmp", tag = "v1.0.0"}
end)

-- PLUGINS

-- LSP CONFIG

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
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
})

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
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
})

vim.diagnostic.config({
  virtual_lines = true

  -- Alternatively, customize specific options
  -- virtual_lines = {
  --  -- Only show virtual line diagnostics for the current cursor line
  --  current_line = true,
  -- },
})

-- LSP SIGNATURE

require 'lsp_signature'.setup()

-- NUMB

require('numb').setup()

-- TROUBLE

require('trouble').setup {}

-- GITSIGNS

require('gitsigns').setup({
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    },
})

-- AUTOPAIRS

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

-- LUALINE

require('lualine').setup{options = {section_separators='', component_separators='', theme='auto'}}

-- TODO-COMMENTS

require("todo-comments").setup {}

-- TELESCOPE

require("telescope").setup {
  defaults = {
    -- path_display = {"shorten"},
    file_ignore_patterns = {"node_modules", "dist", "_site"},
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
      },
    },
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      ignore_current_buffer = true,
      previewer = false,
      layout_strategy='vertical',
      layout_config={ width=0.6 },
      mappings = {
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
          -- Right hand side can also be the name of the action as a string
          ["<c-d>"] = "delete_buffer",
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        }
      }
    },
  },
}

vim.keymap.set('', '<leader>;', ":lua require('telescope.builtin').command_history()<cr>", {remap = true})
vim.keymap.set('', '<leader>c', ":lua require('telescope.builtin').colorscheme()<cr>", {remap = true})
vim.keymap.set('', '<leader>m', ":lua require('telescope.builtin').keymaps()<cr>", {remap = true})
vim.keymap.set('', '<leader>h', ":lua require('telescope.builtin').highlights()<cr>", {remap = true})
vim.keymap.set('', '<leader>f', ":lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", {remap = true})
vim.keymap.set('', '<leader>g', ":lua require('telescope.builtin').git_commits()<cr>", {remap = true})
vim.keymap.set('', '<leader>l', ":lua require('telescope.builtin').live_grep()<cr>", {remap = true})
vim.keymap.set('', '<space>', ":lua require('telescope.builtin').buffers()<cr>", {remap = true})
vim.keymap.set('', '<C-p>', ":lua require('telescope.builtin').find_files({layout_strategy='vertical',layout_config={width=0.6}})<cr>", {remap = true})
vim.keymap.set('', '<M-1>', ":lua require('telescope.builtin').diagnostics({layout_strategy='vertical',layout_config={width=0.6}})<cr>", {remap = true})
vim.keymap.set('', '<M-2>', ":lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", {remap = true})
vim.keymap.set('', '<M-3>', ":lua require('telescope.builtin').lsp_document_symbols({layout_strategy='vertical',layout_config={width=0.6}})<cr>", {remap = true})
vim.keymap.set('', '<M-4>', ":lua require('telescope.builtin').lsp_references({layout_strategy='vertical',layout_config={width=0.6}})<cr>", {remap = true})
vim.keymap.set('', '<leader><cr>', ":lua require('telescope.builtin').resume()<cr>", {remap = true})
vim.keymap.set('', '<leader>p', ":TodoTelescope<cr>", {remap = true})

-- TOGGLE TERM

require("toggleterm").setup{}

-- TREE SITTER

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
}

-- BETTER ESCAPE

require("better_escape").setup {
    timeout = vim.o.timeoutlen,
    default_mappings = false,
    mappings = {
        i = {
            j = {
                j = "<Esc>",
            },
        },
        c = {
            j = {
                j = "<Esc>",
            },
        },
        t = {
            j = {
                j = "<Esc>",
            },
        },
        v = {
            j = {
                k = "<Esc>",
            },
        },
        s = {
            j = {
                k = "<Esc>",
            },
        },
    },
}

-- BUFFERLINE

require('bufferline').setup {
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

-- SURROUND

require("nvim-surround").setup()

-- NEOSCROLL

require('neoscroll').setup({
    mappings = {'<C-u>', '<C-d>', 'zt', 'zz', 'zb'},
})

-- NORG

require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {},
    ["core.keybinds"] = {
      config = {
        hook = function(keybinds)
          keybinds.unmap("norg", "n", "<CR>")
        end,
      }
    } 
  }
}

-- SCROLLBAR

require("scrollbar").setup()
require("scrollbar.handlers.search").setup({
    override_lens = function() end,
})

-- NOTIFY

vim.notify = require("notify")

-- WHICH-KEY

require("which-key").setup()

-- COMMENT

require('Comment').setup()

-- TREESJ

require('treesj').setup({
  use_default_keymaps = false,
})

-- OIL

require("oil").setup({
 float = {
    padding = 4,
    max_width = 0,
    max_height = 0,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
  },
})

vim.keymap.set("n", "-", require("oil").open_float, { desc = "Open parent directory" })

-- FLASH

require("flash").setup({
opts = {
  modes = {
    char = {
      enabled = false
      }
    }
  }
})

local Config = require("flash.config")
local Char = require("flash.plugins.char")
for _, motion in ipairs({ "f", "t", "F", "T" }) do
  vim.keymap.set({ "n", "x", "o" }, motion, function()
    require("flash").jump(Config.get({
      mode = "char",
      search = {
        mode = Char.mode(motion),
        max_length = 1,
      },
    }, Char.motions[motion]))
  end)
end

vim.keymap.set('n', 's', 
  function()
    require("flash").jump()
  end
)
vim.keymap.set('n', 'S', 
  function()
    require("flash").treesitter()
  end
)

-- MARKDOWN

vim.g.vim_markdown_folding_disabled = 1

-- GIT BLAME

require('gitblame').setup {
    enabled = false,
}

-- INDENT BLANKLINE

require("ibl").setup({
  scope = {
    enabled = false,  
    show_start = false,
  },
  exclude = {
    filetypes = { "norg", "text" }
  }
})

-- PACKAGE INFO

require('package-info').setup()

vim.keymap.set({ "n" }, "<LEADER>ns", require("package-info").show, { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<LEADER>nc", require("package-info").hide, { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<LEADER>nt", require("package-info").toggle, { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<LEADER>nu", require("package-info").update, { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<LEADER>nd", require("package-info").delete, { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<LEADER>ni", require("package-info").install, { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<LEADER>np", require("package-info").change_version, { silent = true, noremap = true })

-- CONFORM

require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettier", stop_after_first = true, timeout_ms = 10000 },
    html = { "prettier", stop_after_first = true, timeout_ms = 10000 },
    liquid = { "prettier", stop_after_first = true, timeout_ms = 10000 },
  },
})

-- HIGLIGHT COLORS

require('nvim-highlight-colors').setup({
  -- render = 'virtual',
  -- enable_tailwind = true
})

-- BLINK

require("blink.cmp").setup({
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
    }
  },
  enabled = function() return not vim.tbl_contains({ "norg" }, vim.bo.filetype) end,
})

-- EMMET

vim.g.user_emmet_expandabbr_key = "<C-e>"
vim.g.user_emmet_update_tag = "<M-e>"
vim.g.user_emmet_removetag_key = "<M-d>"
vim.g.user_emmet_splitjointag_key = "<M-t>"

-- FLOATERM

vim.g.floaterm_keymap_new = ""
vim.g.floaterm_keymap_prev = ""
vim.g.floaterm_keymap_next = ""
vim.g.floaterm_keymap_toggle = "<F12>"
vim.g.floaterm_width = 0.95
vim.g.floaterm_height = 0.95

-- MAPPING

vim.keymap.set('n', '<leader>r', '*``cgn', {remap = false})
vim.keymap.set('v', '<leader>r', [[ "y/\\v\<c-r>=escape(@\", '/')\<cr>\<cr>" . "``cgn" ]], {remap = false, expr = true})

vim.keymap.set('n', '<Leader>q', ':q!<CR>')
vim.keymap.set('n', '<C-q>', ':q!<CR>')
vim.keymap.set('n', '<CR>', 'o')
vim.keymap.set('n', ';', ':', {remap = false})
vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('n', '<c-f>', '<c-u>', { remap = true })
vim.keymap.set('n', '<Leader><Leader>', 'V')
vim.keymap.set('v', '<Leader><Leader>', '<Esc>')
vim.keymap.set('x', '<', '<gv', {remap = false})
vim.keymap.set('x', '>', '>gv|', {remap = false})
vim.keymap.set({'n', 'i', 'v'}, '<PageUp>', '<left>')
vim.keymap.set({'n', 'i', 'v'}, '<PageDown>', '<right>')
vim.keymap.set('n', '<Backspace>', 'ciw')
vim.keymap.set('n', 'o', 'ciw')

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

vim.keymap.set('n', '<c-n>', require("conform").format)

vim.keymap.set('i', '<leader>c', "console.log(", { remap = true })
vim.keymap.set('i', '<leader>d', "console.log('debug'", { remap = true })

vim.keymap.set('i', '<leader>j', "JSON.stringify(", { remap = true })
vim.keymap.set('i', '<leader>fa', "() => {<cr>", { remap = true })
vim.keymap.set('i', '<leader>ff', "function() {", { remap = true })
vim.keymap.set('i', '<leader>i', "if(", { remap = true })

vim.keymap.set('n', '<leader>j', ":TSJJoin<cr>", { remap = true })
vim.keymap.set('n', '<leader>s', ":TSJSplit<cr>", { remap = true })
vim.keymap.set('n', '<M-j>', ":TSJJoin<cr>", { remap = true })
vim.keymap.set('n', '<M-s>', ":TSJSplit<cr>", { remap = true })

vim.keymap.set('i', '<leader>tt', "<template><c-e>", { remap = true })

-- MAPPING WINDOWS

vim.keymap.set('n', '<C-A>', "ggVG", {remap = false})
vim.keymap.set('i', '<C-A>', "<C-O>gg<C-O>VG", {remap = false})
vim.keymap.set('c', '<C-A>', "<C-C>ggV<C-O>G", {remap = false})
vim.keymap.set('o', '<C-A>', "<C-C>ggV<C-O>G", {remap = false})
vim.keymap.set('s', '<C-A>', "<C-C>ggV<C-O>G", {remap = false})
vim.keymap.set('x', '<C-A>', "<C-C>ggVG", {remap = false})

-- MAPPING F

vim.keymap.set('n', '<F2>', ":PackerInstall<CR>")
vim.keymap.set('n', '<F3>', ":PackerClean<CR>")
vim.keymap.set('n', '<F4>', ":PackerUpdate<CR>")
vim.keymap.set('n', '<F7>', ":tabnew<CR>")
vim.keymap.set('n', '<F8>', ":call system('explorer ' . expand('%:p:h'))<cr>")
vim.keymap.set('n', '<F9>', ":set number!<CR>")

-- MAPPING FONT

vim.keymap.set('n', '<C-PageUp>', ":call FontSize(1)<CR>", {remap = false})
vim.keymap.set('n', '<C-PageDown>', ":call FontSize(-1)<CR>", {remap = false})

-- MAPPING WINDOWS

vim.keymap.set('n', '<A-right>', ":set splitright<CR>:vnew<CR>")
vim.keymap.set('n', '<A-left>', ":set nosplitright<CR>:vnew<CR>")
vim.keymap.set('n', '<A-up>', ":set nosplitbelow<CR>:new<CR>")
vim.keymap.set('n', '<A-down>', ":set splitbelow<CR>:new<CR>")
vim.keymap.set('v', '<A-right>', "<esc>:set splitright<CR>:vnew<CR>", {remap = false})
vim.keymap.set('v', '<A-left>', "<esc>:set nosplitright<CR>:vnew<CR>", {remap = false})
vim.keymap.set('v', '<A-up>', "<esc>:set nosplitbelow<CR>:new<CR>", {remap = false})
vim.keymap.set('v', '<A-down>', "<esc>:set splitbelow<CR>:new<CR>", {remap = false})
vim.keymap.set('n', '<leader>z', ":ZoomToggle<CR>", {remap = false})
vim.keymap.set('n', '<leader>=', "<C-w>=", {remap = false})
vim.keymap.set('n', '<Tab>', "<C-w><C-w>")

-- MAPPING BUFFERS

vim.keymap.set('n', '<leader>d', ':bp\\|bd#<cr>')

-- MAPPING FOLDS

vim.keymap.set('n', '<2-LeftMouse>', "foldclosed(line('.')) == -1 ? '<2-LeftMouse>' : 'zo'", {remap = false, expr = true})
vim.keymap.set('n', '<C-CR>', "&foldlevel == 0 ? 'zR' :'zM'", {remap = false, expr = true})
vim.keymap.set('n', '<M-CR>', "&foldlevel == 0 ? 'zRzMzo' :'zMzo'", {remap = false, expr = true})
-- vim.keymap.set('n', 'f', "za")

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

-- AUTOCOMMAND

vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'hi LineNr guibg=NONE' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'hi FoldColumn guibg=NONE' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'hi VertSplit gui=none guibg=none' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'hi Folded guibg=none gui=bold' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'hi SignColumn guibg=none' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'hi! link TelescopeSelection Visual' })

vim.api.nvim_create_autocmd('BufRead', { pattern = '*.njk', command = 'set filetype=html' })
vim.api.nvim_create_autocmd('BufNewFile', { pattern = '*.njk', command = 'set filetype=html' })

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

-- COLORSCHEME

require("catppuccin").setup({
  integrations = {
      flash = false,
    }
})

vim.opt.background = 'dark'

vim.g.catppuccin_flavour = "macchiato"

--  catppuccin nightfox everforest everblush melange
vim.cmd [[
  colorscheme catppuccin
]]

EOF

" FUNCTIONS

let g:font_size = 11

function FontSize(size)
	let g:font_size+=a:size
	let font=substitute(&guifont, ":.*", "", "") . ":h" . g:font_size
	let &guifont=font
endfunction

function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()

function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
			endwhile
    if open
        call winrestview(view)
    endif
endfunction

function! NextOpenedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) > 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction
