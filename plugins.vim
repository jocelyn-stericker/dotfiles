if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  source $MYVIMRC
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim-plug')

" Theme
Plug 'morhetz/gruvbox'

" Sanity
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'
Plug 'bkad/camelcasemotion'
Plug 'moll/vim-bbye'

" Search
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" VCS
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'mhinz/vim-signify'

" Language support
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'sbdchd/neoformat'
 
Plug 'github/copilot.vim'
call plug#end()

if !empty($DOTFILES_SETUP)
  runtime update.vim
else
  runtime config.vim
endif
