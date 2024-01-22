" place in the first line
set nocompatible
syntax on
set number
" set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set showcmd
set hlsearch
set list
set listchars=tab:>-,trail:-
set encoding=UTF-8
set foldenable
set foldmethod=syntax
"https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
set foldlevel=99
set nowrap
"https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
set backspace=indent,eol,start
"https://superuser.com/questions/249779/how-to-setup-a-line-length-marker-in-vim-gvim
"set colorcolumn=120
"highlight ColorColumn ctermbg=grey


let mapleader = ","
"---move cursor---
noremap <C-j> 4j
noremap <C-k> 4k
noremap <C-d> 20j
noremap <C-u> 20k

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-d> <Delete>


"---windows---
nnoremap sc <C-w>c
nnoremap so <C-w>o
nnoremap sh <C-w>h
nnoremap sl <C-w>l
nnoremap sj <C-w>j
nnoremap sk <C-w>k


"---tabs---
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>
"close other tabs
nnoremap to :tabonly<CR>
"gt
nnoremap th :tabnext<CR>
"gT
nnoremap tl :tabprev<CR>


"---gvim---
autocmd GUIEnter * simalt ~x
set guifont=Consolas:h13


"---plugins---
" The default plugin directory will be as follows: Vim (Linux/macOS): '~/.vim/plugged'
call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/a.vim'
Plug 'preservim/nerdcommenter'
Plug 'devin0x01/fzf' , { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF'
Plug 'voldikss/vim-floaterm'
Plug 'zivyangll/git-blame.vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch'
Plug 'obcat/vim-hitspop'
Plug 'tjdevries/overlength.vim'
"Plug 'kien/ctrlp.vim'
"Plug 'zuo000/winmanager--Fox'
"Plug 'wfxr/minimap.vim'
"Plug 'vhda/verilog_systemverilog.vim'
call plug#end()


"---nerdtree---
"nnoremap <leader>e :NERDTreeFocus<CR>
nnoremap <C-e> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
" nnoremap <C-n> :NERDTree<CR>


"---tagbar---
"This plugin can help to show the function at cursor position in lightline-vim.
" noremap <F8> :TagbarToggle<CR>


"---taglist---
"nnoremap <leader>b :TlistOpen <CR>
let Tlist_GainFocus_On_ToggleOpen = 1
nnoremap <C-b> :TlistToggle<CR>
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 40


"---a.vim---
noremap <leader>o  :A<CR>


"---nerdcommenter---
noremap <C-_> <plug>NERDCommenterToggle
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation (not work)
" let g:NERDDefaultAlign = 'left'


"---fzf.vim---
"noremap <leader>p :Files<CR>
"noremap <leader>b :Buffers<CR>
"noremap <leader>t :Tags<CR>
"noremap <leader>p :BTags<CR>


"---Leaderf---
"https://retzzz.github.io/dc9af5aa
let g:Lf_WildIgnore={ 'file':['*.lib', '*.a', '*.o', '*.d', '*.so', ], 'dir':['.git']}
let g:Lf_WindowPosition = 'popup'
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_PreviewPopupWidth = 500
let g:Lf_ShortcutF = "<leader>ff"
":bd can delete a buffer.
"let g:Lf_ShortcutB = "<leader>fb"
noremap <leader>f :LeaderfSelf<CR>
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
"LeaderfTag depends on ctags
noremap <leader>fT :<C-U><C-R>=printf("Leaderf tag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

"https://zhuanlan.zhihu.com/p/36279445
"g:Lf_GtagsAutoGenerate, default value is 0.
"    If the value is 1 and there is a rootmark defined by g:Lf_RootMarkers under the project root directory,
"    gtags files will be generated automatically the first time when starting to edit a new buffer, after reading the file into the buffer.
"    Otherwise, gtags files should be generated manually by using Leaderf gtags --update.
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <unique> <leader>fgu :Leaderf gtags --update
noremap <unique> <leader>fgd <Plug>LeaderfGtagsDefinition
noremap <unique> <leader>fgr <Plug>LeaderfGtagsReference
noremap <unique> <leader>fgs <Plug>LeaderfGtagsSymbol
noremap <unique> <leader>fgg <Plug>LeaderfGtagsGrep

noremap <leader>fgo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fgn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fgp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
"rg选项:
"-i 忽略大小写.
"-e <PATTERN> 正则表达式搜索.
"-F 搜索字符串而不是正则表达式.
"-w 搜索只匹配有边界的词.
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
"noremap <C-G> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>

noremap <unique> <leader>fr   <Plug>LeaderfRgPrompt
noremap <unique> <leader>fre  :<C-U><C-R>=printf("Leaderf! rg -e %s -t cpp -g !*test* -g !experiment", expand("<cword>"))<CR>

nnoremap <unique> <leader>fra <Plug>LeaderfRgCwordLiteralNoBoundary
nnoremap <unique> <leader>frb <Plug>LeaderfRgCwordLiteralBoundary
nnoremap <unique> <leader>frc <Plug>LeaderfRgCwordRegexNoBoundary
nnoremap <unique> <leader>frd <Plug>LeaderfRgCwordRegexBoundary

vnoremap <unique> <leader>fra <Plug>LeaderfRgVisualLiteralNoBoundary
vnoremap <unique> <leader>frb <Plug>LeaderfRgVisualLiteralBoundary
vnoremap <unique> <leader>frc <Plug>LeaderfRgVisualRegexNoBoundary
vnoremap <unique> <leader>frd <Plug>LeaderfRgVisualRegexBoundary


"---floaterm---
"default is 'float'(popup)
"let g:floaterm_title = 'floaterm($1|$2)'
"let g:floaterm_wintype = 'split'
"let g:floaterm_height = 0.3
"let g:floaterm_width = 1
"let g:floaterm_position = 'bottom'
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_keymap_toggle = '<leader>t'


"---git-blame---
noremap <Leader>gb :<C-u>call gitblame#echo()<CR>


"---gitgutter---
"diff markers should appear automatically after a short delay (default is 4000ms)
"Note updatetime also controls the delay before vim writes its swap file (see :help updatetime).
set updatetime=100
let g:gitgutter_set_sign_backgrounds = 0
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '**'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_removed_above_and_below = '{'
let g:gitgutter_sign_modified_removed = 'ww'
"turn on/off with :GitGutterEnable/:GitGutterDisable
noremap <unique> <leader>gg :GitGutterToggle<CR>
"hunks
noremap <unique> <leader>gv <Plug>(GitGutterPreviewHunk)
noremap <unique> <leader>gn <Plug>(GitGutterNextHunk)
noremap <unique> <leader>gp <Plug>(GitGutterPrevHunk)
"equivalent to :!git add %
noremap <unique> <leader>ga <Plug>(GitGutterStageHunk)
noremap <unique> <leader>gu <Plug>(GitGutterUndoHunk)
"folding
noremap <unique> <leader>gf :GitGutterFold<CR>
set foldtext=gitgutter#fold#foldtext()
"vimdiff
noremap <unique> <leader>gd :GitGutterDiffOrig<CR>
"let g:gitgutter_diff_relative_to = ''
"let g:gitgutter_diff_base = ''
"statusline (not work)
"function! GitStatus()
"  let [a,m,r] = GitGutterGetHunkSummary()
"  return printf('+%d ~%d -%d', a, m, r)
"endfunction
"set statusline+=%{GitStatus()}


"---lightline---
" refer to https://github.com/itchyny/lightline.vim#introduction
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
set noshowmode
" https://stackoverflow.com/questions/33699049/display-current-function-in-vim-status-line
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch1', 'readonly', 'filename', 'modified' ],
      \             [ 'tagbar' ] ]
      \ },
      \ 'component': {
      \         'tagbar': '%{tagbar#currenttag("%s", "", "f")}',
      \ },
      \ 'component_function': {
      \   'gitbranch1': 'gitbranch#name',
      \   'gitbranch2': 'FugitiveHead'
      \ },
      \ }


