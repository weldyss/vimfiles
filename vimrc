set nocompatible
syntax enable
set encoding=utf-8

"setting vundler 
filetype off
set rtp+=~/.vim/bundle/vundle.vim/
call vundle#rc()
source ~/.vim/bundles.vim

set t_Co=256
set background=dark
color solarized
filetype plugin indent on
set number
set ruler       " show the cursor position all the time
set cursorline
set showcmd     " display incomplete commands

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden
set winheight=30
set winminheight=5

"" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
"set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
"" Searching
set hlsearch                      " highlight matches
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " ... unless they contain at least one capital letter

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make set noexpandtab

  " Make sure all mardown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

" provide some context when editing
set scrolloff=3

" mouse configs
set mouse=a
set ttymouse=xterm2

set clipboard=unnamed

" don't use Ex mode, use Q for formatting
map Q gq

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

let mapleader=","

map <leader>gg :topleft 100 :split Gemfile<cr>
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

map <leader>vs :vsplit<cr>
map <leader>sp :split<cr>
nnoremap <leader><leader> <c-^>

" find merge conflict markers
nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" ctrl-p configs
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

" ctrl-p shortcuts
map <leader>p :CtrlP<cr>

" disable cursor keys in normal mode
map <Left>  :echo "Solta essa porra!"<cr>
map <Right> :echo "Solta essa porra!"<cr>
map <Up>    :echo "Solta essa porra!"<cr>
map <Down>  :echo "Solta essa porra!"<cr>
map <M> :echo "fu"<cr>

" tabs
nnoremap <C-t> :tabnew<CR>
nnoremap <C-D> :tabclose<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>

" no more backup or swap file
set nobackup
set noswapfile

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v[\/](vendor)$'
let g:ctrlp_custom_ignore = '\v[\/](node_modules)$'


if has("statusline") && !&cp
  set laststatus=2  " always show the status bar
  set statusline=%F%m%r%h%w
  set statusline+=\ %{fugitive#statusline()}\    
  set statusline+=\ [line\ %l\/%L]
  set statusline+=%=
  set statusline+=\[%{strftime('%a\ %H:%M\')}]
endif

" another mappings
let g:move_key_modifier = 'C'


" Typescript
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Emmet html
let g:user_emmet_leader_key='<C-Z>'

augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END
