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
Plug 'folke/tokyonight.nvim'
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

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'luukvbaal/stabilize.nvim'
Plug 'akinsho/toggleterm.nvim'

Plug 'max397574/better-escape.nvim'

" Plug 'simrat39/symbols-outline.nvim'
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
      -- ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm(),
      -- ['<CR>'] = cmp.mapping.confirm({
      --   behavior = cmp.ConfirmBehavior.Insert,
      --   select = true,
      -- }),
      ['<TAB>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
    },
    sources = {
      { name = 'buffer' },
      { name = 'nvim_lsp' },
      { name = 'path' },
    },
  }

-- AUTOPAIRS

require('nvim-autopairs').setup{}

-- LUALINE

-- ayu_dark codedark horizon onedark onelight papercolor_dark papercolor_light
require('lualine').setup{options = {section_separators='', component_separators='', theme='onedark'}}

-- TODO-COMMENTS

require("todo-comments").setup {}

require("telescope").setup {
  defaults = {
    -- path_display = {"shorten"},
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

-- require("stabilize").setup()

-- TOGGLE TERM

require("toggleterm").setup{}

-- BETTER ESCAPE

require("better_escape").setup {
    mapping = {"jk", "jj"}, -- a table with mappings to use
    timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
    clear_empty_lines = false, -- clear line after escaping if there is only whitespace
    keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
}

-- require('Comment').setup()
-- local ft = require('Comment.ft')
EOF

" MAPPING{{{

nmap <leader>q :q!<CR>
nmap <C-q> :q!<CR>
nmap <CR> o
nnoremap ; :
map <c-f> <c-u>
nmap <silent> <Leader><Leader> V
vmap <Leader><Leader> <Esc>
xnoremap < <gv
xnoremap > >gv|
nmap <M-c> gcc
vmap <M-c> gc
nmap <M-S-c> <Leader>_b
nmap <PageUp> <left>
nmap <PageDown> <right>
imap <PageUp> <left>
imap <PageDown> <right>
vmap <PageUp> <left>
vmap <PageDown> <right>

nnoremap <silent> <C-L> :nohlsearch<cr>

nnoremap <leader>r *``cgn
vnoremap <expr> <leader>r "y/\\v\<c-r>=escape(@\", '/')\<cr>\<cr>" . "``cgn"

nnoremap + <C-a>
nnoremap - <C-x>

nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

nnoremap <expr> <down> v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> <up> v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

nnoremap n  nzz
nnoremap N  Nzz

noremap  <C-up> :m-2<CR>
noremap  <C-down> :m+<CR>
vnoremap <C-up> :m-2<CR>gv=gv
vnoremap <C-down> :m'>+<CR>gv=gv
noremap  <C-k> :m-2<CR>
noremap  <C-j> :m+<CR>
vnoremap <C-k> :m-2<CR>gv=gv
vnoremap <C-j> :m'>+<CR>gv=gv

nmap ,g yyp<up>gcc<down>

nnoremap t vatV
nnoremap <C-t> vit
imap <leader>c console.log(
imap <leader>d console.log('debug here'
imap <leader>j JSON.stringify(
imap <leader>fa () => {<cr>
imap <leader>ff function() {
imap <leader>i if() {

"}}}

" MAPPING MSWIN{{{

noremap <C-A> ggVG
inoremap <C-A> <C-O>gg<C-O>VG
cnoremap <C-A> <C-C>ggV<C-O>G
onoremap <C-A> <C-C>ggV<C-O>G
snoremap <C-A> <C-C>ggV<C-O>G
xnoremap <C-A> <C-C>ggVG

"}}}

" MAPPING F{{{

nmap <F2> :PlugInstall<CR>
nmap <F3> :PlugClean<CR>
nmap <F4> :PlugUpdate<CR>
nmap <F5> :LeaderfColorscheme<CR>
nmap <F7> :tabnew<CR>
map  <F8> :call system("explorer " . expand('%:p:h'))<cr>
nmap <F9> :set number!<CR>
nmap <F11> :<C-u>call <SID>toggle_background()<CR>

"}}}

" MAPPING GUI{{{

nnoremap <C-PageUp> :call FontSize(1)<CR>
nnoremap <C-PageDown> :call FontSize(-1)<CR>
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"}}}

" MAPPING WINDOWS{{{

nmap <A-right> :set splitright<CR>:vnew<CR>
nmap <A-left> :set nosplitright<CR>:vnew<CR>
nmap <A-up> :set nosplitbelow<CR>:new<CR>
nmap <A-down> :set splitbelow<CR>:new<CR>
vnoremap <A-right> <esc>:set splitright<CR>:vnew<CR>
vnoremap <A-left> <esc>:set nosplitright<CR>:vnew<CR>
vnoremap <A-up> <esc>:set nosplitbelow<CR>:new<CR>
vnoremap <A-down> <esc>:set splitbelow<CR>:new<CR>
nnoremap <silent>,, :ZoomToggle<CR>
nnoremap <silent><leader>= <C-w>=
nmap <Tab> <C-w><C-w>

"}}}

" MAPPING BUFFERS{{{

nmap <leader>d :bp\|bd#<cr>

"}}}

" MAPPING FOLD{{{

nnoremap <expr> <2-LeftMouse> foldclosed(line('.')) == -1 ? "\<2-LeftMouse>" : 'zo'
nnoremap <expr> <C-CR> &foldlevel == 0 ? 'zR' :'zM'
nnoremap <expr> <M-CR> &foldlevel == 0 ? 'zRzMzo' :'zMzo'
nnoremap f za

"}}}

" MAPPING TABS{{{

nmap <leader>t :tabnew<CR>

"}}}

" MAPPING GIT {{{

" map <c-g> :G<cr>
map <c-g> :vertical G<cr>

"}}}

" COLORSCHEME{{{

let g:deus_bold = 0
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_bold = 0

autocmd ColorScheme * hi LineNr guibg=NONE
autocmd ColorScheme * hi FoldColumn guibg=NONE
autocmd ColorScheme * hi VertSplit gui=none guibg=none
autocmd ColorScheme * hi Folded guibg=none gui=bold
autocmd ColorScheme * hi ALEErrorSign guifg=red guibg=none gui=bold
autocmd ColorScheme * hi ALEWarningSign guifg=red guibg=none gui=bold
autocmd ColorScheme * hi ALEInfoSign guifg=red guibg=none gui=bold
autocmd ColorScheme * hi SignColumn guibg=none

autocmd ColorScheme * hi CocErrorSign guifg=red guibg=none
autocmd ColorScheme * hi CocWarningSign guifg=yellow guibg=none
autocmd ColorScheme * hi CocInfoSign guifg=yellow guibg=none
autocmd ColorScheme * hi CocUnderline gui=undercurl
autocmd ColorScheme * hi link CocFadeOut CocUnderline

autocmd ColorScheme gotham256 hi StatusLine gui=bold

autocmd ColorScheme PaperColor hi VertSplit guifg=#303030 guibg=none

autocmd ColorScheme Catppuccino hi VertSplit guifg=#28414f guibg=none

autocmd ColorScheme OceanicNext hi! link VertSplit Normal

autocmd ColorScheme janah hi! link Pmenu CursorLine

autocmd ColorScheme gruvbox hi link htmlCommentPart Comment
autocmd ColorScheme gruvbox hi link htmlComment Comment
autocmd ColorScheme gruvbox hi GruvboxGreenSign guibg=none gui=bold
autocmd ColorScheme gruvbox hi GruvboxAquaSign guibg=none gui=bold
autocmd ColorScheme gruvbox hi GruvboxRedSign guibg=none gui=bold

autocmd ColorScheme * hi link Floaterm CursorLine
autocmd ColorScheme * hi link FloatermBorder CursorLine

autocmd ColorScheme hybrid highlight TelescopeMatching guifg=#b5bd68 gui=bold
autocmd ColorScheme PaperColor highlight TelescopeMatching guifg=#b5bd68 gui=bold
 
set background=dark
" colorscheme gruvbox
" colorscheme OceanicNext
" colorscheme janah
" colorscheme PaperColor
" colorscheme hybrid
colorscheme kanagawa

"}}}

" SYNTAX{{{

syntax on
filetype plugin indent on

"}}}

" AUTOCMD{{{

autocmd BufEnter * :syntax sync fromstart

augroup AutoSaveFolds
	autocmd!
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup END

augroup CursorLine
	autocmd!
	autocmd InsertLeave,WinEnter * set cursorline
	autocmd InsertEnter,WinLeave * set nocursorline
augroup END

autocmd TermOpen * setlocal nobuflisted

autocmd BufRead,BufNewFile *.vue setlocal comments= | set commentstring=//\ %s
autocmd BufRead,BufNewFile *.js setlocal comments= | set commentstring=//\ %s
autocmd BufRead,BufNewFile *.vue setlocal foldnestmax=4
autocmd BufRead,BufNewFile *.js setlocal foldnestmax=1
autocmd BufRead,BufNewFile *.ts setlocal foldnestmax=1
autocmd BufRead,BufNewFile *.vim setlocal foldmethod=marker
let g:vue_pre_processors = []

autocmd User GitGutterStage call fugitive#ReloadStatus()

autocmd BufWinEnter */.git/index nnoremap <esc> :q<cr>
autocmd BufWinLeave */.git/index unmap <esc>

autocmd VimEnter * cd c:\\Users\\ender\\Desktop\\projects

"}}}

" PLUGIN MARKDOWN{{{

let g:vim_markdown_folding_disabled = 1

"}}}

" PLUGIN EMMET{{{

let g:user_emmet_expandabbr_key = '<C-e>'
let g:user_emmet_update_tag = '<M-e>'
let g:user_emmet_removetag_key = '<M-d>'
let g:user_emmet_splitjointag_key = '<M-t>'

"}}}

" PLUGIN WHICHKEY{{{

nnoremap <silent> <leader> :WhichKey '\'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>

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
"
" PLUGIN FLOATERM{{{

map <leader>; :lua require('telescope.builtin').command_history()<cr>
map <leader>c :lua require('telescope.builtin').colorscheme()<cr>
map <leader>m :lua require('telescope.builtin').keymaps()<cr>
map <leader>h :lua require('telescope.builtin').highlights()<cr>
map <leader>f :lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
map <leader>g :lua require('telescope.builtin').git_commits()<cr>
map <leader>l :lua require('telescope.builtin').live_grep()<cr>
" map <space> :lua require('telescope.builtin').buffers({previewer=false,layout_strategy='vertical',layout_config={width=0.6}})<cr>
map <space> :lua require('telescope.builtin').buffers()<cr>
map <C-p> :lua require('telescope.builtin').find_files({layout_strategy='vertical',layout_config={width=0.6}})<cr>
map <M-1> :lua require('telescope.builtin').diagnostics({layout_strategy='vertical',layout_config={width=0.6}})<cr>
map <M-2> :lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
map <M-3> :lua require('telescope.builtin').lsp_document_symbols({layout_strategy='vertical',layout_config={width=0.6}})<cr>
map <M-4> :lua require('telescope.builtin').lsp_references({layout_strategy='vertical',layout_config={width=0.6}})<cr>
map <leader><cr> :lua require('telescope.builtin').resume()<cr>
map <leader>] :lua require('telescope.builtin').resume()<cr>
map <leader>p :TodoTelescope<cr>

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

function! s:toggle_background()
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


