link: \
  link-tmux \
  link-py \
  link-java

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

