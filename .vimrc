" 256 couleurs biatch please
set t_Co=256

" Encoding dans la statusbar
if has("statusline")
     set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ [%P]
endif
" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Use custom color theme
colorscheme molokai 

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd                             " Show (partial) command in status line.
set showmatch                           " Show matching brackets.
set ignorecase                          " Do case insensitive matching
set smartcase                           " Do smart case matching
set incsearch                           " Incremental search
set hlsearch                            " highlight all the matches for the search (disable until next search with :noh)
set autowrite                           " Automatically save before commands like :next and :make
set hidden                              " Hide buffers when they are abandoned
set mouse=a		                        " Enable mouse usage (all modes)
set nowrap                              " disable wrapping of text
set number                              " show line numbers by default
set laststatus=2                        " always show the statusline
set wildmenu                            " show command line completions
set wildmode=longest:full               " complete mode for wildmenu
set wildmode+=full                      " when pressing tab a second time, fully complete
set cursorline                          " highlight the current line
set noswapfile                          " don't use a swapfile
set nobackup                            " don't use backupfiles
set encoding=utf-8                      " by default set the encoding to UTF-8
set fileformats=unix,dos,mac            " also read mac files correctly, just in case we are dealing with that
set history=1000                        " keep more history (was 50 in Debian config)
set nocompatible                        " no compatibility with old-skool vi
set title                               " set the title
set ruler                               " show cursor position in left bottom corner
set scrolloff=3                         " minimal number of screen lines to keep above and below the cursor.
set sidescrolloff=3                     " minimal number of screen columns to keep next to the cursor

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif
" Other indentation options
set expandtab	        " Insert space whenever tab key is pressed
set tabstop=4           " Number of spaces to replace tabs
set shiftwidth=4        " Number of spaces inserted by indentation plugin
" use :retab to replace existing tabs by spaces


" Custom shortcuts
" ################

" Vislualisation / Insertion mode Ctrl+E/A, Start/EOF
map <C-e> $
imap <C-e> <esc>$i<right>
map <C-a> 0
imap <C-a> <esc>0i

" Search, Ctrl+F and F3/Ctrl+K next result
inoremap  <C-f> <esc>/
nnoremap  <C-f> /
nnoremap  <F3>  n
nnoremap  <C-k> n

" Tabs navigation like firefox
nnoremap <C-p>  :tabprevious<CR>
nnoremap <C-n> :tabnext<CR>
nnoremap <C-t>       :tabnew<CR>
nnoremap <C-w>       :tabclose<CR>
inoremap <C-S-left>  <esc>:tabprevious<CR>i
inoremap <C-S-right> <esc>:tabnext<CR>i
inoremap <C-t>       <esc>:tabnew<CR>
inoremap <C-w>       <esc>:tabclose<CR>i

" Undo / Redo on Ctrl+Z/Y
nnoremap <C-z> u
inoremap <C-z> <esc>ui
nnoremap <C-y> <C-r>
inoremap <C-y> <esc><C-r>i

" Copy/Cut/Paste on Ctrl+C/X/V
vnoremap <C-c> y
vnoremap <C-x> d
nnoremap <C-v> p
inoremap <C-v> <esc>Pi<right>

" Shift based text selection
nnoremap <S-right> v<right>
nnoremap <S-left> v<left>
nnoremap <S-up> v<up>
nnoremap <S-down> v<down>

inoremap <S-right> <esc>v<right>
inoremap <S-left> <esc>v<left>
inoremap <S-up> <esc>v<up>
inoremap <S-down> <esc>v<down>

vnoremap <S-right> <right>
vnoremap <S-left> <left>
vnoremap <S-up> <up>
vnoremap <S-down> <down>

" Window movement
map <esc>[D <C-left>
map <esc>[C <C-right>
map <esc>[A <C-up>
map <esc>[B <C-down>
nnoremap <silent> <C-down> :wincmd j<cr>
nnoremap <silent> <C-up> :wincmd k<cr>
nnoremap <silent> <C-left> :wincmd h<cr>
nnoremap <silent> <C-right> :wincmd l<cr>

" Files tree
nnoremap <silent> <f12> :NERDTreeToggle<cr>
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd VimEnter * NERDTreeFind
autocmd VimEnter * wincmd p
" Mirror tree position for every buffer
autocmd BufEnter * NERDTreeMirror
" Close nerdtree when it's the only buffer left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
