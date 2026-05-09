# 🎨 Haku Dotfiles

Welcome to Haku Space! A minimal and clean dotfile configuration for Arch Linux with Hyprland.

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

## 📝 Customization Tips

- Edit `hyprland.conf` for window rules and general settings
- Modify `keybinding.conf` for keyboard shortcuts
- Use GTK Settings to apply themes and icons visually
- Ensure all scripts in `~/.local/bin` have execution permissions

## 🐛 Troubleshooting

If configurations don't work:
1. Check Hyprland version compatibility (should be 0.54.x)
2. Verify file permissions with `ls -la ~/.local/bin`
3. Check config file paths are correctly set
4. Review individual config files for syntax errors

## 📦 Contributing

This is a personal dotfile configuration. Feel free to fork and adapt it to your needs!

---

**Happy Ricing! 🎨**
