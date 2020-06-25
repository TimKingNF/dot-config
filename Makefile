.PHONY: \
  link \
  link-tmux \
  link-py \
  link-java

link: \
  link-tmux \
  link-py \
  link-java

link-tmux:
	mkdir -p ~/.tmux/plugins
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -sf ~/.config/tmux/tmux.conf ~/.tmux.conf

link-py:
	ln -sf ~/.config/py/pip ~/.pip

link-java:
	ln -sf ~/.config/java/m2 ~/.m2
