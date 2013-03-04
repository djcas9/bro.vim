bro.vim
================

bro.vim is a simple plugin for working with the bro scripting languages.

### Install for pathogen

    cd ~/.vim/
    git submodule add git://github.com/mephux/bro.vim.git bundle/bro
    vim bundle/bro/example.bro

### Manually Install

    cd ~/.local/src
    git clone git://github.com/mephux/bro.vim.git
    cp -R bro.vim/syntax/* ~/.vim/syntax/
    # cp -R bro.vim/indent/* ~/.vim/indent/ - Coming Soon.
    cp -R bro.vim/ftdetect/* ~/.vim/ftdetect/
    vim bro.vim/example.bro

## Thanks

 * Martin Casado - bro.vim syntax author.
