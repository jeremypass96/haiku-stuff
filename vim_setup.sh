#!/bin/bash
# This script sets up Vim with the "sorbet" colorscheme and the Lightline plugin.

# Install Vim.
pkgman install -y vim

# Configure the vimrc file.
touch $HOME/config/settings/vim/vimrc
vimrc_path=$HOME/config/settings/vim/vimrc
cat << EOF >> $vimrc_path
set number
set cursorline
set smoothscroll
set termguicolors

call plug#begin('~/config/settings/vim/plugged')
Plug 'itchyny/lightline.vim'
call plug#end()

let g:lightline = {'colorscheme': 'one'}
colorscheme sorbet
set laststatus=2
set noshowmode
EOF

# Get vim-plug and install the Lightline plugin.
mkdir -p ~/config/settings/vim/autoload
curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o ~/config/settings/vim/autoload/plug.vim
vim -es -u $vimrc_path -i NONE -c "PlugInstall" -c "qa"
