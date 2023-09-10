#!/bin/bash
# This script sets up Vim with the Catppuccino Mocha colorscheme and the Lightline plugin.

# Install Vim.
pkgman install -y vim

# Configure the vimrc file.
vimrc_path="$HOME/config/settings/vim/vimrc"
cat << EOF >> "$vimrc_path"
set number
set cursorline
set smoothscroll
set termguicolors

call plug#begin('~/config/settings/vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
call plug#end()

let g:lightline = {'colorscheme': 'catppuccin_mocha'}
colorscheme catppuccin_mocha
set laststatus=2
set noshowmode
EOF

# Get vim-plug and install Catppuccin colors plugin.
mkdir -p ~/config/settings/vim/autoload
curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o ~/config/settings/vim/autoload/plug.vim
vim -es -u "$vimrc_path" -i NONE -c "PlugInstall" -c "qa"
