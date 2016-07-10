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

echo "Install complete...."
