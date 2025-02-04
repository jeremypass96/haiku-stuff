#!/bin/bash

# Define color codes
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m' # No color

echo -e "${BLUE}Setting up Vim with the 'Ayu Mirage' colorscheme and Lightline plugin...${NC}"

# Install Vim
echo -e "${BLUE}Installing Vim...${NC}"
pkgman install -y vim
echo -e "${GREEN}Vim installed successfully.${NC}"

# Configure the vimrc file
echo -e "${BLUE}Configuring vimrc file...${NC}"
mkdir -p "$HOME"/config/settings/vim/
touch "$HOME"/config/settings/vim/vimrc
vimrc_path="$HOME"/config/settings/vim/vimrc
cat << EOF >> "$vimrc_path"
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
Plug 'ayu-theme/ayu-vim'
Plug 'jiangmiao/auto-pairs'
call plug#end()

let g:lightline = {'colorscheme': 'ayu_mirage'}
let g:one_allow_italics = 1
let ayucolor="mirage"
colorscheme ayu
set laststatus=2
set noshowmode
set backspace=indent,eol,start
EOF
echo -e "${GREEN}vimrc configured successfully.${NC}"

# Get vim-plug and install the Lightline plugin
echo -e "${BLUE}Setting up vim-plug and installing Lightline plugin...${NC}"
mkdir -p ~/config/settings/vim/autoload
curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o ~/config/settings/vim/autoload/plug.vim
vim -es -u "$vimrc_path" -i NONE -c "PlugInstall" -c "qa"
echo -e "${GREEN}Lightline plugin installed successfully.${NC}"

echo -e "${MAGENTA}Vim setup completed with the 'Ayu Mirage' colorscheme and Lightline plugin.${NC}"
