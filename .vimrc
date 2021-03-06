scriptencoding utf-8

call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'maximbaz/lightline-ale'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-rooter'
Plug 'pearofducks/ansible-vim'
Plug 'liuchengxu/vista.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'ayu-theme/ayu-vim'
call plug#end()

" colors
syntax on
if !has('nvim')
    set ttytype=xterm-256color
endif
if (has('termguicolors'))
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
set t_Co=256
let ayucolor='mirage'
colorscheme ayu
set background=dark
let g:rehash256=1

set fileencodings=utf-8,latin1  " auto detection of file encoding
"set esckeys                     " when this option is off, the cursor and function keys cannot be used in Insert mode if they start with an <Esc>
set visualbell                  " flash screen, no beeping
set t_vb=                       " no flash
set noerrorbells                " don't ring bell for error messages
set nojoinspaces                " insert only one space after sentences when joining lines
set whichwrap=<,>,h,l,b         " allow specified keys that move the cursor left/right to move to the previous/next line
set ruler                       " show the cursor position all the time
set autowrite                   " automatically :write before running commands
set showcmd                     " display incomplete commands
set noshowmode                  " plugin lightline already does this
set nostartofline               " don't goto start of line with some commands
set nowrap                      " don't wrap long lines
set textwidth=0                 " no max line width
set wildmenu                    " enhanced command-line completion
set formatoptions=cqrt          " format options: c = auto-wrap comments, q = allow formatting comments with gq, r = auto-insert comment leader, t = auto-wrap text
set shortmess=atToO             " no shortening of messages
set shortmess+=c                " don't give ins-completion-menu messages.
set comments=b:#,:%,fb:-,n:>,n:),sl:/**,mb:\ *,elx:\ */
set completeopt=longest,menuone " popup menu doesn't select the first completion item, but inserts the longest common text of all matches; menu will come up even if there's only one match
set hidden                      " if hidden is not set, TextEdit might fail.
set nobackup                    " Some LSP servers have issues with backup files, see #649
set nowritebackup               " Some LSP servers have issues with backup files, see #649
"set cmdheight=2                 " Better display for messages
set updatetime=300              " You will have bad experience for diagnostic messages when it's default 4000.
set signcolumn=yes              " always show signcolumns

if !has('nvim')
    set viminfo=%,'50,\"100,:100,n~/.viminfo
endif

" make backspace behave as in most other programs
set backspace=indent,eol,start

" line numbers
set relativenumber
set number
set numberwidth=4
set cursorline

" searching
set hlsearch
set incsearch
set ignorecase

" folding
set foldmethod=indent
set foldnestmax=3
set nofoldenable
set foldlevel=1
nnoremap <tab> za

" show white space?
set list
set listchars=tab:».,trail:.

" tabs
set expandtab                   " use the appropriate number of spaces to insert a tab (Ctrl-V<tab> inserts real tab)
set smarttab                    " smart tab and backspace
set shiftround                  " round indent to multiple of 'shiftwidth'
set tabstop=4
set shiftwidth=4

autocmd Filetype c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

let mapleader=','

set ttimeoutlen=50
set history=100

" mouse support
set mouse=a
if !has('nvim')
    if has('mouse_sgr')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    end
endif

" undo
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo
let vimDir = '$HOME/.vim'       " Put plugins and dictionaries in this dir (also on Windows)
let &runtimepath.=','.vimDir
if has('persistent_undo')       " create undo dir if it does not exist
    let myUndoDir = expand(vimDir . '/undo')
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile                    " Save undos after file closes
    set undodir=$HOME/.vim/undo     " where to save undo histories
endif

" shortcuts for switching between buffers
nmap <C-b> :bp<cr>
nmap <C-n> :bn<cr>

map <F11> :make<CR>
cmap w!! w !sudo tee % >/dev/null  " w!! let's you sudo after file was opened!

" jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif

" make yank/paste use the global system clipboard
set clipboard=unnamed

" make 'd' only delete (not yank), and 'leader d' cut (idea from https://github.com/pazams/d-is-for-delete)
nnoremap X "_X
nnoremap x "_x
xnoremap x "_x
nnoremap D "_D
nnoremap d "_d
xnoremap d "_d
nnoremap C "_C
nnoremap c "_c
xnoremap c "_c
xnoremap p "0p
xnoremap P "0P
nnoremap <BS> "_X
nnoremap <Del> "_x
nnoremap <leader>d "*d
xnoremap <leader>d "*d
nnoremap <leader>D "*D
xnoremap <leader>D "*D

" Indent and keep selection
vmap < <gv
vmap > >gv


"""""""""""""""""""""""""""""""
" lightline
"""""""""""""""""""""""""""""""

let g:lightline = {}
let g:lightline.colorscheme = 'powerline'
let g:lightline.enable = { 'statusline': 1, 'tabline': 1 }

