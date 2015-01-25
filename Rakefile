task :default => [:tmp_dirs, :link, :vundle]

task :link do
  %w[vimrc].each do |script|
    dotfile = File.join(ENV['HOME'], ".#{script}")
    if File.exist? dotfile
      warn "~/.#{script} already exists"
    else
      ln_s File.join('.vim', script), dotfile
    end
  end
end

task :vundle do
  if File.directory?("~/.vim/bundle/vundle.vim")
    exec ("git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle.vim")
  end
  exec("vim +PluginInstall +qall")
end

task :tmp_dirs do
  mkdir_p "_backup"
  mkdir_p "_temp"
end
