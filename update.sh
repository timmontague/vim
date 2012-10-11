#!/bin/bash

REPOS="https://github.com/csexton/jekyll.vim.git
https://github.com/tpope/vim-markdown.git
https://github.com/vim-scripts/closetag.vim.git
https://github.com/majutsushi/tagbar.git
https://github.com/garbas/vim-snipmate.git
https://github.com/MarcWeber/vim-addon-mw-utils.git
https://github.com/tomtom/tlib_vim.git
https://github.com/scrooloose/nerdtree.git
https://github.com/kien/ctrlp.vim.git
https://github.com/scrooloose/syntastic.git"

# vim-addon-mw-utils and tlib_vim are requirements of vim-snipmate

# make tmp dirs
mkdir -p ~/.vim/tmp/backup
mkdir -p ~/.vim/tmp/undo

if [ ! -d bundle ]
then
	echo "Make sure the bundle directory exists"
	exit
fi

if [[ ! -L ~/.vimrc ]]; then
	echo "symlinking vimrc"
	rm ~/.vimrc
	ln -s ~/.vim/vimrc ~/.vimrc
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
