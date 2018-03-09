# Ruby Rakefile for updating and dispatching Dotfiles
# The Rakefile is responsible for two things:
# 1) copying files from their designated paths
# 2) deploying/copying files to their original locations


# Add a file to keep track of here
# Location to put file in Git tracker => Location of desirable file
FILES = {
  "./Xresources"   => "~/.Xresources",
  "./emacsconfig"  => "~/.emacs",
  "./zshrc"        => "~/.zshrc",
  "./i3config"     => "~/.config/i3/config",
  "./gitconfig"    => "~/.gitconfig",
}


def copyfile(from, to)
  puts "Copying '#{from}' to '#{to}'"
  `cp #{from} #{to}`
end


# Copy all files from their locations to the Git project
task :update do
  FILES.each_pair do |pair|
    copyfile(pair[1], pair[0])
  end
end


# Copy all files from the Git repo to their target dirs
task :deploy do
  FILES.each_pair do |pair|
    copyfile(pair[0], pair[1])
  end
end


# Clear all files from the project (probably shouldn't use this)
task :clear do
  FILES.each_pair do |pair|
    `rm #{pair[0]}`
  end
end

# end
