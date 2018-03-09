# Stove's Dotfiles

This is a place reserved for all my Linux-oriented dotfiles. The project relies on a single Rakefile using Ruby and Rake to update the dotfiles as needed.

The aim is to provide a way to update all my dotfiles across multiple devices without resorting to cloud storage methods like Google Drive or Dropbox. This way versioning is controlled with Git (if a particular file update is bad, we can roll it back with Git), and the files can be distributed easily using `git pull` and a Rake task `rake deploy`.

## Installation and Usage

To install, clone the repository
```bash
git clone https://github.com/sleibrock/stove-dotfiles
cd stove-dotfiles
rake deploy
```

That will copy all tracked files to their destinations as designated by the Rakefile.

In order to add more files to be tracked, edit the Rakefile and run `rake update` to copy all files into the directory, which can then be staged with `git add -A` and committed.

### Note about Emacs

Emacs doesn't have a very good function for batch-downloading all additional packages from a repository. `package-install`, which is obtained from `package.el`, only allows downloading a single file at a time. In my Emacs dotfile I include functionality to donwload multiple packages at once. Simply edit the `emacsconfig` file to add or remove packages and then run `M-x install-all-packages`.
