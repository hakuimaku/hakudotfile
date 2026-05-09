### 🎨 Haku Dotfiles

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/4640efd9-ec98-46bf-a5d1-19381020a1f3" />



== YEAH!! It has been released :D
Welcome to Haku Space! A minimal and clean dotfile configuration for Arch Linux with Hyprland.

Include: Waybar, Rofi, Kitty, Zsh, Zen Browser, Networkmanager, Nemo, ...
Use ly for login

> **⚠️ Important Notice:** This dotfile is in active development and currently supports **Hyprland 0.54.3 (0.54.x)**. Configuration may break with future Hyprland updates due to changes in windowrules and other settings.

## 📋 Prerequisites

- **Arch Linux** installed and configured
- **Hyprland** (0.54.x) already installed before using this dotfile
- Basic knowledge of shell configuration and file permissions

> **Recommendation:** Manually copy configurations rather than using the automated installer. Review `pkg.txt` to select which packages to install.

## 🚀 Installation

### Step 1: Clone the Repository
```bash
cd ~
git clone https://github.com/hakuimaku/hakudotfile.git
```

### Step 2: Navigate to Directory
```bash
cd hakudotfile
```

### Step 3: Run Installer
> ⚠️ **Review the script carefully before running**
```bash
./install.sh
```

### Step 4: Reboot
```bash
reboot
```

## 🛠️ Configuration Guide

### Hyprland Configuration
- Base configurations are in `hyprland.conf`
- Keybindings are separated in `keybinding.conf` for easy customization

### Icons & Themes
- **Icons:** Located at `~/.icons`
- **Themes:** Located at `~/.themes`
- Change both via GTK Settings application

### Scripts & Executables
- User scripts are stored in `~/.local/bin`
- **Important:** Grant execution permissions if scripts don't work:
  ```bash
  chmod +x ~/.local/bin/*
  ```

### Fastfetch Logo
- Logo files are stored in `~/Documents`
- Update the filename in `~/.config/fastfetch/config.json` to match
- Or modify the config path to point to your preferred location

### Useful Tips
- SUPER + TAB/ or press module clock on waybar/ or type "quick_settings" in kitty to open Haku Menu :p
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/54aa6a29-f6db-4efe-b52e-d75bca75ebef" />




- in terminal type:
  ```bash
  haku
  ```
for open haku space in workspace 1 :)
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/ffb50375-163a-49e1-a278-f8e9f36f42dc" />

  ```bash
  haku clear
  ```
for close them :(


- SUPER + Y for change wallpaper
- SUPER SHIFT + Y for change lively wallpaper (Video)
- Wallpaper (store in ~/Pictures/Wallpapers)
- Lively wallpaper (store in ~/Videos/Wallpapers)
  
- In Haku Space (which open by SUPER + TAB). You can change app to open by Setting at the end
- Edit `hyprland.conf` for window rules and general settings
- Modify `keybinding.conf` for keyboard shortcuts
- Use GTK Settings to apply themes and icons visually
- Ensure all scripts in `~/.local/bin` have execution permissions

# In Haku Menu
Some module I didn't remove because I'm too lazy:( so pls you manually read in ~/.local/bin/quick_settings or choose Setting in Haku Menu to remove them

## 🐛 Troubleshooting

If configurations don't work:
1. Check Hyprland version compatibility (should be 0.54.x)
2. Verify file permissions with `ls -la ~/.local/bin`
3. Check config file paths are correctly set
4. Review individual config files for syntax errors
5. If module clock on waybar doesn't work. Make sure you have set Timezone, Locale for Arch linux

## 📦 Contributing

This is a personal dotfile configuration. Feel free to fork and adapt it to your needs!

---

**Happy Ricing! 🎨**
