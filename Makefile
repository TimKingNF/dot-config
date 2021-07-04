link: \
  link-tmux \
  link-py \
  link-java \
  link-git \
  link-zsh \
  link-nvim

link-osx-software: \
  link-rime

link-tmux:
	mkdir -p ~/.tmux/plugins
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -sf ~/.config/tmux/tmux.conf ~/.tmux.conf

link-py:
	ln -sf ~/.config/py/pip ~/.pip
	ln -sf ~/.config/py/jupyter ~/.jupyter
	ln -sf ~/.config/py/conda/condarc ~/.condarc

link-java:
	ln -sf ~/.config/java/m2 ~/.m2

link-rime:
	ln -sf ~/.config/Rime ~/Library/Rime

link-git:
	ln -sf ~/.config/git/gitconfig ~/.gitconfig

link-zsh: SHELL:=/bin/bash
link-zsh:
	ln -sf ~/.config/zsh/p10k.zsh ~/.p10k.zsh
	if [ ! -e ./zsh/personal.zsh ]; then touch ./zsh/personal.zsh; fi
	ln -sf ~/.config/zsh/zshrc ~/.zshrc

link-nvim:
	ln -sf ~/.config/nvim/idea.vimrc ~/.ideavimrc
