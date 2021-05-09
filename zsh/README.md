# zsh configuration

## install zsh

[zsh-5.8-source](https://sourceforge.net/projects/zsh/files/zsh/5.8/zsh-5.8.tar.xz/download)

```bash
# centos
yum install -y ncurses-devel
tar zxf zsh-5.8.tar.xz
cd zsh-5.8
./configure --enable-multibyte
make && make install
chsh /usr/local/bin/zsh
```

## install zplug

```bash
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
```

## install oh-my-zsh & p10k

```bash
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

## install software

```bash
# centos
yum install -y autojump
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


# osx
brew install git autojump fzf tmux ranger nvim
```

### additional

```bash
# osx
brew install oath-toolkit
```