#!/bin/bash

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m' # No color

echo -e "${CYAN}Setting up Vim with the Catppuccino Mocha colorscheme and Lightline plugin...${NC}"

# Install Vim
echo -e "${YELLOW}Installing Vim...${NC}"
pkgman install -y vim
echo -e "${GREEN}Vim installed successfully.${NC}"

# Configure the vimrc file
echo -e "${YELLOW}Configuring vimrc file...${NC}"
touch $HOME/config/settings/vim/vimrc
vimrc_path=$HOME/config/settings/vim/vimrc
cat << EOF >> $vimrc_path
set number
set cursorline
set linebreak
set incsearch
set hlsearch
set spell
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
echo -e "${GREEN}vimrc configured successfully.${NC}"

# Get vim-plug and install the Lightline plugin
echo -e "${YELLOW}Setting up vim-plug and installing Lightline plugin...${NC}"
mkdir -p ~/config/settings/vim/autoload
curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o ~/config/settings/vim/autoload/plug.vim
vim -es -u $vimrc_path -i NONE -c "PlugInstall" -c "qa"
echo -e "${GREEN}Lightline plugin installed successfully.${NC}"

echo -e "${CYAN}Vim setup completed with Catppuccino Mocha colorscheme and Lightline plugin.${NC}"
