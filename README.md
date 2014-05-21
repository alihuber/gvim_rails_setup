gvim_rails_setup
================

Just my settings for gvim/macvim.
Copy .vimrc to ~/. all other files into ~/.vim directory


Compile command-t plugin:

    cd ~/.vim/bundle/command-t/ruby/command-t
    rvm use system
    ruby extconf.rb
    make

and in vim:

    :call pathogen#helptags()
