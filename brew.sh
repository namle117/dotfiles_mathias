#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew tap homebrew/versions
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# Install `wget` with IRI support.
brew install wget --with-iri

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
brew install ringojs
brew install narwhal

# Install Python
brew install python
brew install python3

# Install ruby-build and rbenv
brew install ruby-build
brew install rbenv
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

brew install libpqxx
brew install postgresql@9.5

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
# brew install homebrew/dupes/grep
# brew install homebrew/dupes/openssh
# brew install homebrew/dupes/screen
# brew install homebrew/php/php55 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
# brew install homebrew/x11/xpdf
brew install xz

# Install other useful binaries.
brew install ack
brew install dark-mode

#brew install exiv2
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install hub
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install npm
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install webkit2png
brew install zopfli
brew install pkg-config libffi
brew install pandoc

# Lxml and Libxslt
brew install libxml2
brew install libxslt
brew link libxml2 --force
brew link libxslt --force

# Install Heroku
brew install heroku-toolbelt
heroku update

# Development tools
brew install awscli
brew install kubernetes-cli

# Node
brew install nvm
nvm install node


# Core casks
brew cask install --appdir="/Applications" cakebrew
brew cask install --appdir="~/Applications" iterm2
brew cask install --appdir="~/Applications" java
brew cask install --appdir="~/Applications" xquartz

# Development tool casks
# brew cask install --appdir="/Applications" atom
# brew cask install --appdir="/Applications" sublime-text
# brew cask install --appdir="/Applications" vagrant
# brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" adobe-creative-cloud
brew cask install --appdir="/Applications" dash # Language syntax lookup
brew cask install --appdir="/Applications" dbvisualizer # DB table schema visualizer
brew cask install --appdir="/Applications" docker
brew cask install --appdir="/Applications" gas-mask # Hostname
brew cask install --appdir="/Applications" macdown # Markdown editor
brew cask install --appdir="/Applications" pgadmin4 # PostgreSQL Admin UI
brew cask install --appdir="/Applications" psequel # PostgreSQL GUI Lite
brew cask install --appdir="/Applications" sourcetree # Git GUI
brew cask install --appdir="/Applications" visual-studio-code

# Browsers casks
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" opera

# Misc casks
brew cask install --appdir="/Applications" 1password
brew cask install --appdir="/Applications" astro # Email
brew cask install --appdir="/Applications" blue-jeans # Teleconf
brew cask install --appdir="/Applications" blue-jeans-browser-plugin
brew cask install --appdir="/Applications" calibre
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" transmission # Torrent
brew cask install --appdir="/Applications" wavebox

# Utility casks
brew cask install --appdir="/Applications" a-better-finder-attributes
brew cask install --appdir="/Applications" a-better-finder-rename
brew cask install --appdir="/Applications" alfred # Launcher
brew cask install --appdir="/Applications" cheatsheet # Shows all shortcuts
brew cask install --appdir="/Applications" disk-drill # Disk fixer
brew cask install --appdir="/Applications" duet # Ipad monitor
brew cask install --appdir="/Applications" expressvpn # VPN
brew cask install --appdir="/Applications" flycut # Clipboard
brew cask install --appdir="/Applications" gemini # File deduplication
brew cask install --appdir="/Applications" grammarly # Grammer
brew cask install --appdir="/Applications" spotify # Spotify Music  
brew cask install --appdir="/Applications" vlc # Video player

# Messaging casks
brew cask install --appdir="/Applications" signal
brew cask install --appdir="/Applications" telegram
brew cask install --appdir="/Applications" viber
brew cask install --appdir="/Applications" whatsapp

#brew cask install --appdir="/Applications" gimp
#brew cask install --appdir="/Applications" inkscape

# Rappler casks
# brew cask install --appdir="/Applications" basecamp

# # Install Docker, which requires virtualbox
# brew install docker
# brew install boot2docker

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

brew install mas

# Apple software
mas install 497799835 # Xcode (9.4.1)
mas install 409203825 # Numbers (5.1)
mas install 409201541 # Pages (7.1)
mas install 409183694 # Keynote (8.1)
mas install 408981434 # iMovie (10.1.9)
# mas install 682658836 # GarageBand (10.3.1)

# Productivity Apps
mas install 406056744 # Evernote (7.2.2)
mas install 441258766 # Magnet (2.2.1)
mas install 540348655 # Monosnap (3.4.17)
mas install 1091189122 # Bear (1.5.5)

# mas install 421131143 # MPlayerX (1.0.14)
# mas install 405399194 # Kindle (1.23.3)
# mas install 641027709 # Color Picker (1.5.0)
# mas install 585829637 # Todoist (7.0.14)
# mas install 425424353 # The Unarchiver (4.0.0)
# mas install 411246225 # Caffeine (1.1.1)
# mas install 407963104 # Pixelmator (3.7.3)
# mas install 950290785 # LuminoCity (1.0.22)
# mas install 425955336 # Skitch (2.8.2)
# mas install 1147396723 # WhatsApp (0.3.33)

mas upgrade

# Check for errors
echo "doctoring"
brew doctor

# Finalize and cleanup
echo "finalizing"
brew cleanup
