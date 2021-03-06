"===========================================================================
"                 _
"			     (_)
"		       __   ___ _ __ ___  _ __ ___
"		       \ \ / / | '_ ` _ \| '__/ __|
"   			\ V /| | | | | | | | | (__
"		       (_)_/ |_|_| |_| |_|_|  \___|
"
"============================================================================

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" Don't forget the leader key by default is "\"

" plugins (like the vim-latex, surround, Orgmode, YCM, etc.)
execute pathogen#infect()

colorscheme torte " preferred colour scheme
filetype plugin on " load the plugins for specific file types
filetype indent on " automatically indent code
filetype plugin indent on
syntax on
let mapleader = "\\"
let maplocalleader = "\\"

" Set preferences
"------------------------------------------------------------------------------------------------

set number                " the numbers on the side
set backspace=indent,eol,start "make backspace work like in other text editors (don't like default)
set relativenumber        " the position of your cursor relative to other lines
set shellslash            " when typing directory in Unix, \ becomes /
set ignorecase            " when searching, case is ignored
set smartcase             " case sensitive if capital letter is present in the search pattern
set smartindent           " Will do indent in an appropriate manner when programming (mostly).
set incsearch             " incrementally search.
set sw=2                  " set scroll's width. Still don't know what it does
set autowrite             " auto write when going through files in a buffer (ex. :next)
set viminfo='1000         " history in your vim info files in your home directory
set textwidth=99          " Width of line before vim auto-warps. Set to half my screen size.
set encoding=utf-8        " encoding used for displaying file
set fileencoding=utf-8    " encoding used when saving file
set guifont=Consolas:h10  " Set GUI font size
set showmatch             " highlight matching braces
set spell spelllang=en_ca " set my spell checker automatically on opening
set wrap                  "Automatically make newline when text goes beyond textwidth.
set splitbelow splitright " default split to right
set laststatus=2          " Fixes Light line plugin glitch.
set wildmode =longest,list,full " auto-competition
set undofile              " Enable persistent undo so that undo history persists across vim session
set undodir=~/vimfiles/undo
set tabstop=4             " Set tab to 4 spaces.
set shiftwidth=4          " set shift (i.e. >) to 4 spaces

"plugin [Global Variable] preferences
let g:tex_flavor='latex'           " empty tex file default to 'tex' type instead of 'plaintex'
let g:netrw_banner = 1             " Netrw Disable Banner.
let g:calendar_google_calendar = 1 " sign into Google
let g:calendar_google_task = 1     " Sign into Google
let g:goyo_width = 100
let g:goyo_height = 120
let g:org_agenda_files=['C:/Users/Chiarandini/Documents/Agenda/agenda.org']


" Function keys map
"------------------------------------------------------------------------------------------------
noremap <F4> :setlocal spell! spelllang=en_ca <CR>
noremap <F10> :MundoToggle<cr>
noremap <F9> :NERDTreeToggle<CR>


" If you map <CR> in normal mode, it'll interfere with selection of history
" items in the command-line window and with jumping to error under cursor in
" quickfix/location list windows! Unless you add the following:
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" My commands.
"------------------------------------------------------------------------------------------------
" First, directories I use often with vim. When I get Command-T, will discard.
command! DOC cd C:/Users/Chiarandini/Documents
command! MYP cd C:/Users/Chiarandini/MyPrograms
command! U cd C:/Users/Chiarandini/Documents/University/2018-2019/2nd\ semester/
command! VIM cd C:\Program Files (x86)\Vim\vim80
command! Junk cd C:/Users/Chiarandini/Documents/Junk
command! Directories echo "DOC, MYP, U, VIM, JUNK"
command!Preview silent! exe ":!brave %<CR>"

" insert mode mappings
"------------------------------------------------------------------------------------------------
inoremap <C-BS> <Esc>"_dBxi
inoremap <S-BS> <Esc>"_dbxi
inoremap <C-A> <Esc>ggVG
inoremap <C-v> <Esc>"*pa
inoremap <C-Del> <C-o>dW
inoremap <S-Del> <C-o>dw
inoremap <C-p>  <nop>
inoremap <C-=> <C-r>=

" to make a quick list in Vim (till I adjust to org-mode)
inoremap <C-c> <esc>0vllyo<esc>p0<C-a>A

" IMAP functions. IMAP('origText', 'Substitution', 'filetype')
" call IMAP('TESTINGTESTING', 'itWorks', 'tex')



