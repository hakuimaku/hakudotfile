# 🎨 Haku Dotfiles

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/4640efd9-ec98-46bf-a5d1-19381020a1f3" />



== YEAH!! It has been released :D.

*WELCOME TO HAKU SPACE! A minimal and clean dotfile configuration for Arch Linux with Hyprland.

Include: Waybar, Rofi, Kitty, Zsh, Zen Browser, Networkmanager, Nemo, ...
Use ly for login

> **⚠️ Important Notice:** This dotfile is in active development and currently supports **Hyprland 0.54.3 (0.54.x)**. Configuration may break with future Hyprland updates due to changes in windowrules and other settings.
> Recommend Monitor eDP-1, 1920p and 720p (because in hyprland.conf, Haku Space I use). You can change it manually.

## 📋 Prerequisites

- **Arch Linux** installed and configured
- **Hyprland** (0.54.x) already installed before using this dotfile
- Basic knowledge of shell configuration and file permissions

## **Strongly Recommendation:** Manually copy configurations rather than using the automated installer. Review `pkg.txt` to select which packages to install.
## If it is your first time install arch, just use install.sh script to quick setup

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

### Waybar
- To enable module Clock, go to waybar config file and change your timezone, locale.gen
- Use scroll mouse to change volume/brightness value
- On Brightness module, left-click to enable hyprsunset and right-click to disable it
- On Volume module, left-click to Mute, right-click to open pavucontrol

### Useful Tips
- SUPER + TAB or press module clock on waybar or type "quick_settings" in kitty to open Haku Menu :p
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/54aa6a29-f6db-4efe-b52e-d75bca75ebef" />




- in terminal type:
  ```bash
  haku
  ```
to open haku space in workspace 1 :)
<img width="1920" height="1080" alt="20260511_113021" src="https://github.com/user-attachments/assets/fb412e1d-44f3-4af0-8139-c0f6638bcb2a" />


  ```bash
  haku clear
  ```
to close them :(


- in terminal type:
  ```bash
  hakunet
  ```
to open haku space - hakunet in workspace 1 :)
<img width="1920" height="1080" alt="20260511_113038" src="https://github.com/user-attachments/assets/3009759a-e57a-4b1f-bdd3-5f1014686541" />


  ```bash
  hakunet clear
  ```
to close them :(
or use HakuMenu to close it :D


- SUPER + Y to change wallpaper
- SUPER SHIFT + Y to change lively wallpaper (Video)
- Wallpaper (store in ~/Pictures/Wallpapers)
- Lively wallpaper (store in ~/Videos/Wallpapers)
  
- In Haku Space (which open by SUPER + TAB). You can change rofi "app to open" by Setting at the end of list
- Edit `hyprland.conf` for window rules and general settings
- Modify `keybinding.conf` for keyboard shortcuts
- Use GTK Settings to apply themes and icons visually
- Ensure all scripts in `~/.local/bin` have execution permissions

- In Haku Menu choose Cava Underbar for this :) (cava under waybar ofc)
- Cava under waybar will automatically close when focus fullscreen (maximize)
<img width="456" height="140" alt="20260511_113043" src="https://github.com/user-attachments/assets/6890a3f8-0929-4c24-a057-f97dc2377896" />



### In Haku Menu
Some module I didn't remove because I'm too lazy:( so pls you manually read in ~/.local/bin/quick_settings or choose Setting in Haku Menu to remove them

## 🐛 Troubleshooting

If configurations don't work:
1. Check Hyprland version compatibility (should be 0.54.x)
2. Verify file permissions with `ls -la ~/.local/bin`
3. Check config file paths are correctly set
4. Review individual config files for syntax errors
5. If module clock on waybar doesn't work. Make sure you have set Timezone, Locale for Arch linux
6. Lively Wallpaper by SUPER SHIFT + Y didnt show or didnt have thumbnail?
   > Create folder Preview (~/Videos/Wallpapers/Preview) and add image .jpg/.png (same name with video) to appear thumbnail in rofi select menu

# 📦 Contributing

- This is a personal dotfile configuration. Feel free to fork and adapt it to your needs!
- tiktok: @hakuimaku2372

---

**Happy Ricing! 🎨**
