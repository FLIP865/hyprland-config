# My config for hyprland

# For vim config
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
1. Create theme folder (in case you don't have yet):
```
mkdir -p ~/.vim/pack/themes/start
```
2. Navigate to the folder above:
```
cd ~/.vim/pack/themes/start
```
3. Clone the repository using the "doki-theme" name:
```
git clone https://github.com/doki-theme/doki-theme-vim.git doki-theme
```
4. Create configuration file (in case you don't have yet):
```
touch ~/.vimrc
```
5. Edit the ```~/.vimrc file``` with the following content:
```
packadd! doki-theme
syntax enable
colorscheme rem
```
6. If there are errors with nmp or node
```
mkdir -p ~/.vim/pack/coc/start
cd ~/.vim/pack/coc/start
git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1
vim -c "helptags coc.nvim/doc/ | q"
```
7. For theme clone repo
```
git clone https://github.com/vinceliuice/Graphite-gtk-theme.git
cd Graphite-gtk-theme/
./install.sh
```
8. yay
```
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
```
9. Wallpapers
```
git clone https://gitlab.com/jacinthsamuel/wallpapers
```
10. Insall zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
11. Theme powerlevel10k
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
12. plugins (autocompletion and syntax highlighting):
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

