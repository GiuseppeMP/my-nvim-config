# Fresh Install My Neovim Configuration on Debian/Ubuntu distro

## Pending

- [ ] ..

## Building tools, package and runtime managers

```sh
# install building tools
# sudo apt-get install build-essential procps curl file git xdg-utils
TODO: macos

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

exec zsh && brew

# install asdf runtime manager

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

# add asdf to zsh
echo ". \"$HOME/.asdf/asdf.sh\"" >> ~/.zshrc
echo ". \"$HOME/.asdf/asdf.sh\"" >> ~/.bashrc
# add autocompletion
echo "fpath=(\${ASDF_DIR}/completions \$fpath)" >> ~/.zshrc
echo "autoload -Uz compinit && compinit" >> ~/.zshrc

echo "fpath=(\${ASDF_DIR}/completions \$fpath)" >> ~/.bashrc
echo "autoload -Uz compinit && compinit" >> ~/.bashrc
# refresh zsh
exec zsh

```

## NerdFonts

```sh
git clone --depth 1 git@github.com:ryanoasis/nerd-fonts.git /tmp/nerd-fonts
chmod +x /tmp/nerd-fonts/install.sh && /tmp/nerd-fonts/install.sh
```
Recommended font: **Inconsolata LGC Nerd Font**

Why: Ligtures are fancy but decreases my performance/velocity to read/understand complex code due the different combinations of operators in complex stuffs.(leetcoding, datasets, math, llms, etc). A small example of this is not noting the difference between ==> or => during code review.

Slashed zero, takes inspiration from many different fonts and glyphs, subtle curves in lowercase.

## Python

```sh
# add asdf plugin for python mgnt
asdf plugin-add python
# install python debian pre-reqs
# sudo apt install libedit-dev libssl-dev zlib1g zlib1g-dev libssl-dev libbz2-dev libsqlite3-dev libreadline-dev liblzma-dev tk-dev

brew install xz
brew install openssl


# If you're facing building issues please take a look: https://github.com/pyenv/pyenv/wiki/Common-build-problems
# install python3 and python2.
asdf install python 3.12.5
asdf install python 2.7.18
# set global python3 and python2
asdf global python 3.12.5 2.7.18
# check
python2 --version
python3 --version
python --version

```

## NodeJS and Deno 

```sh
# add asdf nodejs plugin
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git

# install latest-available lts version
asdf install nodejs $(asdf nodejs resolve lts --latest-available)
asdf global nodejs $(asdf nodejs resolve lts --latest-available)

#check
node -v
npm -v

# install yarn
npm i -g npm yarn
npm i -g tslib
npm i -g @chemzqm/neovim
npm i -g log4js
npm i -g msgpack-lite
npm i -g socket.io

# add asdf deno plugin
asdf plugin-add deno https://github.com/asdf-community/asdf-deno.git

# install latest deno version
asdf install deno $(asdf list all deno | tail -1)
asdf global deno $(asdf list all deno | tail -1)

#check
deno -v

# refresh zsh/asdf reshim
exec zsh
```

## Neovim

```
brew install neovim
neovim -v
```

## Neovim Dependencies 

```sh
brew install ripgrep
brew install fd
brew install safe-rm
brew install gnu-sed
brew install fzf
brew install ccls
brew install pillow
brew install gpg
echo "source <(fzf --zsh)" >> ~/.zshrc
```

## Github CLI

```sh
brew install gh
gh auth login # follow instructions
```

## Clone my config into ~/.config/nvim

```sh
mkdir -p ~/.config/nvim && git clone https://github.com/GiuseppeMP/my-nvim-config.git ~/.config/nvim

# open nvim first time with the new config. (build, treesitter, etc)
nvim
```

## Codeium Auth

Inside neovim run `:Codeium Auth` and follow the instructions.

Recommended: Save your token in `~/.codeium/config.json` following the structure:
```json
{"apiKey": "your-token-here"}
```

## ChatGPT

1. Go to https://platform.openai.com/docs/overview and login with your credentials.
2. Navigate to: https://platform.openai.com/settings/profile?tab=api-keys
3. Create a new secret Key.
4. Copy your key and save it in `~/.config/secrets/open_ai_key.txt`
5. Create a gpg key with your email using `gpg --full-generate-key`
6. Run gpg --encrypt -r youremailhere@nice.com open_ai_key.txt
7. Delete open_ai_key.txt `rm open_ai_key.txt`


## LazyGit

```sh
brew install jesseduffield/lazygit/lazygit && brew install lazygit
```

## Zoxyde

```sh
brew install zoxide
echo "eval \"\$(zoxide init zsh)\"" >> ~/.zshrc
```

## Golang

```sh
# install the latest stable version of Golang.
asdf plugin-add golang https://github.com/asdf-community/asdf-golang.git

asdf install golang $(asdf list all golang | grep -E '^[0-9.]+$' | tail -1)
asdf global golang $(asdf list all golang | grep -E '^[0-9.]+$' | tail -1)

# check version
go version
```

## Java

```sh
asdf plugin-add java https://github.com/halcyon/asdf-java.git

## latest java 8 (corretto)
asdf install java $(asdf list all java | grep corretto-8 | tail -1)
echo "export JAVA_8=\$HOME/.asdf/installs/java/\$(asdf list all java | grep corretto-8 | tail -1)"  >> ~/.zshrc

## latest java 11 (corretto)
asdf install java $(asdf list all java | grep corretto-11 | tail -1)
 echo "export JAVA_11=\$HOME/.asdf/installs/java/\$(asdf list all java | grep corretto-11 | tail -1)" >> ~/.zshrc

## latest java 14 (zulu)
asdf install java $(asdf list all java | grep zulu-14 | tail -1)
echo "export JAVA_14=\$HOME/.asdf/installs/java/\$(asdf list all java | grep zulu-14 | tail -1)"  >> ~/.zshrc

## latest graalvm with java 17 (graalvm)
asdf install java $(asdf list all java | grep '^graalvm-.*java17$' | tail -1)
echo "export JAVA_17=\$HOME/.asdf/installs/java/\$(asdf list all java | grep '^graalvm-.*java17$' | tail -1)"  >> ~/.zshrc


## latest graalvm with java 19 (graalvm)
asdf install java $(asdf list all java | grep '^graalvm-.*java19$' | tail -1)
echo "export JAVA_19=\$HOME/.asdf/installs/java/\$(asdf list all java | grep '^graalvm-.*java19$' | tail -1)"  >> ~/.zshrc


## latest graalvm-community for java 21 (graalvm)
asdf install java $(asdf list all java | grep graalvm-community-21 | tail -1)
echo "export JAVA_21=\$HOME/.asdf/installs/java/\$(asdf list all java | grep graalvm-community-21 | tail -1)"  >> ~/.zshrc

## set JDK 21 as global
asdf global java $(asdf list all java | grep graalvm-community-21 | tail -1)
echo ". ~/.asdf/plugins/java/set-java-home.zsh" >> ~/.zshrc

## check
java --version
```

## Gradle

```sh
brew install gradle
gradle -v
```

## Maven

```sh
brew install maven
mvn -v
```
