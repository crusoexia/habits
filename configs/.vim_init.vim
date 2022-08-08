set nocompatible		" be iMproved
filetype off			  " required

" Setup plugins
call plug#begin('~/.config/nvim/plugged')

" basic
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'crusoexia/gtk2-vim-zoom'
Plug 'wesQ3/vim-windowswap'
Plug 'tpope/vim-eunuch'
Plug 'godlygeek/tabular'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'christoomey/vim-tmux-navigator'

" Search
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" VCS integration
Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'
"Plug 'vim-scripts/vcscommand.vim'

" Markdown
Plug 'kannokanno/previm'

" coding
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'jwhitley/vim-matchit'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-scripts/vim-cursorword'
Plug 'vim-test/vim-test'
Plug 'puremourning/vimspector'

" html, javascript and css
Plug 'mattn/emmet-vim'                            " zen coding
Plug 'elzr/vim-json'                              " json syntax high light
Plug 'JulesWang/css.vim'                          " css syntax
Plug 'groenewege/vim-less'                        " less syntax high light
Plug 'mustache/vim-mustache-handlebars'           " html template library high light
Plug 'wavded/vim-stylus'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'othree/html5.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" nodejs
Plug 'moll/vim-node'

" typescript
"Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
"Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }

" syntax highlight
Plug 'jxnblk/vim-mdx-js'
Plug 'neoclide/jsonc.vim'
Plug 'pangloss/vim-javascript'                    " javascript syntax and indent
Plug 'crusoexia/vim-javascript-lib'               " javascript library highlight

" theme
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'jnurmine/Zenburn'
Plug 'tomasr/molokai'
Plug 'crusoexia/vim-dream'
Plug 'crusoexia/vim-monokai'
Plug 'crusoexia/vim-dracula'
Plug 'sjl/badwolf'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

" Browser nvim extension support
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()

filetype plugin on
filetype plugin indent on

" config plugins
set laststatus=2
let NERDTreeShowHidden=1
let g:javascript_enable_domhtmlcss = 1              " vim-javascript highlight 
let g:javascript_plugin_jsdoc = 1
let g:previm_open_cmd = 'open -a Safari'
let g:vim_jsx_pretty_colorful_config = 1
let g:neosnippet#enable_completed_snippet = 1
let g:startify_session_persistence = 1
let g:markdown_fenced_languages = [
  \'html', 
  \'python', 
  \'bash=sh', 
  \'javascript', 
  \'json', 
  \'java'
\]
let g:markdown_syntax_conceal = 0
let g:notes_directories = ['~/Documents/notes']

" coc.vim extensions
let g:coc_global_extensions = [
  \'coc-stylelintplus', 
  \'coc-html', 
  \'coc-highlight', 
  \'coc-eslint', 
  \'coc-yaml', 
  \'coc-tsserver', 
  \'coc-svg', 
  \'coc-json', 
  \'coc-css'
\]

" Font, color and theme
syntax on

if has("gui_running")
  set guioptions-=T	" disable tools bar
  if has("gui_macvim")
    set guifont=Meslo\ LG\ M:h16
  elseif has("win32") || has("win16")
    set guifont=Consolas:h11
  else
    set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 12
  endif
elseif $TERM =~ '^\(xterm-256color\)\?$'
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  set termguicolors
else
  set t_Co=256
endif

colorscheme monokai
let &colorcolumn=join(range(121,121),",")

" Text editor
"if has("gui_macvim") || has("win32") || has("win16") " make clipboard the default copy/paste buffer
	"set clipboard=unnamed
"else 
	"set clipboard=unnamedplus	
"endif

" Backup files strategy
set nobackup
set nowritebackup
set noswapfile

set nu					  " show line number
set hidden				" can leave buffer without saving it
set expandtab			" replace tab to spaces
set tabstop=2			" a tab is four spaces
set shiftwidth=2		" number of spaces to use for autoindenting
set softtabstop=2       " affects what happens when you press the <TAB> or <BS> keys
set backspace=indent,eol,start
						" allow backspacing over everything in insert mode
