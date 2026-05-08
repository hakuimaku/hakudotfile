#!/bin/bash

# Check package dependencies
DEPENDENCIES=("yay" "jq" "git" "curl")
PKG_FILE="$HOME/hakudotfile/pkg.txt"

echo "--- 1. Check package dependencies ---"

for pkg in "${DEPENDENCIES[@]}"; do
    if command -v "$pkg" &> /dev/null; then
        echo "✅ [OK] $pkg DONE!"
    else
        echo "❌ [ERROR] $pkg DOES NOT EXIST!"
        
        read -p "Do you want to install $pkg now? (y/n): " confirm
        if [[ $confirm == [yY] ]]; then
            sudo pacman -S --noconfirm "$pkg"
        else
            echo "You need to install $pkg."
            exit 1
        fi
    fi
done

echo "--- Everything is ready to install Config! ---"


# Install packages from pkg.txt
echo "--- 2. Ready to install packages from pkg.txt ---"

if [[ ! -f "$PKG_FILE" ]]; then
    echo "❌ [ERROR] Not found file $PKG_FILE"
    exit 1
fi

echo "📦 Ready to install packages..."
read -p "Do you want to install packages from pkg.txt now? (y/n): " confirm
if [[ $confirm == [yY] ]]; then
    yay -S --needed --noconfirm - < "$PKG_FILE"
    if [ $? -eq 0 ]; then
        echo "✅ Installation completed successfully!"
    else
        echo "⚠️ An error occurred during installation."
        exit 1
    fi
else
    echo "Skipping package installation."
fi





echo "--- 3. Ready to initialize system directories ---"

# List of directories to create
FOLDERS=(
    "$HOME/Documents"
    "$HOME/.local/bin"
    "$HOME/.config"
)

for folder in "${FOLDERS[@]}"; do
    if [ ! -d "$folder" ]; then
        mkdir -p "$folder"
        echo "📁 Created directory: $folder"
    else
        echo "✅ Directory already exists: $folder"
    fi
done



# Define source and destination paths for config files
SOURCE_CONFIG="$HOME/hakudotfile/config"
DEST_CONFIG="$HOME/.config"

echo "--- Ready to deploy config to ~/.config ---"

# Copy config files from source to destination
read -p "Do you want to backup and copy your current config now? (y/n): " confirm
if [[ $confirm == [yY] ]]; then
    if [ -d "$SOURCE_CONFIG" ]; then
        
        # Make backup if destination config already exists
        if [ -d "$DEST_CONFIG" ]; then
            TIMESTAMP=$(date +%Y%m%d_%H%M%S)
            echo "📂 Ready to create backup for current config..."
            mv "$DEST_CONFIG" "${DEST_CONFIG}_backup_$TIMESTAMP"
            mkdir -p "$DEST_CONFIG"
        fi

        # Proceed with copying config files
        cp -rf "$SOURCE_CONFIG"/. "$DEST_CONFIG/"
        
        echo "✅ Copy (config files) completed to $DEST_CONFIG"
    else
        echo "❌ [ERROR] Not found directory $SOURCE_CONFIG"
        exit 1
    fi
else
    echo "Skipping config backup."
fi


# Define source and destination paths for local bin files
SOURCE_BIN="$HOME/hakudotfile/bin"
DEST_BIN="$HOME/.local/bin"

echo "--- 4. Ready to deploy bin files to ~/.local/bin ---"

read -p "Do you want to backup and copy your current local bin now? (y/n): " confirm
if [[ $confirm == [yY] ]]; then
    # Copy bin files from source to destination
    if [ -d "$SOURCE_BIN" ]; then
        cp -rf "$SOURCE_BIN"/. "$DEST_BIN/"
        echo "✅ Copy (bin files) completed to $DEST_BIN"
        chmod +x "$DEST_BIN"/* 2>/dev/null
    else
        echo "❌ [ERROR] Not found directory $SOURCE_BIN"
        exit 1
    fi
else
    echo "Skipping local bin backup."
fi


echo "--- 5. Setup Oh My Zsh and Plugins ---"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "✅ Oh My Zsh already installed."
fi

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom/plugins"

# zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/zsh-autosuggestions"
fi

# zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/zsh-syntax-highlighting"
fi

# Update .zshrc to include plugins
if [ -f "$HOME/.zshrc" ]; then
    sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' "$HOME/.zshrc"
    echo "✅ Updated .zshrc to include plugins"
fi

# Change default shell to Zsh (Need to enter sudo password)
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo "Changing default shell to Zsh..."
    chsh -s $(which zsh)
fi



# Define source and destination paths for other files
DEST_OTHER="$HOME"
SOURCE_ROOT="$HOME/hakudotfile"

echo "--- 6. Ready to deploy other files to home directory ---"

read -p "Do you want to backup and copy your other files now? (y/n): " confirm
if [[ $confirm == [yY] ]]; then
    FILES_TO_COPY=(".nanorc" ".zshrc")

    for file in "${FILES_TO_COPY[@]}"; do
        if [ -f "$SOURCE_ROOT/$file" ]; then
            # Make backup if destination file already exists
            if [ -f "$DEST_OTHER/$file" ]; then
                mv "$DEST_OTHER/$file" "$DEST_OTHER/${file}.bak"
                echo "📦 Did create backup for $file"
            fi
            
            # Copy file from source to destination
            cp -f "$SOURCE_ROOT/$file" "$DEST_OTHER/"
            echo "✅ Did copy $file to $DEST_OTHER"
        else
            echo "⚠️ File not found: $file in $SOURCE_ROOT, skipping."
        fi
    done
    cp -f "$SOURCE_ROOT/fastfetch.jpg" "$HOME/Documents/"
    echo "✅ Did copy fastfetch.jpg to $HOME/Documents/"
else
    echo "Skipping other files backup."
fi

