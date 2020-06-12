call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
" Plug 'othree/html5.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'nelstrom/vim-visual-star-search'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'tikhomirov/vim-glsl'
Plug 'jesseleite/vim-agriculture'
Plug 'liuchengxu/vim-which-key'
Plug 'christoomey/vim-conflicted'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'whiteinge/diffconflicts'
" color themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rakr/vim-one'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'tomasiser/vim-code-dark'
Plug 'kaicataldo/material.vim'
Plug 'lifepillar/vim-solarized8'
" Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim'
Plug 'AlessandroYorba/Arcadia'
Plug 'sainnhe/sonokai'
Plug 'phanviet/vim-monokai-pro'
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/space-vim-dark'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'justinmk/vim-sneak'
Plug 'relastle/bluewery.vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

call plug#end()
if exists('g:vscode')
        " VSCode extension
else
        "     " ordinary neovim
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" Theme
syntax enable
set background=dark
" colorscheme solarized8
" let g:arcadia_Sunset = 1
" colorscheme arcadia
" colorscheme codedark
" let g:material_theme_style = 'palenight'
" colorscheme arcadia
colorscheme solarized8
" colorscheme space-vim-dark
" colorscheme vim-monokai-tasty 
" hi LineNr ctermbg=NONE guibg=NONE
" hi Comment guifg=#5C6370 ctermfg=59
" hi SignColumn ctermbg=NONE guibg=NONE
" hi Normal     ctermbg=NONE guibg=NONE
let g:lightline = { 
            \ 'colorscheme': 'solarized',
            \ 'active': {
            \   'left': [ ['mode', 'paste'],
            \           ['gitbranch', 'readonly', 'filename', 'modified']]
            \ },
            \ 'components_function': {
            \   'gitbranch': 'FugitiveHead'
            \ },
            \ }
" let g:lightline = { 'colorscheme': 'monokai' }

" Nerd tree and file search settings
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
" nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" Fzf
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" TextEdit might fail if hidden is not set.
set hidden
 
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
 
" Give more space for displaying messages.
set cmdheight=2
 
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
 
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
 
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
 
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
 
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
 
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
 
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
 
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
 
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
 
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
 
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
 
" Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)
nmap <F2> <Plug>(coc-rename)
 
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
 
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
 
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
 
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
 
" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
 
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
 
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
 
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
 
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
 
" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" My settings
"
" let g:gitgutter_enabled = 0
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set inccommand=nosplit
" set number
" set relativenumber
" inoremap jj <Esc>
" inoremap jk <esc>
" inoremap kj <esc>
let mapleader = "\<Space>"
" map <Leader> <Plug>(easymotion-prefix)
" call fzf#vim#grep(expand('<cword>'))
noremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
noremap <silent> <Leader>rg :Rg <C-R><C-W><CR>
nmap ,n :NERDTreeFind<CR>
" nnoremap <C-l> <C-i>
nmap <silent> <Leader>; :Buffers<CR>
nnoremap <silent> <Leader>ze :Goyo<CR>
highlight clear SignColumn

" terminal
" :tnoremap <Esc> <C-\><C-n>
" :tnoremap <A-h> <C-\><C-N><C-w>h
" :tnoremap <A-j> <C-\><C-N><C-w>j
" :tnoremap <A-k> <C-\><C-N><C-w>k
" :tnoremap <A-l> <C-\><C-N><C-w>l
" :inoremap <A-h> <C-\><C-N><C-w>h
" :inoremap <A-j> <C-\><C-N><C-w>j
" :inoremap <A-k> <C-\><C-N><C-w>k
" :inoremap <A-l> <C-\><C-N><C-w>l
" :nnoremap <A-h> <C-w>h
" :nnoremap <A-j> <C-w>j
" :nnoremap <A-k> <C-w>k
" :nnoremap <A-l> <C-w>l

nmap <Leader>/ <Plug>RgRawSearch
vmap <Leader>/ <Plug>RgRawVisualSelection
nmap <Leader>* <Plug>RgRawWordUnderCursor
let g:goyo_width = 140
autocmd VimEnter,VimLeave * silent !tmux set status off
let g:coc_filetype_map = { 'htmldjango' : 'html' }

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +5<CR>
noremap <silent> <C-Right> :vertical resize -5<CR>
noremap <silent> <C-Up> :resize +5<CR>
noremap <silent> <C-Down> :resize -5<CR>

" which-key
" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" set timeoutlen=500
"
" command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" let g:sneak#label = 1

" press <esc> to cancel.
" nmap f <Plug>(coc-smartf-forward)
" nmap F <Plug>(coc-smartf-backward)
" nmap ; <Plug>(coc-smartf-repeat)
" nmap , <Plug>(coc-smartf-repeat-opposite)

augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end

" toggle color highlights
lua require'colorizer'.setup()

" highlight group under cursor
" map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
"             \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
"             \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"" delete buffers
" function! s:list_buffers()
"   redir => list
"   silent ls
"   redir END
"   return split(list, "\n")
" endfunction
"
" function! s:delete_buffers(lines)
"   execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
" endfunction
"
" command! BD call fzf#run(fzf#wrap({
"   \ 'source': s:list_buffers(),
"   \ 'sink*': { lines -> s:delete_buffers(lines) },
"   \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
" \ }))
endif
