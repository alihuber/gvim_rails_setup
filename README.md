gvim_rails_setup
================

Just my settings for gvim/macvim.  

Plugin setup:  
`git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`  
then in `.vimrc` comment out every plugin except the part that sets up vundle. Then run `:PluginInstall` to set up vundle itself, and after that uncomment all other plugins and run `:PluginInstall` again.  

Compile command-t plugin:

    cd ~/.vim/bundle/command-t/ruby/command-t
    rvm use system
    ruby extconf.rb
    make

Don't forget to copy the files in the `plugin`-directory!
