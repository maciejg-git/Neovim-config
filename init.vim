lua << EOF

vim.cmd [[
  source $VIMRUNTIME/mswin.vim

  syntax on

  filetype plugin indent on

  cnoreabbrev qw wq
  cnoreabbrev Wq wq
  cnoreabbrev WQ wq
]]

-- OPTIONS

vim.opt.undofile = true
vim.opt.foldtext = 'MyFoldText()'
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
vim.opt.fillchars={eob = ' '} 
vim.opt.wildignorecase = true
vim.opt.breakindent = true
vim.opt.startofline = false
vim.opt.title = true
vim.opt.equalalways = false
vim.opt.signcolumn='yes:2'
vim.opt.shada:append(",!")
vim.opt.viewoptions={'cursor', 'folds'}
vim.opt.sessionoptions:remove('folds')
vim.opt.sessionoptions:remove('help')
vim.opt.hidden = true
vim.opt.foldmethod='syntax'
vim.opt.foldnestmax=1
vim.opt.foldcolumn='0'
vim.opt.foldlevel=99
vim.opt.completeopt={'menuone', 'noselect'}
vim.opt.breakindent = true
vim.opt.breakindentopt={shift = 2}
vim.opt.guifont='Hack Nerd Font Mono:h12'

-- PACKER

require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'ajmwagar/vim-deus'
  use 'NLKNguyen/papercolor-theme'
  use 'whatyouhide/vim-gotham'
  use 'mhinz/vim-janah'
  use 'mhartington/oceanic-next'
  use 'w0ng/vim-hybrid'
  use 'tomasiser/vim-code-dark'

  use 'nvim-lua/plenary.nvim'

  use 'plasticboy/vim-markdown'
  use 'mustache/vim-mustache-handlebars'
  use 'pangloss/vim-javascript'
  use 'mattn/emmet-vim'
  use 'posva/vim-vue'
  use 'HerringtonDarkholme/yats.vim'
  use 'norcalli/nvim-colorizer.lua'

  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  use 'neovim/nvim-lspconfig'
  use 'ray-x/lsp_signature.nvim'
  use 'folke/trouble.nvim'

  use 'nvim-telescope/telescope.nvim'

  use 'hoob3rt/lualine.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'liuchengxu/vim-which-key'
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  use 'godlygeek/tabular'
  use 'tomtom/tcomment_vim'
  use 'nacro90/numb.nvim'
  use 'folke/todo-comments.nvim'
  use 'sbdchd/neoformat'
  use 'windwp/nvim-autopairs'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'

  use 'sainnhe/edge'
  use 'lifepillar/vim-gruvbox8'
  use 'rebelot/kanagawa.nvim'
  use 'olimorris/onedarkpro.nvim'
  use {'catppuccin/nvim', as = 'catppuccin'} 
  use 'projekt0n/github-nvim-theme'

  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'luukvbaal/stabilize.nvim'
  use 'akinsho/toggleterm.nvim'

  use 'max397574/better-escape.nvim'

  use {'akinsho/bufferline.nvim', tag = 'v2.*' }

  use 'kylechui/nvim-surround'
end)

-- PLUGINS

-- LSP CONFIG

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

-- LSP SIGNATURE

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

-- TELESCOPE

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

-- SURROUND

require("nvim-surround").setup()

-- GIT

vim.g.vue_pre_processors = {}
vim.api.nvim_create_autocmd('User', { pattern = 'GitGutterStage', command = 'call fugitive#ReloadStatus()' })

-- MARKDOWN

vim.g.vim_markdown_folding_disabled = 1

-- EMMET

vim.g.user_emmet_expandabbr_key = "<C-e>"
vim.g.user_emmet_update_tag = "<M-e>"
vim.g.user_emmet_removetag_key = "<M-d>"
vim.g.user_emmet_splitjointag_key = "<M-t>"
vim.keymap.set('n', '<leader>', ":WhichKey '\'<CR>", {remap = false})
vim.keymap.set('n', '<localleader>', ":WhichKey '\'<CR>", {remap = false})

-- FLOATERM

vim.g.floaterm_keymap_new = ""
vim.g.floaterm_keymap_prev = ""
vim.g.floaterm_keymap_next = ""
vim.g.floaterm_keymap_toggle = "<F12>"

-- INDENT BLANKLINE

vim.g.indent_blankline_filetype = {'vue', 'javascript', 'typescript', 'html'}

-- MAPPING

vim.keymap.set('n', '<leader>r', '*``cgn', {remap = false})
vim.keymap.set('v', '<leader>r', [[ "y/\\v\<c-r>=escape(@\", '/')\<cr>\<cr>" . "``cgn" ]], {remap = false, expr = true})

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

vim.keymap.set('n', '<F2>', ":PackerInstall<CR>")
vim.keymap.set('n', '<F3>', ":PackerClean<CR>")
vim.keymap.set('n', '<F4>', ":PackerUpdate<CR>")
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

-- AUTOCOMMAND

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

-- COLORSCHEME

vim.opt.background = 'dark'

-- latte frappe macchiato mocha
vim.g.catppuccin_flavour = "macchiato"

--  hybrid github_dark edge kanagawa
vim.cmd [[
  colorscheme catppuccin
]]

EOF

" FUNCTIONS

function MyFoldText()
	let line = getline(v:foldstart)
	return '+ ' . v:folddashes . ' ' . line
endfunction

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


