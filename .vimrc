"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu
set wildoptions=pum

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
hi Search ctermbg=yellow ctermfg=black guibg=yellow guifg=black

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue
set cmdheight=2


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4

set nocp
filetype plugin on
set number
" show tabs always
set showtabline=2

" no swap file
set noswapfile
" Backup, undo and swap files directories
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
" save undo trees in files
set undofile
set undodir=~/.vim/undo//
set undolevels=10000 " How many undos


" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
	autocmd TextYankPost * if v:event.operator ==# 'y' || v:event.operator ==# 'd' | call system('cat |' . s:clip, @0) | endif
    augroup END
endif

autocmd BufWritePost .vimrc source %

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Using iTerm2? Go-to preferences / profile / colors and disable the smart bar
" cursor color. Then pick a cursor and highlight color that matches your theme.
" That will ensure your cursor is always visible within insert mode.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

let NERDTreeShowHidden=1

" Show partial commands in the last line of the screen
set showcmd

" Show trailing spaces
set list
set listchars=tab:→\ ,trail:·,extends:…,precedes:…,nbsp:␣

" Set mouse for all modes
set mouse=a

" Show search count
set shortmess-=S

set rtp+=/usr/share/powerline/bindings/vim/
set rtp+=/usr/lib/python3/dist-packages/
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2

" signcolumn is always on
set signcolumn=yes
" vim-signify
highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
" Bundle 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()
set completeopt-=preview

" vim-plug
call plug#begin()
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'mhinz/vim-signify'
Plug 'tmsvg/pear-tree'
Plug 'luochen1990/rainbow'
Plug 'mhinz/vim-startify'
Plug 'github/copilot.vim'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
call plug#end()

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let lightcolors =  ['green', 'yellow', 'cyan', 'darkyellow', 'red', 'magenta', 'white']
let darkcolors = ['DarkBlue', 'Magenta', 'Black', 'Red', 'DarkGray', 'DarkGreen', 'DarkYellow']
let g:rainbow_conf = {
\   'ctermfgs': (lightcolors),
\   'htmldjango': 0,
\}


"Cursor settings:

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
" key maps

" let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
" let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)
highlight MatchParen ctermbg=200 ctermfg=white guibg=lightblue guifg=white

noremap Y y$
" QQ: quit all buffers, without saving, and without a warning
noremap QQ :qa!<CR>
" XX: exit all (save all changes and close Vim), and without a warning
noremap XX :xa!<CR>

nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>
nnoremap <Leader><Leader> <C-w><C-w>
nnoremap ; :
nnoremap : ;

" insert today's date
nnoremap <Leader>d :r !date -I<CR>