" normal mode mappings
"------------------------------------------------------------------------------------------------
"nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<CR>
" To quickly edit my .vimrc file (*e*dit my .*v*imrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr> <C-w>L
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <C-p> <C-l>
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-a> ggVG
nnoremap <C-Space> @q
nnoremap <leader>] ]sz=z1<Enter>
nnoremap <leader>[ [sz=z1<Enter>
nnoremap <F11> :!start .<Enter>
nnoremap <leader>go :Goyo<CR>
nnoremap <c-z> <c-x>
nnoremap <C-q> <C-a>
nnoremap <C-w>++ <C-w>100+
nnoremap <C-w>>> <C-w>100>
nnoremap <C-w><< <C-w>100<

" For More smooth navigation. Experimentally, H L are moving lines up and down. Originally 8[k/j]zz
nnoremap H ddkP
nnoremap J j<C-e>
nnoremap K k<C-y>
nnoremap L ddp
" nnoremap ZO :!start . <CR> ZZ

" for split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
"
" for tab navigation
nnoremap <C-f> gT
nnoremap <C-g> gt

" for creating a list
nnoremap <leader>C i1.<space>
" I've modified vim/bundle/Tabular/after/plugin/TabularMaps.vim with custom shortcuts for Latex
" cae cie (around enviroment), ca$ ci$ (around dollar sign)

nnoremap <silent> <leader>ss :syntax sync fromstart<cr>

" visual mode mappings
"------------------------------------------------------------------------------------------------
vnoremap Y "*y
vnoremap P "*p
vnoremap "" "*y
vnoremap "d "*d
vnoremap <C-Space> @q
vnoremap p pviwy
" select word and search for it
vnoremap <C-r> "ry:%s/<C-r>r//gc<left><left><left>
vnoremap <C-g> "ry/<C-r>r
vnoremap <C-f> "ry?<C-r>r
vnoremap K JVgq
vnoremap < <gv
vnoremap > >gv

" BUG BECAUSE OF HOW JUMP IS SETUP C-JUMP TAKES TOO MUCH PRIORITY. ALSO SCREWING WITH C-j FOR
" SCREEN NAVIGATION!!
vnoremap <C-j> <Esc>jzzV
vnoremap <C-k> <Esc>kzzV

" for surround.
vmap ( S(
vmap [ S[
vmap { S{


"I want to map this for visual mode only. Not visual block mode. I can't figure out how. It is also
"incomplete. It works for only one direction.
" vnoremap I '<0<C-v>'>0I



" Operator-Pending Mapping (custom movement mappings)
"------------------------------------------------------------------------------------------------
"in parenthesis ( cin( HERE )
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
"inside body
"onoremap b /return<cr>




"Common typo fixes
"------------------------------------------------------------------------------------------------
inoreabbrev ofr for
inoreabbrev tehn then
inoreabbrev taht that
inoreabbrev tat that
inoreabbrev teh the
inoreabbrev hte the
inoreabbrev waht what
inoreabbrev funciton function
inoreabbrev ahve have
inoreabbrev nad and



" Don't know where to put this yet. Delete trailing white space when saving.
augroup EraseWhiteSpace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END

" Note that autocmds may not have the "doubling command" problem if the 2nd attribute doesn't allow
" it. For example, FileType attributes will only load once when the right file type is detected.


"Tex files:
"------------------------------------------------------------------------------------------------
" autocmd FileType <.extension> map <this> <that>
augroup texAutoCmd
    autocmd!
    autocmd FileType tex :TTarget pdf

    "inoremaps for latex
    autocmd filetype tex inoremap <s-cr> <enter><enter>\item<space>
    autocmd filetype tex inoremap <s-Space> <Tab><BS><Space>
    autocmd filetype tex inoremap \[ \[<CR><CR>\]<++><esc>0dt\ka<Tab><Tab>
    autocmd filetype tex inoremap <C-cr> <enter><enter>\quad\newline<enter>
    autocmd filetype tex inoremap -> \rw
    autocmd filetype tex inoremap \bf \bf{}<++><Esc>F{a
    autocmd filetype tex inoremap -x> \xrightarrow{}<left><left><left><left><left>
    autocmd filetype tex inoremap --> \Rw<Space>
    autocmd filetype tex inoremap <-> \LRw<Space>
    autocmd filetype tex inoremap <-- \lw<Space>
"    autocmd filetype tex inoremap || \l| \r|<left><left><left><left>
    autocmd filetype tex inoreabbrev WLOG Without loss of generality
    autocmd filetype tex inoreabbrev WTS We want to show that
    autocmd filetype tex inoreabbrev WKT We know that
    autocmd filetype tex inoreabbrev st such that
    autocmd filetype tex inoreabbrev bc because
    autocmd filetype tex inoreabbrev sd standard deviation
    " autocmd filetype tex imap <leader>t \text{}

    " autocmd FileType tex IMAP('++','<Esc>xa \cdots + ', 'tex')

    "nnoremps
    autocmd FileType tex nnoremap <F12> :silent! exe '!%:r.pdf'<CR>

    "onoremap
    "autocmd FileType tex onoremap <silent> ie :<C-u>execute "normal! ?\\begin{<CR>j0v/\\end{<CR>k$"

    "vnoremps
    autocmd FileType tex vnoremap <leader>t di\text{}<Esc>hpl
    autocmd FileType tex vnoremap <leader>o di\o{}j<Esc>hpl
    autocmd FileType tex vnoremap <leader>$ di$$<Esc>hpl
    autocmd FileType tex vnoremap <leader>f di\frac{}{}<Esc>?frac<CR><C-j>
    autocmd FileType tex vnoremap <leader>b di\bf{}<Esc>hpl

    "Compiling
    autocmd FileType tex nnoremap <leader>kk :CompileTex<CR>
    autocmd FileType tex command! CompileErr cd C:/Users/Chiarandini/MyPrograms/ActiveScripts/latex/tmp/ | vs tmp.log
    autocmd FileType tex command! Template cd C:/Users/Chiarandini/MyPrograms/ActiveScripts/latex/ | vs template.tex
augroup END

" org-mode files
"------------------------------------------------------------------------------------------------
augroup orgAutoCmd
  autocmd!

  "nnoremaps
    autocmd FileType org nmap H m{
    autocmd FileType org nmap L m}

    autocmd FileType org nnoremap <leader>pdf :!pandoc expand('%:t') -o %:r.pdf<cr>
 augroup END

" java setup
augroup JavaAutoCmd
    autocmd!
    autocmd FileType java nnoremap <leader>jc :!javac %<CR>
    autocmd FileType java nnoremap <leader>jr :!java %:r<CR>
    " autocmd FileType java nnoremap <F5> :!javac %<CR>!java %:r<CR> not working don't know why
    autocmd FileType java nnoremap <F4> mqggVG='qzz
    autocmd FileType java inoremap <F4> <Esc>mqggVG='qzza
augroup END

" C setup
augroup CAutoCmd
    autocmd FileType c vnoremap <C-/> '<0<C-v>'>0I//<esc>
    autocmd FileType c nnoremap <C-/> '<0<C-v>'>0I//<esc>
augroup END




" Functions
"------------------------------------------------------------------------------------------------
" To increase and decrease the font size. Got the script from:
" https://vi.stckexchange.com/questions/3093/how-can-i-change-the-font-size-in-gvim#3094
if has("unix")
    function! FontSizePlus ()
      let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole + 1
      let l:new_font_size = ' '.l:gf_size_whole
      let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
    endfunction

    function! FontSizeMinus ()
      let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole - 1
      let l:new_font_size = ' '.l:gf_size_whole
      let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
    endfunction
else
    function! FontSizePlus ()
      let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole + 1
      let l:new_font_size = ':h'.l:gf_size_whole
      let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction

    function! FontSizeMinus ()
      let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole - 1
      let l:new_font_size = ':h'.l:gf_size_whole
      let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction
endif

if has("gui_running")
    nnoremap <F2> :call FontSizeMinus()<CR>
    nnoremap <F3> :call FontSizePlus()<CR>
endif
"Jump to last location in file before you closed it:
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif



" let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" Easy motion configuration
" Different word highlighting for searching.
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)

" If I decide to Auto-compile
" au BufWritePost *.tex silent call Tex_RunLaTeX()
" au BufWritePost *.tex silent !pkill -USR1 xdvi.bin

" For compiling tex documents.
function! CompileTex()
     exe 'w'
     let l:curDir = expand('%:p:h')
     let l:fileName = expand('%:t')
     let l:Name = expand('%:r')
     let l:compileDir = 'C:\Users\Chiarandini\MyPrograms\ActiveScripts\latex'

     " move appropriate files
      exe '!start cmd /c copy  ' fnameescape(l:fileName) . ' ' .  fnameescape(l:compileDir) . '\cur' . fnameescape(l:fileName)
      silent! exe '!start cmd /c echo ' . l:curDir . ' >'. l:compileDir .'\curDir.txt'
      silent! exe '!start cmd /c echo ' . l:fileName . ' >' . l:compileDir.'\fileName.txt'
      exe 'cd' fnameescape(l:compileDir)

     "compile and move the pdf
      silent! exe '!compile.bat'
      silent! exe '!start cmd /c mv ' . fnameescape(l:Name) . '.pdf "' . l:curDir . "\""
      silent! exe '!start cmd /c mv ' . l:Name . '.synctex.gz "' .l:curDir . "\""

     "clean directory
     "call delete(l:compileDir . '\' . l:Name . '.aux')
     "call delete(l:compileDir . '\' . l:Name . '.bcf')
     call delete(l:compileDir . '\' . 'cur' . l:Name . '.tex')
     call delete(l:compileDir . '\' .  l:Name . '.tex')
     exe 'cd' l:curDir
endfunction
command! -nargs=0 -bar CompileTex call CompileTex()"




" To move file an its corresponding buffer.
function! MoveFile(newspec)
     let old = expand('%')
     " could be improved:
     if (old == a:newspec)
         return 0
     endif
     exe 'sav' fnameescape(a:newspec)
     call delete(old)
endfunction
command! -nargs=1 -complete=file -bar MoveFile call MoveFile('<args>')"

"Now you could say:
"     :MoveFile file2.txt
"
"To rename to file2.txt
"    :MoveFile junk/%
"to move file2.txt to junk/file2.txt




"Lets me put Shell outputs in a buffer.
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)




"automacitally align "tables" when a pipe character ( '|' ) is present
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a



let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" EXPLORE FURTHER! to number every line!
" :%s/^\=line('.')."\t"/g
