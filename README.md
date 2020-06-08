# Manu's dotfiles

This repo is a modified version of [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles).

Follow these instructions when setting up a new Mac (modified version of [Tanias’s article](https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development/)):

## 1. Getting Started
The first thing you should do is update macOS to get the latest security updates and patches.

## 2. Homebrew
Install [Homebrew](https://brew.sh/) — will also install macos command-line tools (it will take some time).

```bash
# once installed, make sure everything is up to date.
brew update
```

## 3. Dotfiles
To install:

```bash
# Make sure the `Projects` directory exist in the home folder
cd ~ && mkdir "Projects"

# Clone the repo and execute the bootstrap shell script
cd ~/Projects && clone https://github.com/mabq/dotfiles.git && cd dotfiles && source bootstrap.sh
# ...now the dotfiles should be in your home directory
```

To update (if any changes are made you should push them to the remote repo first):
```bash
# The bootstrap script will pull the latest changes from the remote repo
cd ~/Projects/dotfiles && source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:
```bash
set -- -f; cd ~/Projects/dotfiles && source bootstrap.sh
```

### 3.1. Install Homebrew formulae and casks
```bash
cd ~ && ./brew.sh
```

### 3.2. Apply sensible macOS defaults
```bash
cd ~ && ./.macos
```

## 4. SSH keys
Now that `git` is installed, follow the instructions on [Connecting to GitHub with SSH](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh).

## 5. Install node


### 5.1 Install global packages

