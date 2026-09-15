# PHONY declaration
.PHONY: all nvim alacritty fastfetch

# Install all configs and dotfiles
all: bashrc nvim alacritty fastfetch

bashrc:
	cp .bashrc ~/.bashrc

nvim:
	./install.sh NeoVim ./nvim $(HOME)/.config/nvim

alacritty:
	./install.sh Alacritty ./alacritty $(HOME)/.config/alacritty

fastfetch:
	./install.sh FastFetch ./fastfetch $(HOME)/.config/fastfetch