#!/usr/bin/env bash
echo "Install .files"

#Determine install/dotfiles folder
export DOTFILEPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo ".file Path: $DOTFILEPATH"

#Private Key file creation
echo ".private creation"
if [ ! -e $DOTFILEPATH/private ]; then
  echo "creating private folder"
  mkdir private
else
  echo "private folder already exists"
fi

if [ ! -e $DOTFILEPATH/private/.private ]; then
  echo "creating .private"
  echo "#.private keys" > $DOTFILEPATH/private/.private
  echo "#Place your private exports / env variables here" >> $DOTFILEPATH/private/.private
  echo 'echo ".private complete"' >> $DOTFILEPATH/private/.private
else
  echo ".private file already exists"
fi

#Backup existing files
echo "Create backup of existing .files"
BACKUPPATH=$DOTFILEPATH/backups/$(date "+%Y%m%d%H%M")
mkdir -p $BACKUPPATH

if [ -f ~/.bash_profile ]; then
  mv ~/.bash_profile $BACKUPPATH/.bash_profile.bac
else
  echo "No existing .bash_profile"
fi

#Symlink to new dotfiles.
echo "Symlink to new files"
ln -sfv "$DOTFILEPATH/.bash_profile" ~
ln -sfv "$DOTFILEPATH/.mackup.cfg" ~
ln -sfv "$DOTFILEPATH/.mackup" ~

# Check for Homebrew and install if not found
if test ! $(which brew); then
  echo "brew not found - Installing ..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install brew bundle & packages including dropbox etc
if test ! $(brew tap | grep "homebrew/bundle"); then
  echo "homebrew/bundle not found - installing ..."
  brew tap homebrew/bundle
  brew bundle
fi

# restore app settings. Needs dropbox installed.
if test ! $(brew list | grep "mackup"); then
  echo "mackup not found - installing ..."
  brew install mackup
  mackup restore
fi

# Set mack preferences
echo "Setting macos preferences"
source "$DOTFILEPATH/.macos"

# Finally reload the shell
echo "Install complete...."
echo "Reloading shell"
exec $SHELL -l
