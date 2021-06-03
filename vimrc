" ------------------------- Basics -------------------------------------"
set nocompatible " explicitly get out of vi-compatible mode
set background=dark " we plan to use a dark background
syntax on " syntax highlighting on
au BufRead,BufNewFile *Dict set filetype=c 
" ------------------------- Vim UI -------------------------------------"
colorscheme elflord " default for console (over-ridden when GUI used)
"set cursorcolumn " highlight the current column 
set cursorline " highlight current line
set incsearch " BUT do highlight as you type you search phrase
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set ai "auto indent
set si "smart indent
set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink
"set mouse=a "Enables use of the mouse in every mode
set number "Display line numbers on the side
set encoding=utf8 "Set utf8 encoding
set laststatus=2 "Always show the status line
set hlsearch " Highlight search results
set path+=**
set wildmenu

" --------------- Content of the status line -------------------------"
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ emplacement:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set statusline=\ %t\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y\ %w\ %=%c,%l/%L\ %P

" -------- Colors of the status line according to the edition mode ---"
highlight statusLine cterm=bold ctermfg=black ctermbg=LightRed
au InsertLeave * highlight StatusLine cterm=bold ctermfg=black ctermbg=LightRed
au InsertEnter * highlight StatusLine cterm=bold ctermfg=black ctermbg=LightGreen 

" --------------------------- Misc -----------------------------------"

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

function! HasPaste()
    if &paste 
        return 'PASTE MODE '
    en
    return ''
endfunction
    
" -------------- Use space to jump down a page ---------------------"
nnoremap   <Space> <PageDown>
xnoremap   <Space> <PageDown>

"=======[ Prettier tabline ]========================================
"
highlight Tabline      cterm=underline       ctermfg=40     ctermbg=22
highlight TablineSel   cterm=underline,bold  ctermfg=white  ctermbg=28
highlight TablineFill  cterm=NONE            ctermfg=black  ctermbg=black

" -------------------------- Plugins -----------------------------------"
execute pathogen#infect()
" ------ vim Extension OpenFOAM
filetype plugin indent on
:let g:foam256_use_custom_colors=1
:set t_Co=256
" ------- VMATH
vmap <expr> ++ VMATH_YankAndAnalyse()
nmap        ++ vip++

