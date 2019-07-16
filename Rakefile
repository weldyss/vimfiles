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
  exec ("git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim")
  exec ("vim +PluginInstall +qall")
end

task :tmp_dirs do
  mkdir_p "_backup"
  mkdir_p "_temp"
end
