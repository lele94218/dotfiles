# Dotfiles

## How to use

This guide will introduce how to setup author's development environment.

```sh
mkdir ~/works
git clone https://github.com/lele94218/dotfiles.git ~/works
```

## Oh-My-Zsh

Bash is good but should use oh-my-zsh if you're lazy.

See: https://ohmyz.sh/#install

```sh
sudo apt install zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

Install auto suggestions, please. Remember you're lazy, I don't know what is `Ctrl-R` and blablabla... Just press Up and Down to show histories.

See: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh

```sh
works git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Then, use the magic config file.

```
ln ~/works/dotfiles/zsh/.zshrc ~/.zshrc
```

## Neo-vim

I don't use \*vim because most of them are out of maintenance.

See: https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu

If Ubuntu version is lower than 18.04:

```
$ sudo add-apt-repository ppa:neovim-ppa/unstable

$ sudo apt-get update
$ sudo apt-get install neovim
```

:%s/vim/nvim/g

```
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
```

Then, use nvim config file.

```
cd ~/.config
mkdir nvim
cd nvim
ln ~/works/dotfiles/nvim/init.vim init.vim
```

Let's fix missing plugins. First install Vundle see: 
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim init.vim
```

Skip error messages then type `:PluginInstall` and everything will be installed.

Then still remain some plugin to fix.

### Fzf

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
sudo apt install fd-find
```

### Tmux

```
sudo apt install tmux
ln -s ~/works/dotfiles/tmux/.tmux.conf ~/.tmux.conf
```
