#!/bin/sh

REPOS="https://github.com/csexton/jekyll.vim.git
https://github.com/plasticboy/vim-markdown.git
https://github.com/vim-scripts/closetag.vim.git
https://github.com/majutsushi/tagbar.git"

if [ ! -d bundle ]
then
	echo "Make sure the bundle directory exists"
	exit
fi

echo "copying vimrc"
cp vimrc ../.vimrc

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
