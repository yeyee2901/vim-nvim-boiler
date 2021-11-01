" ░░░█░█░░░▀█▀░░░█▄█░░
" ░░░▀▄▀░░░░█░░░░█░█░░
" ░░░░▀░░░░▀▀▀░░░▀░▀░░
" ░░░█▄█░▀█▀░█▀█░▀█▀░█▄█░█░█░█▄█░░
" ░░░█░█░░█░░█░█░░█░░█░█░█░█░█░█░░
" ░░░▀░▀░▀▀▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀░▀░░
" ░░░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀░░
" ░░░█░░░█░█░█░█░█▀▀░░█░░█░█░░
" ░░░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░░
" yeyee2901 - 2021
" - This file must be placed at $HOME directory
"       ~/.vimrc
" 
" - If your Nvim config still uses Vimscript, place
"   this file at $HOME/.config/nvim/ with init.vim
"   as the file name
"       ~/.config/nvim/init.vim
"
" - To source the file:
"   :source ~/.config/nvim/init.vim
"   :source .vimrc
"   or if you're currently on the file:
"   :source %

" BASIC SETTINGS -------------------------------
filetype indent plugin on   " mandatory
syntax on                   " mandatory
set encoding=utf8           " mandatory
set number                  " either "set nu"
" set relativenumber        " try this if you want

" Synchronize vim copy register (" register) with
" system clipboard. Must have clipboard tool installed,
" google your specific system cliboard tool for more info.
set clipboard=unnamedplus

" Mouse are for the weak
set mouse=

" Goodby "Swap file" error in vim
set noswapfile

" Tab stop. adjust as needed
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Tabs will be converted to spaces when buffer is saved
set expandtab

" Follow previous line indentation
set smartindent
set smarttab

" Disable line wrapping when it reaches end of screen
set nowrap

" Disable case sensitive in search (both for regex subs using :s and 
" normal search using /)
set ignorecase

" Defines timeout for keystroke, pressing key before the timeout
" is considered a keystroke
set timeout 
set timeoutlen=2000

" Disable search highlighting. By default, vim will stil highlight the
" search results even though we have exited the search context
set nohlsearch

" Hide closed buffers from buffer lists
set hidden

" Cursor line
set cursorline

" By default, vim splits the window in TOP-LEFT, which is kinda weird
" let's change that
set splitbelow
set splitright


" KEYBINDINGS --------------------------------
" Leader key - Most common leader key is
" Space because it's a big key
nnoremap <SPACE> <NOP>
let g:mapleader=' '         " let g:  are global variables
let g:maplocalleader=' '    " Globals are known across all vim runtime path
                            " Check :set rtp? for info

" Toggle search highlighting
" Idiom to :set hl<CR>
nnoremap <S-h> <cmd>set hl<CR>

" Make <S-y> behave the same as <S-d> & <S-c>
" Yank until end of line
" nnoremap:
"   n - NORMAL mode
"   nore - non recursive*
nnoremap <S-y> y$

" Visual Mode ---------------
" Visual select + increase indent
" vnoremap:
"   v - VISUAL mode
"   nore - non recursive
vnoremap <silent> <Tab> >gv

" Visual select + decrease indent
vnoremap <silent> <S-Tab> <gv
vnoremap <silent> <BS> xgv

" *Non recursive help:
" For example I noremapped <C-w><C-h> to <C-h>  , then
" I have a another mapping using <C-h>   ,
"
" NOT using "nore" properties:
"   - nmap h <C-h><CR>
"       will be expanded to -> nmap h <C-w><C-h><CR>
"   
" using "nore" properties:
"   - nnoremap h <C-h><CR>
"       <C-h> will not be expanded. So it's just the same.
"
" "nore" properties defines whether we want to expand the keymapping
" or not

" Window Keymappings --------
" Navigation - 90% of ppl use these kind of keymap
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" splits
" Vertical
nnoremap sv <C-w>v

" Horizontal
nnoremap sh <C-w>s

" Close split
nnoremap sq <C-w>q

" rotate splits
nnoremap sr <C-w><C-r>

" Window / split resizing
" Resize vertical
nnoremap <M-h> <C-w><
nnoremap <M-l> <C-w>>

" Resize horizontal
nnoremap <M-k> <C-w>+
nnoremap <M-j> <C-w>-


" Tab Keymappings -----------
" Feel free to use if you're a tab person like me
nnoremap <Tab>n :tabnew<CR>
nnoremap <Tab>q :tabclose<CR>
nnoremap <Tab>l :tabnext<CR>
nnoremap <Tab>h :tabprevious<CR>


" AUTOCOMMANDS ----------------------------------
" autocommands are things that will get executed whenever a
" condition / specific event is met. The syntax is:
"
"   autocmd <condition or event> <optional pattern> <what to execute>
"   au      <condition or event> <optional pattern> <what to execute>
"
" You can look at :help autocmd-define for more info
"
" It's best to group autocmds' for better management
augroup C_FILE_LIKE_INDENT
    autocmd!
    autocmd FileType c,cpp,objc,objcpp,lua,php,javascript,html,css set tabstop=2
    autocmd FileType c,cpp,objc,objcpp,lua,php,javascript,html,css set softtabstop=2
    autocmd FileType c,cpp,objc,objcpp,lua,php,javascript,html,css set shiftwidth=2
augroup END


" OTHER SETUPS ----------------------------------
set termguicolors " for terminals that support true GUI color

"Disable weird highlight
"hi stands for highlight, which means "color" in vim
hi Normal ctermbg=NONE
hi LineNr ctermbg=NONE
hi SignColumn ctermbg=NONE
hi LineCursor term=NONE cterm=NONE

" Line Cursor
" The colors for LineCursor are set from the guibg property
highlight LineCursor term=NONE cterm=NONE ctermbg=Gray guibg=#300840



" Builtin File explorer -------------
nnoremap <Leader>n :Lexplore<CR>

" Tree-style
let g:netrw_liststyle=3

" Size in % , relative to your screen size
let g:netrw_winsize=20

" Terminal ------------------
" To enter INSERT mode: i
"
" To close the terminal, either:
"   - Kill the terminal using <C-d>
"   - press <C-\><C-n> to enter normal mode and close the buffer :q
nnoremap <Leader>t :terminal<CR>
