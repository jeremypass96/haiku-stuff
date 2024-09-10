#!/bin/bash

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m' # No color

echo -e "${CYAN}Starting Zsh installation and configuration...${NC}"

# Change shell to zsh and install Zsh
echo -e "${YELLOW}Changing default shell to zsh...${NC}"
sed -i s/'bash/zsh'/g /boot/system/settings/etc/passwd
echo -e "${GREEN}Shell changed successfully.${NC}"

echo -e "${YELLOW}Installing Zsh...${NC}"
pkgman install -y zsh
echo -e "${GREEN}Zsh installed successfully.${NC}"

# Install Oh My Zsh
echo -e "${YELLOW}Installing Oh My Zsh...${NC}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo -e "${GREEN}Oh My Zsh installed successfully.${NC}"

# Clone and set up zsh-autosuggestions and zsh-syntax-highlighting plugins
echo -e "${YELLOW}Cloning zsh-autosuggestions plugin...${NC}"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo -e "${GREEN}zsh-autosuggestions plugin cloned successfully.${NC}"

echo -e "${YELLOW}Cloning zsh-syntax-highlighting plugin...${NC}"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo -e "${GREEN}zsh-syntax-highlighting plugin cloned successfully.${NC}"

# Copy .zshrc configuration
echo -e "${YELLOW}Copying .zshrc configuration...${NC}"
cp -v ~/haiku-stuff/Dotfiles/.zshrc ~/.zshrc
echo -e "${GREEN}.zshrc configuration copied successfully.${NC}"

# Setup Catppuccino colors
echo -e "${YELLOW}Setting up Catppuccino colors...${NC}"
./configure_zsh_syntax_colors.sh
echo -e "${GREEN}Catppuccino colors configured successfully.${NC}"

# Add 'pfetch' to .zshrc and install it if not installed
echo -e "${YELLOW}Adding 'pfetch' to .zshrc...${NC}"
echo "pfetch" >> ~/.zshrc

echo -e "${YELLOW}Installing pfetch...${NC}"
pkgman install -y pfetch
echo -e "${GREEN}Pfetch installed successfully.${NC}"

echo -e "${CYAN}Zsh has been successfully configured.${NC}"
