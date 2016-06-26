" vim-plug
if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/vim-plug',
        \ {'dir': '~/.vim/plugged/vim-plug/autoload'}
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tpope/vim-fugitive'
  Plug 'Shougo/unite.vim'
  Plug 'Shougo/unite-outline'
  Plug 'junegunn/vim-easy-align'
  Plug 'scrooloose/syntastic'
call plug#end()

" タブスペース周りの設定
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0

" 基本設定
syntax on
set autoindent
set showmode
set showmatch 
set ignorecase
set wrapscan
set laststatus=2
set encoding=utf-8
set fileencodings=utf-8
set fileencodings+=iso-2022-jp,euc-jp,cp932
set fileformats=unix
set wildmode=list:longest
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%{fugitive#statusline()}
set ambiwidth=double

" syntasticの設定
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 3
let g:syntastic_javascript_checkers=['eslint']

set statusline+=%=%l,%c%V%8P

command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

" NERDTree
autocmd VimEnter * NERDTree
autocmd VimEnter * if argc() | wincmd p | endif

" fugitiveの設定
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ,df  <C-r>=strftime('%Y-%m-%d %H:%M:%S')<Return>

nnoremap j gj
nnoremap k gk
nnoremap <c-w><c-t> :NERDTree<cr>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-f> gt<cr>
nnoremap <c-b> gT<cr>
nnoremap <c-e> $
nnoremap <c-a> 0

" unite-outline
let g:unite_split_rule = 'botright'
noremap <silent> <Space>o <ESC>:Unite -vertical -winwidth=40 -no-quit outline<Return>

vnoremap v $h
vnoremap <Enter> <Plug>(EasyAlign)

" expand path
 cmap <c-x> <c-r>=expand('%:p:h')<cr>/
" expand file (not ext)
 cmap <c-z> <c-r>=expand('%:p:r')<cr>

setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType sql set omnifunc=sqlcomplete#CompleteSQL

function InsertTabWrapper()
    if pumvisible()
        return "\<c-n>"
    endif
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k\|<\|/'
       return "\<tab>"
    elseif exists('&omnifunc') && &omnifunc == ''
       return "\<c-n>"
    else
       return "\<c-x>\<c-o>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif
