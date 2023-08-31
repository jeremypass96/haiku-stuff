#!/bin/bash
# Change shell to zsh and install Zsh.
sed -i s/'bash/zsh'/g /boot/system/settings/etc/passwd
pkgman install zsh

# Install Oh My Zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Clone and set up zsh-autosuggestions and zsh-syntax-highlighting plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Copy .zshrc configuration.
cp -v ~/haiku-stuff/Dotfiles/.zshrc ~/.zshrc

# Setup Catppuccino colors.
./configure_zsh_syntax_colors.sh

# Add 'pfetch' to .zshrc. Also will install it if not installed.
echo "pfetch" >> ~/.zshrc
pkgman install pfetch

echo "Zsh has been successfully configured."
