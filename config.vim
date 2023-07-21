colorscheme fairyfloss

set cursorline
hi MarchParen ctermfg=208 ctermbg=233 cterm=bold
set termguicolors
set mouse=a

"""" camelcasemotion """"

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

"""" Blame toggle ctrl+k """"
function! s:BlameToggle() abort
  let found = 0
  for winnr in range(1, winnr('$'))
    if getbufvar(winbufnr(winnr), '&filetype') ==# 'fugitiveblame'
      exe winnr . 'close'
      let found = 1
    endif
  endfor
  if !found
    Git blame
  endif
endfunction

map <C-k> :call <SID>BlameToggle()<CR>

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

set updatetime=100

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <c-p> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Mappings using FZF:
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
 
let $FZF_DEFAULT_COMMAND='rg --files'
nnoremap <silent> <leader>t :<C-u>Files<cr>
nnoremap <silent> <leader>T :<C-u>GFiles<cr>
nnoremap <silent> <leader>p :<C-u>GFiles?<cr>
nnoremap <silent> <leader>L :<C-u>Rg<cr>

let loaded_netrwPlugin = 1

set inccommand=split
nnoremap / /\v
vnoremap / /\v
let g:fzf_history_dir = '~/.local/share/fzf-history'
set grepprg=rg\ --vimgrep\ --no-heading\ --engine\ auto
set grepformat=%f:%l:%c:%m,%f:%l:%m
set undofile

imap ^[[1~ <Home>
imap ^[[4~ <End>

let g:copilot_node_command = "/opt/homebrew/opt/node@16/bin/node"
nnoremap <leader>v :execute 'silent !idea --line '.line('.').' '.expand('%:p')\|redraw!<cr>
