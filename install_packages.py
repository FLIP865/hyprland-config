#!/usr/bin/env python3
import subprocess
import sys
import time
import shutil

# Список пакетов для разработки и утилит
DEV_PACKAGES = [
    "baobab", "timeshift", "wireshark-qt", "libxml2-legacy", 
    "raylib", "sdl2-compat", "sdl2_image",
    "filezilla", "discord", "chromium", "keepassxc", 
    "audacity", "dconf-editor", "valgrind", "asciidoctor", "asciidoc",
    "neovim", "obs-studio", "telegram-desktop", "cowsay",
    "obsidian", "python-pip", "python3", "nodejs", "npm", "vim", 
    "net-tools", "nmap", "hydra", "aircrack-ng", "fastfetch", "neofetch", "htop", "btop",
    "hyprpicker", "libreoffice-fresh", "openvpn", "dhcpcd", "base", "base-devel", "linux", 
    "linux-firmware", "linux-headers", "networkmanager", "ninja", "meson", "make", "cmake",
    "clang", "clang18", "nuspell", "libvoikko", "aspell", "hspell",
    "mako", "wofi", "rofi", 
    "xdg-user-dirs", "torbrowser-launcher", 
    "wine",
    # Шрифты
    "cantarell-fonts", "noto-fonts", "noto-fonts-emoji", "noto-fonts-cjk", 
    "ttf-nerd-fonts-symbols", "ttf-nerd-fonts-symbols-mono", "ttf-jetbrains-mono-nerd", 
    "ttf-dejavu", "ttf-liberation", "ttf-fira-sans", "ttf-fira-code", 
    "ttf-font-awesome", "otf-font-awesome", "ttf-jetbrains-mono", "papirus-icon-theme",
    # Архиваторы
    "unzip", "zip", "p7zip", "unrar", "tar",
    # Диски
    "gparted", "dosfstools", "exfat-utils", "ntfs-3g",
    # Видео-аудио
    "vlc", "libdvdread", "libdvdcss", "sshfs",
    # Thunar и плагины
    "thunar", "udisks2", "thunar-volman", "gvfs", "gvfs-afc", "gvfs-smb", "gvfs-mtp", "gvfs-gphoto2", 
    "gvfs-nfs", "gvfs-udisks2", "gvfs-fuse", "thunar-archive-plugin", "thunar-media-tags-plugin", "tumbler", 
    "ffmpegthumbnailer",
    # Темы и курсоры
    "nwg-look", "capitaine-cursors"
]

# Список официальных инструментов GNOME
GNOME_OFFICIAL_TOOLS = [
    "evince", "gnome-calculator", "gnome-text-editor", "gnome-disk-utility", "gucharmap",
    "gthumb", "gnome-clocks", "gnome-calendar", "gnome-firmware",
    "eog"
]

def print_progress_bar(iteration, total, prefix='', suffix='', length=50, fill='█'):
    percent = f"{100 * (iteration / float(total)):.1f}"
    filled_length = int(length * iteration // total)
    bar = fill * filled_length + '-' * (length - filled_length)
    print(f'\r{prefix} |{bar}| {percent}% {suffix}', end='\r')
    if iteration == total: 
        print()

def install_packages():
    all_packages = list(set(DEV_PACKAGES + GNOME_OFFICIAL_TOOLS))
    total = len(all_packages)

    print("🔄 Обновление системы...")
    try:
        subprocess.run(["sudo", "pacman", "-Syu", "--noconfirm"], check=True)
    except subprocess.CalledProcessError:
        print("❌ Ошибка обновления системы!")
        sys.exit(1)

    print("\n🚀 Установка пакетов...")

    for idx, package in enumerate(all_packages, start=1):
        try:
            subprocess.run(["sudo", "pacman", "-S", "--needed", "--noconfirm", package], check=True)
            print_progress_bar(idx, total, prefix='Прогресс', suffix=f'Установлено: {idx}/{total}')
        except subprocess.CalledProcessError:
            print(f"\n❌ Ошибка установки пакета: {package}")

    print("\n✅ Все пакеты установлены!")

    # Обновляем кэш шрифтов
    print("🔄 Обновление кэша шрифтов...")
    try:
        subprocess.run(["sudo", "fc-cache", "-fv"], check=True)
    except subprocess.CalledProcessError:
        print("⚠️ Ошибка обновления кэша шрифтов, но это не критично.")

if __name__ == "__main__":
    if shutil.which("pacman") is None:
        print("❌ Это не Arch Linux или pacman не установлен.")
        sys.exit(1)

    print("🎯 Запуск установщика пакетов для Arch Linux...\n")
    install_packages()
