#!/usr/bin/env python3
import subprocess
import sys

# Список пакетов для разработки и утилит
DEV_PACKAGES = [
    "baobab", "timeshift", "wireshark-qt",
    "filezilla", "discord", "chromium", "keepassxc", 
    "audacity", "dconf-editor",
    "neovim", "obs-studio", "telegram-desktop", "cowsay",
    "obsidian", "python-pip", "python3", "nodejs", "npm", "vim", 
    "net-tools", "nmap", "hydra", "aircrack-ng", "fastfetch", "neofetch", "htop",
    "hyprpicker", "libreoffice-fresh", "openvpn", "dhcpcd", "base", "base-devel" "linux", "linux-firmware", "networkmanager",
    # Шрифты
    "cantarell-fonts", "noto-fonts", "noto-fonts-emoji", "noto-fonts-cjk", 
    "ttf-nerd-fonts-symbols", "ttf-nerd-fonts-symbols-mono", "ttf-jetbrains-mono-nerd", 
    "ttf-dejavu", "ttf-liberation", "ttf-fira-sans", "ttf-fira-code", 
    "ttf-font-awesome", "otf-font-awesome", "ttf-jetbrains-mono", "papirus-icon-theme",
    # Утилиты для работы с архивами
    "unzip", "zip", "7zip", "unrar", "tar",
    # Утилиты для работы с дисками
    "gparted", "dosfstools", "exfat-utils", "ntfs-3g",
    # VLC и зависимости
    "vlc", "libdvdread", "libdvdcss", "sshfs",
    # Thunar и плагины
    "thunar", "udisks2", "thunar-volman", "gvfs", "gvfs-afc", "gvfs-smb", "gvfs-mtp", "gvfs-gphoto2", "gvfs-nfs", "gvfs-udisks2", "gvfs-fuse", "thunar-archive-plugin", "thunar-media-tags-plugin", "tumbler", "ffmpegthumbnailer",
    # Утилиты для настройки тем и курсоров
    "nwg-look", "capitaine-cursors"
]

# Список официальных инструментов GNOME
GNOME_OFFICIAL_TOOLS = [
    "evince", "gnome-calculator", "gnome-text-editor", "gnome-disk-utility", "gucharmap",
    "gthumb", "gnome-clocks", "gnome-firmware",
    "eog"  # Eye of GNOME
]

def install_packages():
    # Объединяем все пакеты в один список
    all_packages = DEV_PACKAGES + GNOME_OFFICIAL_TOOLS

    # Удаляем дубликаты (на всякий случай)
    all_packages = list(set(all_packages))

    print("Обновление системы и установка пакетов...")
    try:
        # Обновляем систему
        subprocess.run(["sudo", "pacman", "-Syu", "--noconfirm"], check=True)

        # Устанавливаем все пакеты
        subprocess.run(["sudo", "pacman", "-S", "--noconfirm"] + all_packages, check=True)

        print("Все пакеты успешно установлены!")

        # Обновляем кэш шрифтов
        print("Обновление кэша шрифтов...")
        subprocess.run(["sudo", "fc-cache", "-fv"], check=True)

    except subprocess.CalledProcessError as e:
        print(f"Ошибка при установке: {e}")
        sys.exit(1)

if __name__ == "__main__":
    print("Установка пакетов для Arch Linux...")
    install_packages()
