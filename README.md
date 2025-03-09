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

