#!/bin/sh

REPOS="https://github.com/timmontague/jekyll.vim.git
https://github.com/plasticboy/vim-markdown.git
https://github.com/vim-scripts/closetag.vim.git
https://github.com/majutsushi/tagbar.git
https://github.com/vim-scripts/undofile.vim.git"

if [ ! -d bundle ]
then
	echo "Make sure the bundle directory exists"
	exit
fi

echo "copying vimrc"
if [ -f /etc/vim/vimrc.local ]
then
	sudo cp vimrc /etc/vim/vimrc.local
else
	cp vimrc ~/.vimrc
fi

cd bundle
for r in $REPOS
do
	dir=`basename $r .git`
	if [ -d $dir ]
	then
		cd $dir
		echo "Updating $dir"
		git pull
		cd ..
	else
		echo "Cloning $dir"
		git clone $r
	fi

done
