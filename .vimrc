set nocompatible
set backspace=start,eol,indent
set whichwrap=b,s,[,],<,>,~
set mouse=
syntax on
set nohlsearch " 検索キーワードをハイライトしないように設定

" シンタックスハイライト有効化 (背景黒向け。白はコメントアウト
highlight Normal ctermbg=black ctermfg=grey
"highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
"highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray
"highlight Normal ctermbg=grey ctermfg=black
"highlight StatusLine term=none cterm=none ctermfg=grey ctermbg=black
"highlight CursorLine term=none cterm=none ctermfg=darkgray ctermbg=none

"set cursorline " カーソルラインの強調表示を有効化
set laststatus=2
set statusline=%F%r,%l,%c,%p%=
set number
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=1
set incsearch
set ignorecase
set wildmenu wildmode=list:full

nmap <silent> <Tab> 4<Right>
vmap <silent> <Tab> <C-o>4<Right>
nmap <silent> <S-Tab> 4<Left>
vmap <silent> <S-Tab> <C-o>4<Left>
nmap <silent> <C-n>      :update<CR>:bn<CR>
imap <silent> <C-n> <ESC>:update<CR>:bn<CR>
vmap <silent> <C-n> <ESC>:update<CR>:bn<CR>
cmap <silent> <C-n> <ESC>:update<CR>:bn<CR>

imap <C-b> <ESC>:read ~/.vim/bf<CR>i
nmap <C-b> :read ~/.vim/bf<CR>
vmap <C-b> :w!~/.vim/bf<CR>

filetype on
filetype indent on
filetype plugin on
au BufReadPost,BufNewFile *.t :setl filetype=perl
au BufReadPost,BufNewFile *.pp :setl filetype=ruby

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" neobundle.vimの初期化
call neobundle#rc(expand('~/.vim/bundle'))

" neobundle.vimを更新するための設定
"NeoBundleFetch 'Shougo/neobundle.vim'

"filetype plugin indent on
	 
" 改行後に自動的にコメントを挿入を停止
autocmd FileType * setlocal formatoptions-=ro

" 使いたいプラグインのリポジトリを羅列。Subversion とか Mercurial でもいけるらしい。
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/vimshell.vim'
NeoBundle 'git://github.com/Shougo/vimproc.vim'
"NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
"NeoBundle 'git://github.com/Shougo/unite.vim.git'
"NeoBundle 'git://github.com/mattn/zencoding-vim.git'
"NeoBundle 'git://github.com/thinca/vim-quickrun.git'
"NeoBundle 'thinca/vim-ref'
"NeoBundle 'vim-jp/vimdoc-ja'
"NeoBundle 'vim-ruby/vim-ruby'
"NeoBundle 'perl-support.vim'

"""""""""""""""""""""
"" neocomplcache
"""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" " Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'perl' : $HOME.'/.vim/bundle/perl-support.vim/perl-support/wordlists/perl.list',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()







