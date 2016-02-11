gvim_rails_setup
================

Just my settings for gvim/macvim.  

## macvim/gvim setup
Plugin setup:  
`git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`  
then in `.vimrc` comment out every plugin except the part that sets up vundle. Then run `:PluginInstall` to set up vundle itself, and after that uncomment all other plugins and run `:PluginInstall` again.  

### Compile command-t plugin:

    cd ~/.vim/bundle/command-t/ruby/command-t
    rvm use system
    ruby extconf.rb
    make

## neovim setup
Decide which Python env to use, then `pip2 install neovim` or `pip3 install neovim`, then edit  
`let g:python3_host_prog = '/usr/local/bin/python3'` - line in `init.vim`.  

Then in `init.vim` comment out every plugin except the part that sets up NeoBundle. Then comment the plugins in again, all plugins will be installed.

### YouCompleteMe setup
After plugin installation:  
`cd ~/.config/nvim/bundle/YouCompleteMe`  
`./install.py --tern-completer`


## After either setup:
Don't forget to copy the files in the `plugin`-directory (`IndexedSearch.vim` & `visSum.vim`)!