"---hitspop---
let g:hitspop_line   = 'winbot'
let g:hitspop_column = 'winright'
"let g:hitspop_timeout = 200
noremap <leader>T :<C-U><C-R>=printf("let g:hitspop_timeout=200")<CR>


"---overlength---
let overlength#default_to_textwidth = 0
let overlength#default_overlength = 1000
" To disable highlighting in multiple fts at once
call overlength#disable_filetypes(['markdown', 'term', 'vim'])
" length==0 means disable
call overlength#set_overlength('cpp', 120)


"---ctrlp---
"let g:ctrlp_map = '<leader>p'
"let g:ctrlp_cmd = 'CtrlP'
"noremap <leader>f :CtrlPMRU<CR>
"let g:ctrlp_custom_ignore = {
"    \ 'dir':  '\v[\/]\.(git|svn)$',
"    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
"    \ }


"---winmanager---
"let g:winManagerWindowLayout='FileExplorer|TagList'
"let g:winManagerWindowLayout='NERDTree|TagList'
"noremap wm :WMToggle<CR>


"---minimap.vim---
"let g:minimap_width = 10
"let g:minimap_auto_start = 1
"let g:minimap_auto_start_win_enter = 1
"let g:minimap_block_filetypes = ['fugitive', 'nerdtree', 'tagbar', 'fzf' ]
"let g:minimap_block_buftypes = ['nofile', 'nowrite', 'quickfix', 'terminal', 'prompt']
""let g:minimap_close_filetypes = ['fugitive', 'nerdtree', 'tagbar', 'fzf' ]
""let g:minimap_close_buftypes = ['nofile', 'nowrite', 'quickfix', 'terminal', 'prompt']
"let g:minimap_highlight_range = 1
"let g:minimap_highlight_search = 1
"let g:minimap_git_colors = 1
""autocmd ColorScheme *
"        "\ highlight minimapCursor            ctermbg=59  ctermfg=228 guibg=#5F5F5F guifg=#FFFF87 |
"        "\ highlight minimapRange             ctermbg=242 ctermfg=228 guibg=#4F4F4F guifg=#FFFF87
"
"noremap <unique> <leader>mt :MinimapToggle<CR>
""Force refresh minimap window
"noremap <unique> <leader>mr :MinimapRefresh<CR>
""Force recalculation of minimap scaling ratio
"noremap <unique> <leader>ms :MinimapRescan<CR>

