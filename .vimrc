" ~/.vimrc
"
" UPDATED in 2009-10-17 at 18:07

" ========================================
" Settings
" ========================================

" color theme
colorscheme ron
" settings for gVim
if has ("gui_running")
    set guifont=Monospace\ Bold\ 09
    "set guioptions toolbar=
    set guioptions-=T
endif
" no vi compatibility
set nocompatible
" show matching parentheses
set showmatch
" don't fold things
set nofoldenable
" give cursor position
set ruler
" make no backups
set nobackup
" setting text wrap
set wrap
" continue searching at top when hitting bottom
set wrapscan
" use autoindent
set autoindent
" expand tabs
set expandtab
" how many spaces for indenting
set shiftwidth=4
" searches are case insensitive and incremental
set ignorecase
set incsearch
" highlight searches
set hlsearch
" tab width
set tabstop=4
" keep context when scrolling
set scrolloff=5
" autowrite, automatic saves
"set aw
" set downwards search path whith 'gf'
set path+=./**
" setting a filter/prog to 'equalprog'
"set equalprg=tidy\ -utf8\ -q\ -i\ -u\ -f\ /tmp/tidy.err
" enable 'tabline'
set showtabline=1
" history
set history=100

"========================
" Syntaxhiglighting
"========================

let color = "true"
if has("syntax")
    if color == "true"
        " This will switch colors ON
        so ${VIMRUNTIME}/syntax/syntax.vim
    else
        " this switches colors OFF
        syntax off
        set t_Co=0
    endif
endif
" Use brighter colors if your xterm has a dark background.
if &term =~ "xterm"
   set background=dark
endif

" ==============================================
" Mappings/Abreviattions
" ==============================================

" use shell with ctrl-z
map <C-z> :shell<CR>

" Quit with 'q' instead of ':q'. VERY useful!
" map q :q<CR>
"map Q :q!<CR>

" Forced quit
" TODO clean all .swp before
imap <F12><Esc> :wqa!<CR>
map <F12> :wqa!<CR>

"save exit
"map X :x<CR>
"
" Next and previous tabs
"map <C-n> :tabn<CR>
"map <C-p> :tabp<CR>

" disable hlsearch
nnoremap <silent><C-l> :nohl<CR><C-l>

" create 'new file' if the 'gf' file dont exists
nnoremap gF :sp<cfile><CR>

" open 'pdf files' straight from vim
"map gX :silent !xpdf <cfile> 2>&1 /dev/null<CR>

" abreviattions of usual cmd's
cab W w| cab Q q| cab Wq wq| cab wQ wq| cab WQ wq

" Barra de espaço mapeado para PageDown no modo de comandos
noremap <Space> <PageDown>
noremap <BS> <Up>

" the '=' here is used as a prefix
" insert 'date' in insert mode
"imap =D <esc>:r!date '+\%Y-\%m-\%d'<CR>kJA
"iab =D <esc>:r!date '+\%Y-\%m-\%d'<CR>kJA
if exists("*strftime")
    imap =D <C-r>=strftime("%Y-%m-%d")<CR>
    imap =H <C-r>=strftime("%H:%M")<CR>
    imap =T <C-r>=strftime("%Y-%m-%d at %H:%M")<CR>
endif

" PalavrasRepetidas: procura palavras repetidas no texto (aurelio)
nmap ,pr /\<\(\w*\) \1\><CR>

" for easy file reload, quit, write, write-exit
"nmap ,e :e! <CR>
"nmap ,r :w! | e | w <CR>
nmap ,q :q!<CR>
"nmap QQ :q! <CR>
nmap ,w :w!<CR>
"nmap ,x :x! <CR>

" for easy edit and source 'vimrc' files
nmap ,cv :source ~/.vimrc<CR>
nmap ,sv :sp ~/.vimrc<CR>
nmap ,ev :e ~/.vimrc<CR>

" make backup of files
nmap ,bk :w! ~%<CR>
if exists("*strftime")
    nmap ,bkd :execute ":w" . expand("%:p") . "_" . strftime("%Y%m%d%H%S")<CR>
    "imap =H <C-r>=strftime("%H:%M")<CR>
    "imap =T <C-r>=strftime("%Y-%m-%d at %H:%M")<CR>
endif

" quick view of tabs pages (showtabeline is disabled)
"nmap ,t :tabs <CR>
nmap ,tb :tabe<CR>

" Mapping copy n paste in X11 envoriment
"" BUG: wating for mapping <C> <S> X to work in next vim releases,
""      mapping a simplier way
"" TODO: gvim check
if has ("gui_running")
    nmap <silent> <C-A-v> "+p<CR>
    imap <silent> <C-A-v> <C-o>"+p<CR>
    vmap <silent> <C-A-c> "+y<CR>
endif

"============================================================================
" Functions
"============================================================================

" turn off/on coments, printing them black
fu! CommOnOff()
  if !exists('g:hiddcomm')
    let g:hiddcomm=1 | hi Comment ctermfg=black guifg=black
  else
    unlet g:hiddcomm | hi Comment ctermfg=cyan  guifg=cyan term=bold
  endif
endfu
map <F11> :call CommOnOff()<CR>

" automatically give executable permissions if file begins with #! and contains
" '/bin/' in the path
function! ModeChange()
  if getline(1) =~ "^#!"
    if getline(1) =~ "/bin/"
      silent !chmod a+x <afile>
    endif
  endif
endfunction

"" From http://www.perlmonks.org/?node_id=540411
"function! CurrSubName()
"    let g:subname = ""
"    let g:subrecurssion = 0
"
"    " See if this is a Perl file
"    let l:firstline = getline(1)
"
"    if ( l:firstline =~ '#!.*perl' || l:firstline =~ '^package ' )
"        call GetSubName(line("."))
"    endif
"
"    return g:subname
"endfunction

"============================================================================
" Statusline, Ruler
"============================================================================
set laststatus=2        " ls:  always put a status line
set statusline=%([%-n]%y\ %f%M%R%)\ %=\ %(%l,%c%V\ %P\ [0x%02.2B]%)
"set statusline=%([%-n]%y\ %f%M%R%)\ %{CurrSubName()}\ %=\ %(%l,%c%V\ %P\ [0x%02.2B]%)
"set maxfuncdepth=1000   " Need more depth for sub names

"============================================================================
" Auto-commands
"============================================================================

" Remove trailing whitespace on file-load and write it
"if &l:ft != 'help'
"if getline(4) !~ 'vim.*manual'
    "autocmd BufRead * :%s/[ \t\r]\+$//e | :w
    "autocmd BufRead * silent! %s/[ \t\r]\+$//e | :w
    autocmd BufRead * silent! %s/[ \t\r]\+$//e
"endif

" set 'text width' default
"autocmd BufEnter * set tw=80
au BufNewFile,BufRead * set tw=0
au BufNewFile,BufRead *.sh,*.py,*.rb set tw=85

" 'txt' files whithout special 'filetype'
"au BufNewFile,BufRead *.txt set tw=80 ts=8 ft=txt "spell
au BufNewFile,BufRead *README,*NEWS,*TODO set ft=txt "spell

" 'Makefile' ele adora usar linhas compridas malas
"au BufNewFile,BufRead Makefile set tw=0

" call funcition 'ModeChange'
au BufWritePost * call ModeChange()

function GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)

  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor

  " Append the number of windows in the tab page if more than one
  let wincount = tabpagewinnr(v:lnum, '$')
  if wincount > 1
    let label .= wincount
  endif
  if label != ''
    let label .= ' '
  endif

  " Append the buffer name
  return label . bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
endfunction

set guitablabel=%{GuiTabLabel()}
filetype plugin indent on
syntax on
"
"============================================================================
" NERDtree specifics
"============================================================================

" auto-starting bookmarking
let NERDTreeShowBookmarks = 1

" map NERDtree
nmap ,nt :NERDTree<CR>
nmap ,tn :tabe<CR>:NERDTree<CR>
