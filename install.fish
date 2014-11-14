#!/usr/bin/env fish

for pkg in (ls | egrep -v '*.fish$' | egrep -v '*.md$')
	stow $pkg -t $HOME
end

if not test -e $HOME/.config/fish
	mkdir -p $HOME/.config/fish
end
stow fish -t $HOME/.config/fish
