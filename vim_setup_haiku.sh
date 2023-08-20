#!/bin/bash
# This script will setup Vim with the Catppuccin Mocha colorscheme, along with the Lightline plugin.

# In this section, we will configure the vimrc file.
echo "set number" >> /boot/home/config/settings/vim/vimrc
echo "set cursorline" >> /boot/home/config/settings/vim/vimrc
echo "set smoothscroll" >> /boot/home/config/settings/vim/vimrc
echo "set termguicolors" >> /boot/home/config/settings/vim/vimrc
echo "" >> /boot/home/config/settings/vim/vimrc
echo "call plug#begin('~/config/settings/vim/plugged')" >> /boot/home/config/settings/vim/vimrc
echo "Plug 'itchyny/lightline.vim'" >> /boot/home/config/settings/vim/vimrc
echo "Plug 'catppuccin/vim', { 'as': 'catppuccin' }" >> /boot/home/config/settings/vim/vimrc
echo "call plug#end()" >> /boot/home/config/settings/vim/vimrc
echo "" >> /boot/home/config/settings/vim/vimrc
echo "let g:lightline = {'colorscheme': 'catppuccin_mocha'}" >> /boot/home/config/settings/vim/vimrc
echo "colorscheme catppuccin_mocha" >> /boot/home/config/settings/vim/vimrc
echo "set laststatus=2" >> /boot/home/config/settings/vim/vimrc
echo "set noshowmode" >> /boot/home/config/settings/vim/vimrc

# Get vim-plug.
mkdir -p ~/config/settings/vim/autoload ; curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o ~/config/settings/vim/autoload/plug.vim

# Install Catppuccin colors plugin.
vim -es -u ~/config/settings/vim/vimrc -i NONE -c "PlugInstall" -c "qa"
