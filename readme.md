# My dotfiles...

This is a repo of my personal dot files. Except my .private keys.

This [guide](https://dotfiles.github.io) really helped as did [this](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789#.qmgph96y5)

The slides in this presentation are also interesting [A storm Homebrewin'](https://speakerdeck.com/anahkiasen/a-storm-homebrewin)

## To install
Clone repo
``` bash
git clone https://github.com/danward79/.dotfiles.git && cd .dotfiles
```
then ...
``` bash
./install.sh
```

Install will check for [Homebrew](https://brew.sh) and also for the "tap" [homebrew/bundle](https://github.com/Homebrew/homebrew-bundle) and "brew" [Mackup](https://github.com/lra/mackup), installing if any are not found.

This process means that all the applications listed in the brewfile as "cask" items will be installed, together with the various "brew" items and a the font inconsolata. Finally the command mackup restore, will restore the settings from previous installs, saved in dropbox (in my case).

Private/Secret keys are stored in the .private file in the private file. These are managed by mackup, which uses a custom .cfg file to save the relevant file with other dotfiles, that it manages.
