#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

###############################################################################
# Install command-line tools with Homebrew

# Notes:
#   Do not install Node.js through Homebrew, use nvm
#   https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development/#nodejs

#   Some of the tools installed in this section are also provided by macOS, 
#   so brew installs those tools with the "g" prefix. To be able to use those
#   tools without the prefix you must add some directories to the `PATH`
#   variable. Those directories are added in the `.path` file.
###############################################################################

# Install GNU core utilities (those that come with macOS are outdated).
#   See the list of tools at https://github.com/coreutils/coreutils
#   Add `$(brew --prefix)/opt/coreutils/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
#   https://joeyh.name/code/moreutils/
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
#   https://www.gnu.org/software/findutils/
#   Add `$(brew --prefix)/opt/findutils/libexec/gnubin` to `$PATH`.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`
#   https://www.gnu.org/software/sed/
#   Add `$(brew --prefix)/opt/gnu-sed/libexec/gnubin` to `$PATH`.
brew install gnu-sed --with-default-names

# Install a modern version of Bash
brew install bash
brew install bash-completion2

# Install a modern version of Zsh and use it as default shell
brew install zsh
if ! fgrep -q "${BREW_PREFIX}/bin/zsh" /etc/shells; then
  echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/zsh";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable GPG-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
# brew install screen
# brew install php
# brew install gmp

# Install font tools — see https://github.com/bramstein/homebrew-webfonttools
# brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2

# Install some CTF tools — see https://github.com/ctfs/write-ups
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

# Install other useful binaries.
# brew install ack
# brew install awscli
#brew install exiv2
brew install git
# brew install git-lfs
# brew install gs
# brew install imagemagick --with-webp
# brew install lua
# brew install lynx
# brew install p7zip
# brew install pigz
# brew install pv
# brew install rename
# brew install rlwrap
# brew install ssh-copy-id
brew install tldr
brew install trash
brew install tree
# brew install vbindiff
# brew install zopfli

###############################################################################
# Install casks

# Note:
#   The most used apps are installed by default, others can be installed on demand.
#   To search use — `brew search <term>`
#   See cask usage — https://github.com/Homebrew/homebrew-cask/blob/master/USAGE.md
#   See additional taps — https://github.com/Homebrew/homebrew-cask/blob/master/USAGE.md#additional-taps-optional
###############################################################################

# Cask
# brew cask install balenaetcher
# brew cask install docker
# brew cask install filemaker
brew cask install google-backup-and-sync
# brew cask install handbreak
# brew cask install karabiner-elements
brew cask install microsoft-excel
# brew cask install microsoft-powerpoint
brew cask install microsoft-word
brew cask install numi
brew cask install open-in-code
# brew cask install postgres
# brew cask install postico
# brew cask install postman
brew cask install private-internet-access
brew cask install rectangle
brew cask install rocket
# brew cask install virtualbox
brew cask install visual-studio-code
brew cask install vlc
brew cask install whatsapp
# brew cask install vagrant
# brew cask install zoomus

# Cask-versions — https://github.com/Homebrew/homebrew-cask-versions
brew tap homebrew/cask-versions
brew cask install firefox-developer-edition
brew cask install google-chrome-canary

# Cask-fonts — https://github.com/Homebrew/homebrew-cask-fonts
brew tap homebrew/cask-fonts
brew cask install font-source-code-pro
brew cask install font-jetbrains-mono


###############################################################################
# Tools that need to be installed manually
###############################################################################

# Adobe apps
# ColorSnapper
# Microsoft remote desktop
# MindNode
# OmniGraffle
# PDF Expert
# RAR Extractor
# Spark
# Ulysses
# uTorrent

###############################################################################
# Remove outdated versions from the cellar.
###############################################################################
brew cleanup
