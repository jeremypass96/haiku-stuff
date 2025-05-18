#!/bin/bash

# Define color codes
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m' # No color

echo -e "${CYAN}Starting Zsh installation and configuration...${NC}"

# Change shell to zsh and install Zsh
echo -e "${BLUE}Changing default shell to zsh...${NC}"
sed -i s/'bash/zsh'/g /boot/system/settings/etc/passwd
echo -e "${GREEN}Shell changed successfully.${NC}"

echo -e "${BLUE}Installing Zsh...${NC}"
pkgman install -y zsh
echo -e "${GREEN}Zsh installed successfully.${NC}"

# Install Oh My Zsh
echo -e "${BLUE}Installing Oh My Zsh...${NC}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo -e "${GREEN}Oh My Zsh installed successfully.${NC}"

# Clone and set up zsh-autosuggestions and zsh-syntax-highlighting plugins
echo -e "${BLUE}Cloning zsh-autosuggestions plugin...${NC}"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo -e "${GREEN}zsh-autosuggestions plugin cloned successfully.${NC}"

echo -e "${BLUE}Cloning zsh-syntax-highlighting plugin...${NC}"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo -e "${GREEN}zsh-syntax-highlighting plugin cloned successfully.${NC}"

# Copy .zshrc configuration
echo -e "${BLUE}Copying .zshrc configuration...${NC}"
cp -v ~/haiku-stuff/Dotfiles/.zshrc ~/.zshrc
echo -e "${GREEN}.zshrc configuration copied successfully.${NC}"

# Copy custom Oh My Zsh theme
echo -e "${BLUE}Copying custom Oh My Zsh theme...${NC}"
cp -v ~/haiku-stuff/jpassarelli.zsh-theme ~/.oh-my-zsh/custom/themes/jpassarelli.zsh-theme
echo -e "${GREEN}Custom theme copied successfully.${NC}"

# Setup Catppuccino colors
echo -e "${BLUE}Setting up Catppuccino colors...${NC}"
./configure_zsh_syntax_colors.sh
echo -e "${GREEN}Catppuccino colors configured successfully.${NC}"

# Add 'fastfetch' to .zshrc and install it if not installed
echo -e "${BLUE}Adding 'fastfetch' to .zshrc...${NC}"
echo "fastfetch" >> ~/.zshrc

echo -e "${BLUE}Installing Fastfetch...${NC}"
pkgman install -y fastfetch
echo -e "${GREEN}Fastfetch installed successfully.${NC}"

echo -e "${BLUE}Copying Fastfetch config file..."
mkdir ~/config/settings/fastfetch
cp -v ~/haiku-stuff/Dotfiles/config/settings/fastfetch/config.jsonc ~/config/settings/fastfetch/config.jsonc

echo -e "${BLUE}Copying terminal theme config file..."
mkdir -p ~/config/settings/Terminal/Themes
cp -v ~/haiku-stuff/Dotfiles/config/settings/Terminal/Themes/AyuMirage ~/config/settings/Terminal/Themes/AyuMirage

echo -e "${MAGENTA}Zsh has been successfully configured.${NC}"
