My vim configuration
==========================

My vim files is based on [Mislav](http://github.com/mislav/vimfiles)

Thanks to these guys:
* [Gary Bernhardt](http://destroyallsoftware.com),
* [Drew Neil](http://vimcasts.org),
* [Tim Pope](http://tbaggery.com),
* and the [Janus project](https://github.com/carlhuda/janus).

My configuration uses [Vundle](https://github.com/gmarik/Vundle.vim).
(But you don't need to care about any of that.)

## Installation:

Prerequisites: ruby, git.

1. Clone this repo into ".vim":  
   `git clone https://github.com/weldyss/vimfiles ~/.vim`
2. Go into ".vim" and run "rake": 
   `cd ~/.vim && rake`

This will install "~/.vimrc" symlink that point to files inside
 ".vim" directory.

## Features:

* 2 spaces, no tabs
* incremental, case-insensitive search
* 'Leader' character mapped to "," (comma)
* `,t` opens file search via :CommandT plugin
* `,,` switches between two last buffers
* `<C-j/k/h/l>` switches between windows (no need to prepend `<C-w>`)

## Plugins:

* hail2u/vim-css3-syntax
* mattn/emmet-vim
* tpope/vim-fugitive
* tpope/vim-rails
* pangloss/vim-javascript
* vim-ruby/vim-ruby
* hallison/vim-ruby-sinatra
* mileszs/ack.vim
* tpope/vim-endwise
* tpope/vim-commentary
* mattn/gist-vim
* mattn/webapi-vim
* kien/ctrlp.vim
* tpope/vim-surround
* thoughtbot/vim-rspec
* tpope/vim-dispatch
* matze/vim-move
* tpope/vim-git
* benmills/vimux
