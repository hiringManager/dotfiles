" Highlight the line on which the cursor lives.
set nocursorline

" Always show at least one line above/below the cursor.
set scrolloff=1
" Always show at least one line left/right of the cursor.
set sidescrolloff=5

" Relative line numbers
set number relativenumber

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Remove timeout for partially typed commands
set notimeout

"if has("termguicolors")
 set termguicolors
   "endif


" Fix indentation
map <F7> gg=G<C-o><C-o>
" Toggle auto change directory
map <F8> :set autochdir! autochdir?<CR>

" Toggle vertical line
set colorcolumn=
fun! ToggleCC()
  if &cc == ''
    " set cc=1,4,21
    set cc=80
  else
    set cc=
  endif
endfun


" Control-V Paste in insert and command mode
"imap <C-V> <esc>pa
"cmap <C-V> <C-r>0

" Insert mode movement
imap <M-h> <left>
imap <M-j> <down>
imap <M-k> <up>
imap <M-l> <right>
imap <M-f> <C-right>
imap <M-b> <C-left>

" Manually refresh file
" nmap <F5> :e!<cr>

" Indentation
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set autoindent

" Mouse support
set mouse=a

"Case insensitive searching
set ignorecase

"Will automatically switch to case sensitive if you use any capitals
set smartcase

" Highlighted yank (-1 for persistent)
" let g:highlightedyank_highlight_duration = 400


" Clear search highlighting with Escape key
nnoremap <silent><esc> :noh<return><esc>

" Allow color schemes to do bright colors without forcing bold.
"if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  "set t_Co=16
"endif

set encoding=utf8
scriptencoding utf-8

nmap <F2> <Esc>:w<CR>:! clear;python3 %<CR>

" remove status bar
set laststatus=0 ruler

" undo history
set undodir=~/.vim/undodir
set undofile

set wrap linebreak

" vnoremap <C-S-/> :s/^/#/g<CR>
"

let g:clipboard = {
      \ 'name': 'wsl-clipboard',
      \ 'copy': {
      \   '+': 'clip.exe',
      \   '*': 'clip.exe',
      \ },
      \ 'paste': {
      \   '+': 'powershell.exe -nologo -noprofile -command Get-Clipboard',
      \   '*': 'powershell.exe -nologo -noprofile -command Get-Clipboard',
      \ },
      \ 'cache_enabled': 0,
      \ }

" Map Ctrl+C in visual mode to copy to Windows clipboard
vnoremap <C-c> "+y

" Undo-tree
" 
nnoremap <F5> :UndotreeToggle<CR>
" or
" vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)

highlight clear
syntax reset
"hi normal guibg=none ctermbg=none
"hi NormalNC guibg=NONE ctermbg=NONE
"hi EndOfBuffer guibg=NONE ctermbg=NONE
"hi SignColumn guibg=NONE ctermbg=NONE


set termguicolors
colorscheme legalpad

hi normal guibg=none ctermbg=none
hi NormalNC guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE

hi Normal        guibg=NONE ctermbg=NONE
hi NormalNC      guibg=NONE ctermbg=NONE
hi EndOfBuffer   guibg=NONE ctermbg=NONE
hi SignColumn    guibg=NONE ctermbg=NONE
hi LineNr        guibg=NONE ctermbg=NONE
hi LineNrNC      guibg=NONE ctermbg=NONE
hi VertSplit     guibg=NONE ctermbg=NONE
hi FoldColumn    guibg=NONE ctermbg=NONE
