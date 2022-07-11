source $VIMRUNTIME/mswin.vim

let g:python3_host_prog = 'C:\Users\ender\AppData\Local\Programs\Python\Python39\python'

cnoreabbrev qw wq
cnoreabbrev Wq wq
cnoreabbrev WQ wq

let maplocalleader = ','
let g:font_size = 11

" SET{{{

set undofile
set ruler
set showcmd
set smartindent
set autoindent
set textwidth=0 wrapmargin=0
set statusline=\ \ %{WebDevIconsGetFileTypeSymbol()}\ %{expand('%:t')}\ \ \[\ %{expand('%:p:h:t')}\ \]\ %{FugitiveStatusline()}\ %h%m%r\ %=%-10.(%l,%c%V%)\ %P
set foldtext=MyFoldText()
set ignorecase  
set smartcase
set scrolloff=1
set lines=40 columns=164
set autoindent
set copyindent
set nobackup
set nowritebackup
set mouse=a
set keymodel-=stopsel
set wrap
set linebreak
set nolist
set formatoptions=l
set noswapfile
set encoding=utf8
set tabstop=2
set expandtab
set splitbelow
set shiftwidth=2
set hlsearch
set selectmode=key
set selection=inclusive
set updatetime=300
set cursorline
set fillchars=eob:\ 
set wildignorecase
set breakindent
set nostartofline
set title
set noequalalways
set signcolumn=yes:2
set shada+=",!"
set viewoptions=cursor,folds
set sessionoptions-=folds
set sessionoptions-=help
set hidden
set foldmethod=syntax
set foldnestmax=1
set foldcolumn=0
set foldlevel=99
set completeopt=menuone,noselect
set breakindent
set breakindentopt=shift:2
set showbreak=\\\\\
set guifont=Hack\ Nerd\ Font\ Mono:h12

"}}}

" PLUG{{{

call plug#begin('~/.vim/plugged')

Plug 'ajmwagar/vim-deus'
Plug 'NLKNguyen/papercolor-theme'
Plug 'whatyouhide/vim-gotham'
Plug 'mhinz/vim-janah'
Plug 'mhartington/oceanic-next'
Plug 'w0ng/vim-hybrid'
Plug 'catppuccin/nvim'
Plug 'tomasiser/vim-code-dark'

Plug 'nvim-lua/plenary.nvim'

Plug 'plasticboy/vim-markdown'
Plug 'mustache/vim-mustache-handlebars'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'posva/vim-vue'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'folke/trouble.nvim'

Plug 'nvim-telescope/telescope.nvim'

Plug 'hoob3rt/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'liuchengxu/vim-which-key'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'nacro90/numb.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'sbdchd/neoformat'
Plug 'windwp/nvim-autopairs'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'

Plug 'sainnhe/edge'
Plug 'lifepillar/vim-gruvbox8'
Plug 'rebelot/kanagawa.nvim'
Plug 'olimorris/onedarkpro.nvim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'} 
Plug 'projekt0n/github-nvim-theme'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'luukvbaal/stabilize.nvim'
Plug 'akinsho/toggleterm.nvim'

Plug 'max397574/better-escape.nvim'

Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

" Plug 'numToStr/Comment.nvim'

call plug#end()

"}}}

lua << EOF

-- LSP

require'lspconfig'.vuels.setup{ cmd = { "vls.cmd" } }
require'lspconfig'.tsserver.setup{}

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

local signs = { Error = "▶", Warn = "▶", Hint = "▶", Info = "▶" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end


require 'lsp_signature'.setup()

-- COLORIZER

require'colorizer'.setup()

-- NUMB

require('numb').setup()

-- TROUBLE

require('trouble').setup {}

-- GITSIGNS

require('gitsigns').setup()

-- CMP

local cmp = require('cmp')
  cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn['vsnip#anonymous'](args.body)
      end
    },
    formatting = {
      format = function(entry, vim_item)
        vim_item.menu = ({
          buffer = "  [Buffer]",
          nvim_lsp = "  [LSP]",
          luasnip = "  [LuaSnip]",
        })[entry.source.name]
        return vim_item
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<CR>'] = cmp.mapping.confirm(),
      ['<TAB>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
    },
    sources = {
      { name = 'buffer' },
      { name = 'nvim_lsp' },
      { name = 'path' },
    },
  }

-- AUTOPAIRS

require('nvim-autopairs').setup{
  fast_wrap = {},
}

-- LUALINE

-- ayu_dark codedark horizon onedark onelight papercolor_dark papercolor_light
require('lualine').setup{options = {section_separators='', component_separators='', theme='onedark'}}

-- TODO-COMMENTS

require("todo-comments").setup {}

require("telescope").setup {
  defaults = {
    -- path_display = {"shorten"},
    file_ignore_patterns = {"node_modules"},
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

-- STABILIZE

require("stabilize").setup()

-- TOGGLE TERM

require("toggleterm").setup{}

-- BETTER ESCAPE

require("better_escape").setup {
    mapping = {"jk", "jj"}, -- a table with mappings to use
    timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
    clear_empty_lines = false, -- clear line after escaping if there is only whitespace
    keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
}

-- BUFFERLINE

require('bufferline').setup {
  options = {
    mode = "tabs",
    numbers = "none",
    indicator_icon = '▎',
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
    show_buffer_default_icon = true,
    show_close_icon = true,
    show_tab_indicators = true,
    separator_style = "slant",
    always_show_bufferline = false,
    sort_by = 'tabs',
  }
}

-- require('Comment').setup()
-- local ft = require('Comment.ft')
EOF

" MAPPING{{{

nnoremap <leader>r *``cgn
vnoremap <expr> <leader>r "y/\\v\<c-r>=escape(@\", '/')\<cr>\<cr>" . "``cgn"

nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

nnoremap <expr> <down> v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> <up> v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

lua << EOF
vim.keymap.set('n', '<Leader>q', ':q!<CR>')
vim.keymap.set('n', '<C-q>', ':q!<CR>')
vim.keymap.set('n', '<CR>', 'o')
vim.keymap.set('n', ';', ':', {remap = false})
vim.keymap.set('n', '<c-f>', '<c-u>')
vim.keymap.set('n', '<Leader><Leader>', 'V')
vim.keymap.set('v', '<Leader><Leader>', '<Esc>')
vim.keymap.set('x', '<', '<gv', {remap = false})
vim.keymap.set('x', '>', '>gv|', {remap = false})
vim.keymap.set({'n', 'i', 'v'}, '<PageUp>', '<left>')
vim.keymap.set({'n', 'i', 'v'}, '<PageDown>', '<right>')

vim.keymap.set('n', '<M-c>', 'gcc', {remap = true})
vim.keymap.set('v', '<M-c>', 'gc', {remap = true})
vim.keymap.set('n', '<M-S-c>', '<Leader>_b', {remap = true})
vim.keymap.set('v', '<M-S-c>', '<Leader>_b', {remap = true})

vim.keymap.set('n', '<C-L>', ':nohlsearch<cr>', {remap = false})

vim.keymap.set('n', '+', '<C-a>', {remap = false})
vim.keymap.set('n', '-', '<C-x>', {remap = false})

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

vim.keymap.set('n', ',g', 'yyp<up>gcc<down>')
vim.keymap.set('n', 't', 'vatV', {remap = false})
vim.keymap.set('n', '<C-t>', 'vit', {remap = false})

vim.keymap.set('i', '<leader>c', "console.log(", { remap = true })
vim.keymap.set('i', '<leader>d', "console.log('debug'", { remap = true })
vim.keymap.set('i', '<leader>dw', "console.log('watch debug'", { remap = true })
vim.keymap.set('i', '<leader>dc', "console.log('computed debug'", { remap = true })
vim.keymap.set('i', '<leader>de', "console.log('event debug'", { remap = true })
vim.keymap.set('i', '<leader>dp', "console.log('props debug'", { remap = true })
vim.keymap.set('i', '<leader>dm', "console.log('model debug'", { remap = true })

vim.keymap.set('i', '<leader>j', "JSON.stringify(")
vim.keymap.set('i', '<leader>fa', "() => {<cr>")
vim.keymap.set('i', '<leader>ff', "function() {")
vim.keymap.set('i', '<leader>i', "if(")

vim.keymap.set('i', '<leader>tt', "<template><c-e>")
vim.keymap.set('i', '<leader>td', "<div><c-e>")
vim.keymap.set('i', '<leader>tc', 'class="')

-- MAPPING WINDOWS

vim.keymap.set('n', '<C-A>', "ggVG", {remap = false})
vim.keymap.set('i', '<C-A>', "<C-O>gg<C-O>VG", {remap = false})
vim.keymap.set('c', '<C-A>', "<C-C>ggV<C-O>G", {remap = false})
vim.keymap.set('o', '<C-A>', "<C-C>ggV<C-O>G", {remap = false})
vim.keymap.set('s', '<C-A>', "<C-C>ggV<C-O>G", {remap = false})
vim.keymap.set('x', '<C-A>', "<C-C>ggVG", {remap = false})

-- MAPPING F

vim.keymap.set('n', '<F2>', ":PlugInstall<CR>")
vim.keymap.set('n', '<F3>', ":PlugClean<CR>")
vim.keymap.set('n', '<F4>', ":PlugUpdate<CR>")
vim.keymap.set('n', '<F7>', ":tabnew<CR>")
vim.keymap.set('n', '<F8>', ":call system('explorer ' . expand('%:p:h'))<cr>")
vim.keymap.set('n', '<F9>', ":set number!<CR>")
vim.keymap.set('n', '<F11>', ":ToggleBackground<CR>")

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
vim.keymap.set('n', ',,', ":ZoomToggle<CR>", {remap = false})
vim.keymap.set('n', '<leader>=', "<C-w>=", {remap = false})
vim.keymap.set('n', '<Tab>', "<C-w><C-w>")

-- MAPPING BUFFERS

vim.keymap.set('n', '<leader>d', ':bp\\|bd#<cr>')

-- MAPPING FOLDS

vim.keymap.set('n', '<2-LeftMouse>', "foldclosed(line('.')) == -1 ? '<2-LeftMouse>' : 'zo'", {remap = false, expr = true})
vim.keymap.set('n', '<C-CR>', "&foldlevel == 0 ? 'zR' :'zM'", {remap = false, expr = true})
vim.keymap.set('n', '<M-CR>', "&foldlevel == 0 ? 'zRzMzo' :'zMzo'", {remap = false, expr = true})
vim.keymap.set('n', 'f', "za")

-- MAPPING TABS

vim.keymap.set('n', '<leader>t', ":tabnew<CR>")

-- MAPPING GIT

vim.keymap.set('', '<c-g>', ":vertical G<cr>")
EOF

"}}}

" COLORSCHEME{{{

lua << EOF
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'hi LineNr guibg=NONE' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'hi FoldColumn guibg=NONE' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'hi VertSplit gui=none guibg=none' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'hi Folded guibg=none gui=bold' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'hi ALEErrorSign guifg=red guibg=none gui=bold' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'hi ALEWarningSign guifg=red guibg=none gui=bold' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'hi ALEInfoSign guifg=red guibg=none gui=bold' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'hi SignColumn guibg=none' })

vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'hi link Floaterm CursorLine' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'hi link FloatermBorder CursorLine' })

vim.api.nvim_create_autocmd('ColorScheme', { pattern = 'gotham256', command = 'hi StatusLine gui=bold' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = 'PaperColor', command = 'hi VertSplit guifg=#303030 guibg=none' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = 'OceanicNext', command = 'hi! link VertSplit Normal' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = 'janah', command = 'hi! link Pmenu CursorLine' })

vim.api.nvim_create_autocmd('ColorScheme', { pattern = 'hybrid', command = 'highlight TelescopeMatching guifg=#b5bd68 gui=bold' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = 'PaperColor', command = 'highlight TelescopeMatching guifg=#b5bd68 gui=bold' })

vim.api.nvim_create_autocmd('ColorScheme', { pattern = 'gruvbox', command = 'hi link htmlCommentPart Comment' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = 'gruvbox', command = 'hi link htmlComment Comment' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = 'gruvbox', command = 'hi GruvboxGreenSign guibg=none gui=bold' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = 'gruvbox', command = 'hi GruvboxAquaSign guibg=none gui=bold' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = 'gruvbox', command = 'hi GruvboxRedSign guibg=none gui=bold' })

vim.api.nvim_create_autocmd('BufEnter', { pattern = '*', command = 'syntax sync fromstart' })

vim.api.nvim_create_autocmd('BufRead', { pattern = '*.vue', command = 'setlocal foldnestmax=4' })
vim.api.nvim_create_autocmd('BufRead', { pattern = '*.js', command = 'setlocal foldnestmax=1' })
vim.api.nvim_create_autocmd('BufRead', { pattern = '*.ts', command = 'setlocal foldnestmax=1' })
vim.api.nvim_create_autocmd('BufRead', { pattern = '*.vim', command = 'setlocal foldmethod=marker' })

