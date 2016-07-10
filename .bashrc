#.bashrc file

export DOTFILEPATH=~/.dotfiles

# source private bash files if they exist
if [ -f $DOTFILEPATH/private/.private ]; then . $DOTFILEPATH/private/.private; fi

for DOTFILE in `find $DOTFILEPATH/system`
do
  [ -f "$DOTFILE" ] && source "$DOTFILE"
done

export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

echo ".bashrc complete"
