### Setting a new computer
#### Install iterm2 and brew
install iterm2 from https://iterm2.com/ 
install brew from https://brew.sh/

#### Use brew to install packages
```sh
brew install zsh
brew install --cask sublime-text
brew install --cask google-chrome
brew install --cask brave-browser
brew install --cask visual-studio-code
brew install --cask miniforge
brew install --cask commander-one
brew install --cask dbeaver-community
brew install --cask google-chrome

brew install neovim
brew install htop

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```




I use zsh, https://github.com/ohmyzsh/ohmyzsh and https://github.com/romkatv/powerlevel10k

#### on centos
```shell
# from https://www.howtoforge.com/tutorial/how-to-setup-zsh-and-oh-my-zsh-on-linux/
sudo dnf install zsh

# change the default shell
chsh -s /bin/zsh

# installing ohmyzsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# installing powerlevel10k git prompt
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc
```
On first use, powerlevel10k starts a wizard to finetune the shell prompt settings. 
