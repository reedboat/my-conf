desc "deploy vimrc"
task :deploy => [:vim] do
  # Bundle and scripts
  system 'ln -s ~/workspace/github/my-conf/screen/.screenrc ~/.screenrc'
  system 'ln -s ~/workspace/github/my-conf/screen/.bashrc ~/.bash_profile'
  #system 'mkdir -p ~/workspace/github/;cd ~/workspace/github'
  #system 'git clone https://github.com/reedboat/my-conf.git' 

  # snipmate-snippets
  #system 'cd snipmate-snippets/; rake deploy_local; cd -'
end
task :vim do
  system 'ln -s ~/workspace/github/my-conf/vim/.vim ~/.vim'
  system 'ln -s ~/workspace/github/my-conf/vim/.vimrc ~/.vimrc'

  system 'mkdir -p ~/.vim/bundle'
  system 'git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle'
  system 'vim +BundleInstall +qa'
  system 'git submodule init; git submodule update'
  system 'cd ~/.vim/bundle/Command-T/ruby/command-t/; rvm system do ruby extconf.rb; make; cd -'
end
