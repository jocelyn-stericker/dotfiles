set termguicolors
set background=light
colorscheme gruvbox

""" very magical find/replace """
set inccommand=split
nnoremap / /\v
vnoremap / /\v

""" autocompletion """
imap <C-s> <Plug>(copilot-suggest)
let g:copilot_enabled = "v:false"
set completeopt=menu,menuone,popup

""" long lived undo/redo """
set undofile

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

"o"" fzf mappings/config """
let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 1.0 } }
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
 
let $FZF_DEFAULT_COMMAND='rg --files'
nnoremap <silent> <leader>t :<C-u>Files<cr>
nnoremap <silent> <leader>T :<C-u>GFiles<cr>
nnoremap <silent> <leader>p :<C-u>GFiles?<cr>
nnoremap <silent> <leader>L :<C-u>Rg<cr>

let g:fzf_history_dir = '~/.local/share/fzf-history'

""" search """
set grepprg=rg\ --vimgrep\ --no-heading\ --engine\ auto
set grepformat=%f:%l:%c:%m,%f:%l:%m

""" formatting """
let g:neoformat_try_node_exe = 1
autocmd BufWritePre *.js Neoformat prettierd
autocmd BufWritePre *.ts Neoformat prettierd
autocmd BufWritePre *.jsx Neoformat prettierd
autocmd BufWritePre *.tsx Neoformat prettierd
autocmd BufWritePre *.css Neoformat prettierd
autocmd BufWritePre *.rs Neoformat

""" fold """
lua vim.wo.foldmethod = 'expr'
lua vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
nnoremap gp :silent %!prettier --stdin-filepath %<CR>