set showtabline=2
let g:lightline.tabline = {'left': [['buffers']], 'right': [[]]}
let g:lightline#bufferline#show_number = 0
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#enable_devicons = 1

let g:lightline.component = {
     \ 'lineinfo': '%3l/%L : %-2v',
     \ 'filename': '%F',
     \}
let g:lightline.component_expand = {
    \ 'buffers': 'lightline#bufferline#buffers',
    \ 'linter_checking': 'lightline#ale#checking',
    \ 'linter_infos': 'lightline#ale#infos',
    \ 'linter_warnings': 'lightline#ale#warnings',
    \ 'linter_errors': 'lightline#ale#errors',
    \ 'linter_ok': 'lightline#ale#ok',
    \}
let g:lightline.component_function = {
    \ 'readonly': 'LightlineReadonly',
    \ 'fugitive': 'LightlineFugitive',
    \}
let g:lightline.component_type = {
    \ 'buffers': 'tabsel',
    \ 'linter_checking': 'middle',
    \ 'linter_infos': 'right',
    \ 'linter_warnings': 'warning',
    \ 'linter_errors': 'error',
    \ 'linter_ok': 'right',
    \}

let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
    \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos' , 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \}

" use powerline/nerdfont symbols
"let g:lightline.separator = { 'left': '', 'right': '' }
"let g:lightline.subseparator = { 'left': '', 'right': '' }
function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
    if exists('*FugitiveHead')
        let branch = FugitiveHead()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0


"""""""""""""""""""""""""""""""
" Fugitive
"""""""""""""""""""""""""""""""
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>


"""""""""""""""""""""""""""""""
" fzf
"""""""""""""""""""""""""""""""

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
"let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
"let $FZF_DEFAULT_OPTS="--preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null'"
"let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :FZF -m<CR>

" Map a few common things to do with FZF.
nnoremap <silent> <Leader>r :Rg<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>
nnoremap <silent> <Leader>c :Commits<CR>
nnoremap <silent> <Leader>o :Colors<CR>

" Ignore filename for ripgrep
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
"imap <c-x><c-f> <plug>(fzf-complete-path)
"imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using Vim function
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }
"let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Hide statusline
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


"""""""""""""""""""""""""""""""
" ale
"""""""""""""""""""""""""""""""

" Keep gutter open
let g:ale_sign_column_always = 1

" Use quickfix list instead of loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Fixers and linters
let g:ale_linters_explicit = 1
let g:ale_linters = { 'vim': ['vint'], 'html': ['htmlhint'], 'javascript': ['tsserver']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'javascript': ['prettier'], 'css': ['prettier'], 'html': ['html-beautify']}

let g:ale_warn_about_trailing_whitespace = 1
   
" Symbols and colors
highlight ALEErrorSign guifg=red
highlight ALEWarningSign guifg=yellow
let g:ale_sign_error = '⛔'
let g:ale_sign_warning = '🔔'
let g:lightline#ale#indicator_checking = ''
let g:lightline#ale#indicator_warnings = '🔔'
let g:lightline#ale#indicator_errors = '⛔'
let g:lightline#ale#indicator_ok = ''

nmap <Leader>p :ALEFix<CR>

" Toggle quick list
nnoremap <F4> :call QFixToggle()<CR>
function! QFixToggle()
  if exists('g:qfix_win')
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr('$')
  endif
endfunction


"""""""""""""""""""""""""""""""
" coc
"""""""""""""""""""""""""""""""

let g:coc_global_extensions = ['coc-json','coc-tsserver','coc-html','coc-css','coc-yaml']

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Fix autofix problem of current line
"nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 CocFormat :call CocAction('format')
nmap <Leader>f :CocFormat<CR>

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


"""""""""""""""""""""""""""""""
" emmet
"""""""""""""""""""""""""""""""

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-y>'


"""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""

map <F2> :NERDTreeToggle<CR>

let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 50

" Make sure no files or other buffers are opened in NT buffer
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

" Close vim if only NT window left
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Shortcut for closing text buffer and switching to next file buffer
nnoremap <leader>q :bp<cr>:bd #<cr>

let g:NERDTreeIndicatorMapCustom = {
                \ 'Modified'  : '',
                \ 'Staged'    : '',
                \ 'Untracked' : '',
                \ 'Renamed'   : '',
                \ 'Unmerged'  : '',
                \ 'Deleted'   : '',
                \ 'Dirty'     : '',
                \ 'Clean'     : '',
                \ 'Unknown'   : ''
                \ }

"""""""""""""""""""""""""""""""
" Vista
"""""""""""""""""""""""""""""""

map <F3> :Vista!!<CR>

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious. e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ['╰─▸ ', '├─▸ ']

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'coc'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   'function': '\uf794',
\   'variable': '\uf71b',
\  }
