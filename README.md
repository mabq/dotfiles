# Dotfiles

Based on [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles) and [Tanias’s article](https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development/).


## 1. Getting Started
   
After initial installation check for updates to get the latest security updates and patches.


## 2. Homebrew

Install [Homebrew](https://brew.sh/) (will also install macos command-line tools which will take some time).

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```


## 3. Dotfiles

Clone the repo into the `~/Projects` folder and run the `bootstrap.sh` script
to copy the dotfiles into the home directory.

```bash
cd ~ && mkdir "Projects"
cd ~/Projects && git clone https://github.com/mabq/dotfiles.git && source dotfiles/bootstrap.sh
```

To update (the script will pull from the remote repo, so make sure you push any changes first):
```bash
set -- -f; cd ~/Projects/dotfiles && source bootstrap.sh
```


## 4. Install Command-line Tools and Apps

Run the `brew.sh` script:

```bash
cd ~ && ./brew.sh
```

Apply Snazzy theme manually (inside the `~/init` directory).


## 5. Node.js

### 5.1 Install
Use [Node Version Manager (nvm)](https://github.com/nvm-sh/nvm/blob/master/README.md) 
to install Node.js. This allows you to easily switch between Node versions, which is essential.

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
```

Install the latest version:

```bash
nvm install node
```

Restart terminal and run the final command:

```bash
nvm use node
```

Confirm that you are using the latest version of Node and npm:

```bash
node -v
npm -v
```

### 5.2 Update

For later, here's how to update nvm.

```bash
nvm install node --reinstall-packages-from=node
```

### 5.3 Change version

Here's how to switch to another version and use it:

```bash
nvm install xx.xx
nvm use xx.xx
```

And to set the default:

```bash
nvm alias default xx.xx
```


## 6. SSH keys
Follow the instructions on [Connecting to GitHub with SSH](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh).


## 7. Apply sensible macOS defaults

Run the script `.macos` and re-start:

```bash
cd ~ && ./.macos
```

