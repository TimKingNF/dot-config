link: \
  link-tmux \
  link-py \
  link-java \
  link-git \
  link-zsh

link-osx-software: \
  link-rime

link-tmux:
	mkdir -p ~/.tmux/plugins
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -sf ~/.config/tmux/tmux.conf ~/.tmux.conf

link-py:
	ln -sf ~/.config/py/pip ~/.pip

link-java:
	ln -sf ~/.config/java/m2 ~/.m2

link-rime:
	ln -sf ~/.config/Rime ~/Library/Rime

link-git:
	ln -sf ~/.config/git/gitconfig ~/.gitconfig

link-zsh:
	ln -sf ~/.config/zsh/p10k.zsh ~/.p10k.zsh
	[[ ! -f ./zsh/personal.zsh ]] && touch ./zsh/personal.zsh
	ln -sf ~/.config/zsh/zshrc ~/.zshrc
