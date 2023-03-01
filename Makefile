.PHONY: all

XDG_CACHE_HOME ?= $(HOME)/.cache
XDG_CONFIG_HOME ?= $(HOME)/.config
VIM_CACHE = $(XDG_CACHE_HOME)/vim

all:
	git pull
	git submodule init
	git submodule update
	mkdir -p $(VIM_CACHE)/backup $(VIM_CACHE)/swp
	stow -t $(HOME) bash asdf tmux vim X starship
	stow -t $(XDG_CONFIG_HOME) nvim
