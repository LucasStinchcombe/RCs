# Setup for RCs

# Include gitconfig
echo -n "Updating gitconfig: "
if [ -f ~/.gitconfig ]; then
    echo "Skip"
else
    printf "[include]\n\tpath = ~/RCs/gitconfig\n" > ~/.gitconfig
    echo "Done"
fi

# Symlink vimrc
echo -n "Symlinking vimrc: "
if [ -f ~/.vimrc ]; then
    echo "Skip"
else
    ln -s ~/RCs/vimrc ~/.vimrc
    echo "Done"
fi

# Add to bashrc
echo -n "Updating vimrc: "
if [ -f ~/.vimrc ]; then
    echo "Skip"
else
    ln -s ~/RCs/vimrc ~/.vimrc
    echo "Done"
fi

# Update bashrc
echo -n "Updating bashrc: "
grep "~/RCs/bashrc" ~/.bashrc > /dev/null
if [ $? -eq 0 ]; then
    echo "Skip"
else
    printf "\n. ~/RCs/bashrc\n" >> ~/.bashrc
    echo "Done"
fi

# Install Vundle and plugins
if [ -d ~/.vim/bundle/Vundle.vim ]; then
    echo "Vundle already installed."
else
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo -n "Installing Vundle plugins: "
vim +PluginInstall +qall
echo "Done"
