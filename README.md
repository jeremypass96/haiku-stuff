# haiku-stuff

A personal set of scripts and dotfiles that turn Haiku's terminal experience into a smooth, modern one — with custom themes, plugins, and optimized defaults for Zsh and Vim. Also includes better color and font values for a better looking GUI.

---

## 📦 What's Included?

| File:                           | Description: |
|---------------------------------|-------------|
| `zsh_setup_haiku.sh`            | Fully configures Zsh (Oh My Zsh, plugins, custom theme, Fastfetch setup). |
| `configure_zsh_syntax_colors.sh`| Prompts you to choose and apply a Catppuccin Zsh syntax theme. |
| `vim_setup.sh`                  | Installs Vim with Ayu Mirage colorscheme and Lightline plugin. |
| `vim_setup_catppuccino.sh`      | Same as above, but with the Catppuccin Mocha theme. |
| `Dotfiles/.zshrc`               | My personal Zsh config. |
| `Dotfiles/config/fastfetch/config.jsonc` | My Fastfetch config for Haiku. |
| `Dotfiles/config/AyuMirage`     | Ayu Mirage color scheme for the Haiku terminal. |
| `Haiku colors.txt`              | System appearance color values (manual import via Appearance prefs). |
| `Haiku fonts.txt`               | Font settings for Haiku (manual import via Appearance prefs). |

---

## 🚀 Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/jeremypass96/haiku-stuff.git
cd haiku-stuff
```

### 2. Run the Setup Script

```bash
./zsh_setup_haiku.sh
```

This will:
- Change your shell to Zsh (and install it if not already installed!)
- Install Oh My Zsh
- Install autosuggestions + syntax highlighting
- Apply the Catppuccin theme of your choice (it also gives you an option of "None" if you don't want the Catppuccin theme)
- Install and configure Fastfetch

### 3. Pick a Vim configuration (choose *one*!)

```bash
./vim_setup.sh                 # Ayu Mirage theme
./vim_setup_catppuccino.sh     # Catppuccin Mocha theme
```

---

## 🎨 Manual Steps (Appearance)

Haiku currently does not support scripting system font or color changes. You'll need to:

- Open **Appearance** preferences
- Apply colors from `Haiku colors.txt`
- Apply fonts from `Haiku fonts.txt`

---

## 📸 Screenshots

![screenshot1](https://github.com/user-attachments/assets/2ccb55c4-e79a-40fb-a5c0-b918100dd887)

![screenshot2](https://github.com/user-attachments/assets/b5daa57b-4007-4633-b877-2cdc7de897a4)

![screenshot3](https://github.com/user-attachments/assets/80b21dd4-03da-4907-92a8-402dd26b7137)

---

## 🧠 Why This Exists

Because Haiku OS is slick, but the out-of-box terminal setup is barebones. This repo brings it up to speed with expressive themes, plugins, and shell enhancements — all cleanly tailored for Haiku’s unique structure.