vim.api.nvim_create_autocmd('BufNewFile', { pattern = '*.vue', command = 'setlocal foldnestmax=4' })
vim.api.nvim_create_autocmd('BufNewFile', { pattern = '*.js', command = 'setlocal foldnestmax=1' })
vim.api.nvim_create_autocmd('BufNewFile', { pattern = '*.ts', command = 'setlocal foldnestmax=1' })
vim.api.nvim_create_autocmd('BufNewFile', { pattern = '*.vim', command = 'setlocal foldmethod=marker' })

vim.api.nvim_create_autocmd('TermOpen', { pattern = '*', command = 'setlocal nobuflisted' })

vim.api.nvim_create_autocmd('VimEnter', { pattern = '*', command = 'cd c:\\Users\\ender\\Desktop\\projects' })

vim.api.nvim_create_autocmd('BufWinEnter', { pattern = '*/.git/index', command = 'nnoremap <esc> :q<cr>' })
vim.api.nvim_create_autocmd('BufWinLeave', { pattern = '*/.git/index', command = 'unmap <esc>' })

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

-- colorscheme hybrid
-- colorscheme github_dark
-- colorscheme edge
-- colorscheme kanagawa
vim.cmd [[
  colorscheme catppuccin
]]

-- latte, frappe, macchiato, mocha
vim.g.catppuccin_flavour = "macchiato"

vim.opt.background = 'dark'

-- SYNTAX

vim.cmd [[
  syntax on
  filetype plugin indent on
]]
EOF

"}}}

" AUTOCMD{{{

let g:vue_pre_processors = []

autocmd User GitGutterStage call fugitive#ReloadStatus()

"}}}

" PLUGIN MARKDOWN{{{

lua << EOF
vim.g.vim_markdown_folding_disabled = 1
EOF

"}}}

" PLUGIN EMMET{{{

lua << EOF
vim.g.user_emmet_expandabbr_key = "'<C-e>"
vim.g.user_emmet_update_tag = "<M-e>"
vim.g.user_emmet_removetag_key = "<M-d>"
vim.g.user_emmet_splitjointag_key = "<M-t>"
EOF

"}}}

" PLUGIN WHICHKEY{{{

lua << EOF
vim.keymap.set('n', '<leader>', ":WhichKey '\'<CR>", {remap = false})
vim.keymap.set('n', '<localleader>', ":WhichKey '\'<CR>", {remap = false})
EOF

"}}}
"
" PLUGIN VUE{{{

let g:vim_vue_plugin_config = { 
      \'syntax': {
      \   'script': ['javascript'],
      \   'template': ['html'],
      \   'style': ['css'],
      \},
      \'full_syntax': [],
      \'attribute': 0,
      \'keyword': 0,
      \'foldexpr': 0,
      \'init_indent': 0,
      \'debug': 0,
      \}

" }}}

" PLUGIN FLOATERM{{{

let g:floaterm_keymap_new    = ''
let g:floaterm_keymap_prev   = ''
let g:floaterm_keymap_next   = ''
let g:floaterm_keymap_toggle = '<F12>'

"}}}

" PLUGIN BLANKLINE{{{

let g:indent_blankline_filetype = ['vue', 'javascript', 'typescript', 'html']

"}}}

" PLUGIN TELESCOPE{{{

lua << EOF
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
vim.keymap.set('', '<leader>]', ":lua require('telescope.builtin').resume()<cr>", {remap = true})
vim.keymap.set('', '<leader>p', ":TodoTelescope<cr>", {remap = true})
EOF

"}}}

" FUNCTIONS

function MyFoldText()
	let line = getline(v:foldstart)
	return '+ ' . v:folddashes . ' ' . line
endfunction

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

function! s:ToggleBackground()
	if ! exists('g:colors_name')
		echomsg 'No colorscheme set'
		return
	endif
	let l:scheme = g:colors_name

	if l:scheme =~# 'dark' || l:scheme =~# 'light'
		" Rotate between different theme backgrounds
		execute 'colorscheme' (l:scheme =~# 'dark'
					\ ? substitute(l:scheme, 'dark', 'light', '')
					\ : substitute(l:scheme, 'light', 'dark', ''))
	else
		execute 'set background='.(&background ==# 'dark' ? 'light' : 'dark')
		if ! exists('g:colors_name')
			execute 'colorscheme' l:scheme
			echomsg 'The colorscheme `'.l:scheme
				\ .'` doesn''t have background variants!'
		else
			echo 'Set colorscheme to '.&background.' mode'
		endif
	endif
endfunction
command! ToggleBackground call s:ToggleBackground()


