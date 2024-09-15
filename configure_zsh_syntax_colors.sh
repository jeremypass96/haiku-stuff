#!/bin/bash

# Define color codes
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m' # No color

echo -e "${CYAN}Setting up Catppuccino colors (Haiku only)...${NC}"

# Clone and copy Catppuccino themes
echo -e "${YELLOW}Cloning zsh-syntax-highlighting repository...${NC}"
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting
echo -e "${GREEN}Repository cloned successfully.${NC}"

echo -e "${YELLOW}Copying themes to /system/settings/zsh/...${NC}"
cp -v ~/zsh-syntax-highlighting/themes/*.zsh /system/settings/zsh/
echo -e "${GREEN}Themes copied successfully.${NC}"

# Prompt user for color choice
echo -e "${CYAN}Which Catppuccino colors do you want for syntax highlighting?${NC}"
echo -e "${MAGENTA}1.) Latte${NC}"
echo -e "${MAGENTA}2.) Frappé${NC}"
echo -e "${MAGENTA}3.) Macchiato${NC}"
echo -e "${MAGENTA}4.) Mocha${NC}"
echo -e "${RED}0.) None${NC}"
echo -e "${YELLOW}-> ${NC}"

read -r resp

# Handle user response
case "$resp" in
    1)
        echo -e "${YELLOW}Adding Latte color scheme to .zshrc...${NC}"
        echo "source /system/settings/zsh/catppuccin_latte-zsh-syntax-highlighting.zsh" >> /boot/home/.zshrc
        ;;
    2)
        echo -e "${YELLOW}Adding Frappé color scheme to .zshrc...${NC}"
        echo "source /system/settings/zsh/catppuccin_frappe-zsh-syntax-highlighting.zsh" >> /boot/home/.zshrc
        ;;
    3)
        echo -e "${YELLOW}Adding Macchiato color scheme to .zshrc...${NC}"
        echo "source /system/settings/zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh" >> /boot/home/.zshrc
        ;;
    4)
        echo -e "${YELLOW}Adding Mocha color scheme to .zshrc...${NC}"
        echo "source /system/settings/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh" >> /boot/home/.zshrc
        ;;
    0)
        echo -e "${RED}Removing all zsh syntax highlighting files...${NC}"
        rm -rf /system/settings/zsh/*.zsh
        echo -e "${GREEN}Files removed.${NC}"
        ;;
    *)
        echo -e "${RED}Invalid choice.${NC}"
        ;;
esac

# Clean up
echo -e "${YELLOW}Removing cloned repository...${NC}"
rm -rf ~/zsh-syntax-highlighting
echo -e "${GREEN}Repository removed.${NC}"
