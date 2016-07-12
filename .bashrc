#.bashrc file

export DOTFILEPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# source private bash files if they exist
if [ -f $DOTFILEPATH/private/.private ]; then . $DOTFILEPATH/private/.private; fi

for DOTFILE in `find $DOTFILEPATH/system`
do
  [ -f "$DOTFILE" ] && source "$DOTFILE"
done

echo ".bashrc complete.."
