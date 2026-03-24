
sudo pacman -S waybar ttf-jetbrains-mono ttf-dejavu hyprpaper ttf-font-awesome \
    ttf-nerd-fonts-symbols ttf-jetbrains-mono-nerd code firefox discord wine \
    telegram-desktop nvim flatpak obs-studio qbittorrent easyeffects \
    alacritty thunar git curl wget htop btop neofetch fastfetch \
    unzip unrar p7zip zip gvfs gvfs-mtp gvfs-smb ntfs-3g \
    python python-pip nodejs npm \
    bluez bluez-utils blueman pipewire pipewire-pulse wireplumber \
    brightnessctl networkmanager network-manager-applet \
    pavucontrol grim slurp wl-clipboard swappy \
    polkit-kde-agent dunst libnotify \
    lxappearance qt5ct \
    mpv vlc yt-dlp \
    virt-manager qemu-desktop libvirt dnsmasq edk2-ovmf \
    docker docker-compose \
    fzf lazygit github-cli \
    timeshift rsync \
    openssh sshfs

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

yay -S hyprlock hyprshot hypridle \
    visual-studio-code-bin \
    google-chrome \
    slack-desktop \
    postman-bin \
    anydesk-bin \

    protonup-qt \
    gamemode \
    mangohud \
    vesktop \
    drawio-desktop-bin \
    dbeaver \
    keybase \
    syncthingtray \
    bleachbit \
    stacer-bin \
    ventoy-bin \
    etcher-bin \
    qdirstat \
    kubectl \
    github-desktop-bin \
    grub-customizer \
    sddm \
    sddm-qt5 \
    sddm-sugar-candy-git


git clone https://github.com/vinceliuice/grub2-themes.git /tmp/grub2-themes
cd /tmp/grub2-themes
sudo ./install.sh -t vimix -b
cd
rm -rf /tmp/grub2-themes

sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo systemctl enable sddm
sudo systemctl set-default graphical.target

sudo mkdir -p /etc/sddm.conf.d

sudo tee /etc/sddm.conf.d/theme.conf << EOF
[Theme]
Current=sugar-candy
CursorTheme=breeze_cursors
EOF

# Создаем конфиг для автологина (опционально)
sudo tee /etc/sddm.conf.d/autologin.conf << EOF
[Autologin]
User=$USER
Session=hyprland
EOF


flatpak install flathub com.valvesoftware.Steam
flatpak install flathub org.vinegarhq.Sober
flatpak install flathub org.vinegarhq.Vinegar

cp -r waybar /home/$USER/.config/
cp hyprpaper.conf /home/$USER/.config/hypr/
cp .wall.jpg /home/$USER/
cp -r kitty /home/$USER/.config/
