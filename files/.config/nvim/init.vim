syntax on

let mapleader = " "
set guicursor=
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=6 softtabstop=4
set shiftwidth=2
set sts=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=9
set clipboard=unnamed

set autoread
set tabpagemax=100
set ignorecase
set nostartofline
set ruler
set visualbell
set mouse=a

set cmdheight=2
set updatetime=50
set shortmess+=c

set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey

" ctags -R .
set tags=tags

" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/plugged/Vundle.vim
call vundle#begin('~/.vim/plugged')
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'dracula/vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'mbbill/undotree'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'hashivim/vim-terraform'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-commentary'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'matze/vim-move'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'dag/vim-fish'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'elixir-editors/vim-elixir'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'liuchengxu/vim-which-key'
Plugin 'preservim/tagbar'
call vundle#end()
filetype plugin indent on

" Theme
colorscheme dracula
set background=dark

let g:airline_powerline_fonts = 1

" For simple sizing of splits
map - <C-W>-
map + <C-W>+

" Remaps. This is where the magic of vim happens
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
" nnoremap <C-p> :GFiles<CR>

" nmap <leader> gd <Plug>(coc-definition)
" nmap <leader> gy <Plug>(coc-type-definition)
" nmap <leader> gi <Plug>(coc-implementation)
" nmap <leader> gr <Plug>(coc-references)
" nmap <leader> rn <Plug>(coc-rename)

nmap <leader>u :UndotreeShow<CR>

" Mapping <tab> to change navigate on tabs
nmap <tab> :tabnext<CR>
" Mapping control + <tab> to go to the previous tab
nmap <C-tab> :tabprevious<CR>

" Notes <--------------
:let g:notes_directories = ['~/Dropbox/notes/vim-notes']


" xxxxxxx

nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }


" NERDTree <--------------
map <C-g> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>
nnoremap <silent> <Leader>r+ :vertical resize +5<CR>
nnoremap <silent> <Leader>r- :vertical resize -5<CR>
nnoremap <C-x> :NERDTreeMapOpenSplit<CR>
let g:NERDTreeMapOpenSplit = 'x'
let g:NERDTreeMapOpenVSplit = 'v'

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"change default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=1
" show hidden files in NERDTree
let NERDTreeShowHidden=1

" Terraform <--------------
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" vim-go <--------------
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"    " Run goimports along gofmt on each save
let g:go_auto_type_info = 0           " Automatically get signature/type info for object under cursor
au filetype go inoremap <buffer> . .<C-x><C-o>

" doesn't select the first completion item
set completeopt=longest,menuone

let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_debug_windows = {
      \ 'vars':  'leftabove 35vnew',
      \ 'stack': 'botright 10new',
\ }

let g:go_test_prepend_name = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

let g:go_null_module_warning = 0
let g:go_echo_command_info = 1

let g:go_autodetect_gopath = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint']

let g:go_highlight_space_tab_error = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_gocode_propose_source = 1

let g:go_modifytags_transform = 'camelcase'
let g:go_fold_enable = []

au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>l <Plug>(go-metalinter)

au FileType go nmap <leader>r  <Plug>(go-run)

au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>t  <Plug>(go-test)
au FileType go nmap <leader>dt  <Plug>(go-test-compile)
au FileType go nmap <Leader>d <Plug>(go-doc)

au FileType go nmap <Leader>e <Plug>(go-rename)

if has('nvim')
  au FileType go nmap <leader>rt <Plug>(go-run-tab)
  au FileType go nmap <Leader>rs <Plug>(go-run-split)
  au FileType go nmap <Leader>rv <Plug>(go-run-vertical)
endif

" ============================= vim-which-key ============================
" Setup WhichKey here for our leader.
" TODO: figure out why the timeout doesn't work
nnoremap <silent> <leader> :<c-u>WhichKey ','<CR>
call which_key#register(',', "g:which_key_map")
" Define prefix dictionary
let g:which_key_map =  {}
nnoremap <leader>? :WhichKey ','<CR>
let g:which_key_map['?'] = 'show help'

" Telescope <--------------
if has('nvim')
  let g:which_key_map.f = { 'name' : '+telescope find' }
  nnoremap <leader>ff <cmd>Telescope find_files<CR>
  let g:which_key_map.f.f = 'telescope find files'
  nnoremap <leader>fg <cmd>Telescope live_grep<CR>
  let g:which_key_map.f.g = 'telescope live grep'
  nnoremap <leader>fb <cmd>Telescope buffers<CR>
  let g:which_key_map.f.b = 'telescope buffers'
  nnoremap <leader>fh <cmd>Telescope help_tags<CR>
  let g:which_key_map.f.h = 'telescope help tags'

  " Make Ctrl-p work for telescope since we know those keybindings so well.
  nnoremap <C-p> <cmd>Telescope find_files<CR>
  nnoremap <C-l> <cmd>Telescope live_grep<CR>
  nnoremap <C-r> <cmd>Telescope git_branches<CR>

  if !executable('rg')
    echo "You might want to install ripgrep: https://github.com/BurntSushi/ripgrep#installation"
  endif

lua << EOF
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        -- map actions.which_key to ?
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["?"] = "which_key"
      }
    },
    file_ignore_patterns = {
      "^.git/",
      ".DS_Store",
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      find_command = {"rg", "--ignore", "--hidden", "--files"},
      },
    live_grep = {
      theme = "dropdown",
      },
    buffers = {
      theme = "dropdown",
      },
    git_branches = {
      theme = "dropdown",
      },
  },
  extensions = {
  }
}
EOF
endif
" let g:ctrlp_map = '<c-pp>'
" let g:ctrlp_cmd = 'CtrlP'
" map <c-p> :call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))<CR>

" nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
" nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
" nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>

" nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
" nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
" nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>

" Snippet <--------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" Open a new tab and search for something
nmap <leader>a :tab split<CR>:Ag ""<Left>
" Immediately search for the word under the cursor in a new tab
nmap <leader>A :tab split<CR>:Ag <C-r><C-w><CR>


