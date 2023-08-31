#!/bin/bash

# Setup Catppuccino colors (Haiku only).
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting && cp -v ~/zsh-syntax-highlighting/themes/*.zsh /system/settings/zsh/

read -p "Which Catppuccino colors do you want for syntax highlighting?
1.) Latte
2.) Frappé
3.) Macchiato
4.) Mocha
-> " resp

if [ "$resp" = 1 ]; then
    echo "source /system/settings/zsh/catppuccin_latte-zsh-syntax-highlighting.zsh" >> /boot/home/.zshrc
elif [ "$resp" = 2 ]; then
    echo "source /system/settings/zsh/catppuccin_frappe-zsh-syntax-highlighting.zsh" >> /boot/home/.zshrc
elif [ "$resp" = 3 ]; then
    echo "source /system/settings/zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh" >> /boot/home/.zshrc
elif [ "$resp" = 4 ]; then
    echo "source /system/settings/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh" >> /boot/home/.zshrc
else
    echo "Invalid choice."
fi

rm -rf ~/zsh-syntax-highlighting
