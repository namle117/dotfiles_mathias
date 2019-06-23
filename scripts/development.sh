#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install Python
brew install python
brew install python3

# Install ruby-build and rbenv
brew install ruby-build
brew install rbenv
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.zshrc.local || echo "$LINE" >> ~/.zshrc.local

# Install Heroku
brew tap heroku/brew && brew install heroku
heroku update

# Install Docker, which requires virtualbox
brew install docker docker-compose docker-machine xhyve docker-machine-driver-xhyve

sudo chown root:wheel /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
sudo chmod u+s /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve


# Software development
brew install httpie
brew install node
brew install cmake

# SQLite
    # Install the DB you will need
    # brew install sqlite3

# MySQL
    # brew install mysql

    # Start up the services
    # brew services start mysql
    # brew cask install --appdir="/Applications" mysqlworkbench

# PostgreSQL
    brew install postgresql

    # Start up the services
    brew services start postgresql
    brew cask install --appdir="/Applications" pgadmin4

# Mojave changed the location of header files necessary for compiling C extensions
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

# Remove outdated versions from the cellar.
brew cleanup