set autoindent			" always set autoindenting on
set copyindent 			" copy the previous indentation on autoindenting
set shiftround			" use multiple of shiftwidth when indenting with '<' and '
set smarttab			" insert tabs on the start of a line according to shiftwidth, not tabstop
set showmatch			" set show matching parenthesis
set smartcase			" ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch			" highlight search terms
set incsearch			" show search matches as you type
set history=1000		" remember more commands and search history
set undolevels=1000		" use many muchos levels of undo
set title				" change the terminal's title
set pastetoggle=<F5>	" toggle paste mode
set cursorline			" highlight current line
set guioptions-=r       " hide right hand scrollbar
set guioptions-=R       " hide right hand scrollbar when split window
set guioptions-=l       " hide left hand scrollbar
set guioptions-=L       " hide left hand scrollbar when split window
set guioptions-=b       " hide bottom scrollbar
set completeopt-=preview

" recommoned by coc.vim
set cmdheight=2   " better display for messages
set updatetime=300
set shortmess+=c  " don't give |ins-completion-menu| messages.
set signcolumn=yes " always show signcolumns
" To enable highlight current symbol on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Folding
set foldmethod=indent
set foldlevel=1
set nofoldenable

" Statusline

:set statusline=%f         " Path to the file
:set statusline+=%=         " Switch to the right side
:set statusline+=[
:set statusline+=%1*%M%*%n%R%Y
:set statusline+=,%{&fileencoding?&fileencoding:&encoding}
:set statusline+=]\ 
:set statusline+=%-19(%3l/%L,\ %02c%)

" Key maps
let mapleader=" "

" window size
noremap <silent> <Leader>= :res+5<CR>
noremap <silent> <Leader>- :res-5<CR>
noremap <silent> <F3> :vertical:res+5<CR>
noremap <silent> <F4> :vertical:res-5<CR>
noremap <silent> <C-UP> :LargerFont<CR>
noremap <silent> <C-DOWN> :SmallerFont<CR>

" window nav
tnoremap <m-h> <C-\><C-N><C-w>h
tnoremap <m-j> <C-\><C-N><C-w>j
tnoremap <m-k> <C-\><C-N><C-w>k
tnoremap <m-l> <C-\><C-N><C-w>l
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

" buffer operation
nnoremap <silent> <Leader>bd :bd *<C-a><CR>
nnoremap <silent> <Leader>x :bp<CR>:bd!#<CR>
nnoremap <silent> <Tab> :b#<CR>
nnoremap <silent> ˙ :bp<CR>
nnoremap <silent> ¬ :bn<CR>

" terminal
nnoremap <silent> <Leader>t :tabnew<CR>:term<CR>i
nnoremap <silent> <Leader>vt :vnew<CR>:b#<CR><C-w>l:term<CR>i
nnoremap <silent> <Leader>ht :new<CR>:b#<CR><C-w>j:term<CR>i

" terminal mode mapping
tnoremap <Esc><Esc> <C-\><C-n>


" fold operation
"nnoremap <Leader>mv :mkview<CR>
"nnoremap <Leader>lv :loadview<CR>

" nerdtree
noremap <F2> :NERDTreeToggle<CR>
noremap <Leader><F2> :NERDTreeFind<CR>

" search
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>/ :Rg<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" format
nnoremap <silent> <Leader>fx :%!xmllint --format --recover - 2>/dev/null<CR>:set syn=xml<CR>
noremap <F7> mzgg=G`z<CR>
noremap <F8> :CocCommand eslint.executeAutofix<CR>

" edit boost
"inoremap <silent> <C-j> <C-x><C-o>
inoremap <C-u> <esc>viWUA
inoremap <C-l> <esc>viWuA
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

" vimspector
nnoremap <Leader>ds :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

" coc.nvim

" Completion
inoremap <silent><expr> <C-j> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" scroll float window
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Lint nav
nmap <silent> ∆ <Plug>(coc-diagnostic-next)
nmap <silent> ˚ <Plug>(coc-diagnostic-prev)

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
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" end coc.nvim

" File type syntax mapping
au BufRead,BufNewFile *.vue set filetype=html
au BufRead,BufNewFile *.json set filetype=jsonc
