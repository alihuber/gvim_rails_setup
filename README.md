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
`cd .config && mkdir nvim && cd nvim && mkdir bundle && cd bundle`  
`git clone https://github.com/Shougo/neobundle.vim && cd..`  
`wget https://raw.githubusercontent.com/alihuber/gvim_rails_setup/master/init.vim`  
Decide which Python env to use, then `pip2 install neovim` or `pip3 install neovim`, then edit the  
`let g:python3_host_prog = '/usr/local/bin/python3'` - line in `init.vim`.  
Start `nvim`, all plugins will be installed

### YouCompleteMe setup
After plugin installation:  
`cd ~/.config/nvim/bundle/YouCompleteMe`  
Make sure `node` is in `$PATH`, then
`./install.py --tern-completer`  
For better omnicompletion re-generate ctags: `ctags -R --fields=+l *`

### JavaScript development
`npm install -g typescript eslint babel-eslint eslint-plugin-react`


## After either setup:
Don't forget to copy the files in the `plugin`-directory:  
`cd .config/nvim && mkdir plugin && cd plugin`    
`wget https://raw.githubusercontent.com/alihuber/gvim_rails_setup/master/plugin/IndexedSearch.vim`  
`wget https://raw.githubusercontent.com/alihuber/gvim_rails_setup/master/plugin/visSum.vim`
