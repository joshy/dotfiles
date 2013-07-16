echo "Backing up old emacs config"
cp ~/.emacs ~/.emacs-$(date '+%Y-%m-%d')

cp .emacs ~/.emacs
echo "Done. Have fun with the latest emacs configuration!"
