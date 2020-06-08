#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

###############################################################################
# Install command-line tools with Homebrew
###############################################################################

# Notes:
# - Do not install Node.js with Homebrew, use nvm instead, see 
#   https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development/#nodejs
# - Some brew formulaes are installed as keg-only 🔑, which means they are not 
#   symlinked into `/usr/local`, because macOS already provides this software 
#   and installing another version in parallel can cause all kinds of trouble.
# - To see if a tool is installed as keg-only use `brew info <toolname>`, the
#   output will show you the directory you need to add to `PATH`.
# - Paths for keg-only tools installed by this script are already added to 
#   the `.path` file, which is sourced by bash and zsh config files.

# Bash —— Bourne-Again SHell, a UNIX command interpreter
brew install bash
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  # Put it on the list of system available shells (if not already there)
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
fi;

# bash-completion@2 —— Programmable completion for Bash 4.1+
brew install bash-completion@2

# Zsh —— UNIX shell (command interpreter)
brew install zsh
if ! fgrep -q "${BREW_PREFIX}/bin/zsh" /etc/shells; then
  # Put it on the list of system available shells (if not already there)
  echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells;
  # Set as default shell
  chsh -s "${BREW_PREFIX}/bin/zsh";
fi;

# coreutils —— GNU File, Shell, and Text utilities 🔑
brew install coreutils

# findutils —— Collection of GNU find, xargs, and locate 🔑
brew install findutils

# gnu-sed —— GNU implementation of the famous stream editor 🔑
brew install gnu-sed

# Wget —— Internet file retriever
brew install wget

# gnupg —— GNU Pretty Good Privacy (PGP) package
#     enables signing git commits, see https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work
brew install gnupg

# grep —— GNU grep, egrep and fgrep 🔑
brew install grep

# openssh —— OpenBSD freely-licensed SSH connectivity tools
brew install openssh

# curl —— Get a file from an HTTP, HTTPS or FTP server 🔑
brew install curl

# moreutils —— Collection of tools that nobody wrote when UNIX was young
# brew install moreutils

# vim —— Vi 'workalike' with many additional features
# brew install vim

# screen —— Terminal multiplexer with VT100/ANSI terminal emulation
# brew install screen

# php —— General-purpose scripting language
# brew install php

# gmp —— GNU multiple precision arithmetic library
# brew install gmp

###############################################################################
# Install font tools — see https://github.com/bramstein/homebrew-webfonttools
###############################################################################\

# Add bramstein/webfonttools tap
# brew tap bramstein/webfonttools

# sfnt2woff —— Convert existing TrueType/OpenType fonts to WOFF format
# brew install sfnt2woff

# sfnt2woff-zopfli —— WOFF utilities with Zopfli compression
# brew install sfnt2woff-zopfli

# woff2 —— Compress fonts with Brotli into WOFF2 format
# brew install woff2

###############################################################################
# Install some CTF tools — see https://github.com/ctfs/write-ups
###############################################################################

# aircrack-ng —— Next-generation aircrack with lots of new features
# brew install aircrack-ng

# bfg —— Remove large files or passwords from Git history like git-filter-branch
# brew install bfg

# binutils —— GNU binary tools for native development
# brew install binutils

# binwalk —— Searches a binary image for embedded files and executable code
# brew install binwalk

# cifer —— Work on automating classical cipher cracking in C
# brew install cifer

# dex2jar —— Tools to work with Android .dex and Java .class files
# brew install dex2jar

# dns2tcp —— TCP over DNS tunnel
# brew install dns2tcp

# fcrackzip —— Zip password cracker
# brew install fcrackzip

# foremost —— Console program to recover files based on their headers and footers
# brew install foremost

# hashpump —— Tool to exploit hash length extension attack
# brew install hashpump

# hydra —— Network logon cracker which supports many services
# brew install hydra

# john —— Featureful UNIX password cracker
# brew install john

# netpbm —— Image manipulation
# brew install netpbm

# nmap —— Port scanning utility for large networks
# brew install nmap

# pngcheck —— Print info and check PNG, JNG, and MNG files
# brew install pngcheck

# socat —— SOcket CAT: netcat on steroids
# brew install socat

# sqlmap —— Penetration testing for SQL injection and database servers
# brew install sqlmap

# tcpflow —— TCP flow recorder
# brew install tcpflow

# tcpreplay —— Replay saved tcpdump files at arbitrary speeds
# brew install tcpreplay

# tcptrace —— Analyze tcpdump output
# brew install tcptrace

# ucspi-tcp —— Tools for building TCP client-server applications
# brew install ucspi-tcp

# xpdf —— PDF viewer
# brew install xpdf

# xz —— General-purpose data compression with high compression ratio
# brew install xz

###############################################################################
# Install other useful binaries.
###############################################################################

# ack —— Search tool like grep, but optimized for programmers
# brew install ack

# awscli —— Official Amazon AWS command-line interface
# brew install awscli

# exiv2 —— EXIF and IPTC metadata manipulation library and tools
#brew install exiv2

# git —— Distributed revision control system
brew install git

# git-lfs —— Git extension for versioning large files
# brew install git-lfs

# imagemagick —— Tools and libraries to manipulate images in many formats
# brew install imagemagick --with-webp

# lua —— Powerful, lightweight programming language
# brew install lua

# lynx —— Text-based web browser
# brew install lynx

# p7zip —— 7-Zip (high compression file archiver) implementation
# brew install p7zip

# pigz —— Parallel gzip
# brew install pigz

# pv —— Monitor data's progress through a pipe
# brew install pv

# rename —— Perl-powered file rename script with many helpful built-ins
# brew install rename

# rlwrap —— Readline wrapper: adds readline support to tools that lack it
# brew install rlwrap

# ssh-copy-id —— Add a public key to a remote machine's authorized_keys file
# brew install ssh-copy-id

# tldr —— Simplified and community-driven man pages
brew install tldr

# trash —— CLI tool that moves files or folder to the trash
brew install trash

# tree —— Display directories as trees (with optional color/HTML output)
brew install tree

# vbindiff —— Visual Binary Diff
# brew install vbindiff

# zopfli —— New zlib (gzip, deflate) compatible compressor
# brew install zopfli

###############################################################################
# Install casks
###############################################################################

# Notes:
#   Seach casks —— `brew search <term>`
#   Usage instructions —— https://github.com/Homebrew/homebrew-cask/blob/master/USAGE.md
#   Additional taps —— https://github.com/Homebrew/homebrew-cask/blob/master/USAGE.md#additional-taps-optional

# balenaetcher —— Flash OS images to SD cards & USB drives, safely and easily.
# brew cask install balenaetcher

# docker (community edition) —— The Industry-Leading Container Runtime
# brew cask install docker

# filemaker — build custom apps
# brew cask install filemaker

# google-backup-and-sync —— Google Drive backup tool
brew cask install google-backup-and-sync

# handbreak —— tool for converting video from nearly any format to a selection of modern, widely supported codecs.
# brew cask install handbreak

# karabiner-elements —— A powerful and stable keyboard customizer for macOS.
# brew cask install karabiner-elements

# Microsoft Office
brew cask install microsoft-excel
# brew cask install microsoft-powerpoint
brew cask install microsoft-word

# numi —— calculator
brew cask install numi

# open-in-code —— open files and directories in vscode from finder
brew cask install open-in-code

# postgres —— The easiest way to get started with PostgreSQL on the Mac
# brew cask install postgres

# postico —— A Modern PostgreSQL Client for the Mac
# brew cask install postico

# postman —— The Collaboration Platform for API Development
# brew cask install postman

# private-internet-access —— vpn
brew cask install private-internet-access

# rectangle —— Move and resize windows in macOS using keyboard shortcuts or snap areas
brew cask install rectangle

# rocket —— Mind-blowing emoji on your Mac.
brew cask install rocket

# virtualbox —— virtualization manager
# brew cask install virtualbox

# visual-studio-code —— Code editing. Redefined.
brew cask install visual-studio-code

# vlc —— Media Player
brew cask install vlc

# Whatsapp
brew cask install whatsapp

# vagrant —— Development Environments Made Easy
# brew cask install vagrant

# zoomus —— Video conferencing
# brew cask install zoomus

###############################################################################
# Install casks-versions —— https://github.com/Homebrew/homebrew-cask-versions
###############################################################################

# Add tap
brew tap homebrew/cask-versions

# firefox-developer-edition
brew cask install firefox-developer-edition

# google-chrome-canary
brew cask install google-chrome-canary

###############################################################################
# Install cask-fonts —— https://github.com/Homebrew/homebrew-cask-fonts
###############################################################################

# Add tap
brew tap homebrew/cask-fonts

# font-source-code-pro
brew cask install font-source-code-pro

# font-jetbrains-mono
brew cask install font-jetbrains-mono


###############################################################################
# Apps that need to be installed manually
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
# Cleanup —— remove outdated versions from the cellar
###############################################################################

brew cleanup
