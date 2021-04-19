source $VIMRUNTIME/mswin.vim

let g:python3_host_prog = 'C:\Users\ender\AppData\Local\Programs\Python\Python37\python'

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
set statusline=\ \ %{WebDevIconsGetFileTypeSymbol()}\ %{expand('%:t')}\ \ \[\ %{expand('%:p:h:t')}\ \]\ %{FugitiveStatusline()}\ %{GitStatus()}\ %h%m%r\ %=%-10.(%l,%c%V%)\ %P
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
set guifont=Hack\ Nerd\ Font\ Mono:h12

"}}}

" PLUG{{{

call plug#begin('~/.vim/plugged')

Plug 'ajmwagar/vim-deus'
Plug 'NLKNguyen/papercolor-theme'
Plug 'whatyouhide/vim-gotham'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-janah'
Plug 'mhartington/oceanic-next'

Plug 'plasticboy/vim-markdown'
Plug 'mustache/vim-mustache-handlebars'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
" Plug 'leafOfTree/vim-vue-plugin'
Plug 'posva/vim-vue'
Plug 'HerringtonDarkholme/yats.vim'

Plug 'godlygeek/tabular'
Plug 'liuchengxu/vim-which-key'
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'voldikss/vim-floaterm'


Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
"}}}

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
vmap <PageUp> <left>
vmap <PageDown> <right>

nnoremap <silent> <C-L> :nohlsearch<cr>

nnoremap <leader>r *``cgn
vnoremap <expr> <leader>r "y/\\v\<c-r>=escape(@\", '/')\<cr>\<cr>" . "``cgn"

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
imap <leader>c console.log()<left>
imap <leader>j JSON.stringify()<left>
imap <leader>fa () => {<cr>
imap <leader>ff function() {<cr>
imap <leader>i if() {<cr>

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

nmap <leader>g :G<cr>
map <c-g> :G<cr>
nmap <leader>s \hs
nmap <leader>p \hp

"}}}

" MAPPING COMPLETION{{{

imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"

"}}}

" COLORSCHEME{{{

set background=dark
" colorscheme gruvbox
" colorscheme OceanicNext
" colorscheme janah
colorscheme PaperColor

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

autocmd ColorScheme deus hi StatusLine gui=none,reverse
autocmd ColorScheme deus hi StatusLineNC gui=none guibg=#242a32

autocmd ColorScheme gotham256 hi StatusLine gui=bold

autocmd ColorScheme PaperColor hi VertSplit guifg=#303030 guibg=none

autocmd ColorScheme OceanicNext hi! link VertSplit Normal

autocmd ColorScheme janah hi! link Pmenu CursorLine

autocmd ColorScheme gruvbox hi link htmlCommentPart Comment
autocmd ColorScheme gruvbox hi link htmlComment Comment
autocmd ColorScheme gruvbox hi GruvboxGreenSign guibg=none gui=bold
autocmd ColorScheme gruvbox hi GruvboxAquaSign guibg=none gui=bold
autocmd ColorScheme gruvbox hi GruvboxRedSign guibg=none gui=bold

autocmd ColorScheme * hi link Floaterm CursorLine
autocmd ColorScheme * hi link FloatermBorder CursorLine
 
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

autocmd User GitGutterStage call fugitive#ReloadStatus()

autocmd BufWinEnter */.git/index nnoremap <esc> :q<cr>
autocmd BufWinLeave */.git/index unmap <esc>

autocmd VimEnter * cd c:\\Users\\ender\\Desktop\\projects

"}}}

" PLUGIN MARKDOWN{{{

let g:vim_markdown_folding_disabled = 1

"}}}

" PLUGIN LEADERF{{{

let g:Lf_ShortcutF = '<C-P>'
let g:Lf_CursorBlink = 0
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_HideHelp = 1
let g:Lf_WorkingDirectoryMode = 'ac'
let g:Lf_CommandMap = {'<C-j>': ['<down>', '<C-j>'], '<C-k>': ['<up>', '<C-k>']}
let g:Lf_ExternalCommand = 'fd -t f -E *.jpg -E *.png -E *.svg -E node_modules -E sessions -E *.ttf -E *.TTF -E *.otf "%s"'
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_WindowPosition = 'bottom'
let g:Lf_JumpToExistingWindow = 0

nmap <leader>l :LeaderfLineAll<cr>
nmap <leader>; :LeaderfHistoryCmd<cr>
nmap <leader>c :LeaderfColorscheme<cr>
nmap <space> :LeaderfBuffer<cr>

"}}}

" PLUGIN EMMET{{{

let g:user_emmet_expandabbr_key = '<C-e>'
let g:user_emmet_update_tag = '<M-e>'

"}}}

" PLUGIN AUTOPAIRS{{{

let g:AutoPairsMapCR = 1 
let g:AutoPairsCenterLine = 0
let g:AutoPairsMultilineClose = 0

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

" PLUGIN GIT{{{

let g:gitgutter_sign_removed = '-'
" let g:gitgutter_preview_win_floating = 0

" }}}

" PLUGIN COC{{{

nmap <silent> <M-d> <Plug>(coc-definition)
nmap <silent> <M-r> <Plug>(coc-references)

command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
vmap <M-f>  <Plug>(coc-format-selected)
nmap <M-f>  <Plug>(coc-format-selected)

nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent><nowait> <M-1>  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <M-3>  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <M-2>  :<C-u>CocList -I --ignore-case symbols<cr>

nnoremap <silent> M :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

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

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

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


