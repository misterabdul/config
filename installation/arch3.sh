rm -f arch3.sh

# Directories
mkdir -p Downloads
mkdir -p .ssh
mkdir -p .config
mkdir -p ~/.config/nvim/{backup,undo,swap}

# ssh keys
sudo mount -L KEYS /mnt/usb
cp /mnt/usb/ssh/* /home/cjbassi/.ssh/
chmod 700 /home/cjbassi/.ssh
chmod 600 /home/cjbassi/.ssh/id_ed25519
chmod 644 /home/cjbassi/.ssh/id_ed25519.pub

git clone git@github.com:cjbassi/config

################################################################################
# Symlinks

ln -sf ~/config/devilspie ~/.devilspie

ln -sf ~/config/dotfiles/.* ~/

ln -sf ~/config/i3 ~/.config/i3

sudo ln -sf ~/config/i3lock/suspend@.service /etc/systemd/system/

ln -sf ~/config/nvim/* ~/.config/nvim/

sudo ln -sf ~/config/peripherals/50-mouse.conf /etc/X11/xorg.conf.d/

ln -sf ~/config/polybar ~/.config/polybar

mkdir -p ~/.config/ranger
ln -sf ~/config/ranger/* ~/.config/ranger/
ranger --copy-config=scope

ln -sf ~/config/rofi ~/.config/rofi

ln -sf ~/config/termite  ~/.config/termite

################################################################################

sudo systemctl enable suspend@cjbassi

# vim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

################################################################################

cd Downloads
git clone https://github.com/rkitover/vimpager
cd vimpager
sudo make install
cd ..
rm -rf vimpager
cd ~

cd Downloads
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts
cd ~

################################################################################

sudo pip install glances
sudo npm install -g livedown

################################################################################

bash ~/config/installation/pacaur.sh

export EDITOR=nvim
gpg --recv-keys 5FAF0A6EE7371805

pacaur -S discord
pacaur -S dropbox
pacaur -S google-chrome
pacaur -S neofetch
pacaur -S neomutt
pacaur -S unclutter-xfixes-git
pacaur -S universal-ctags-git
pacaur -S zsh-fast-syntax-highlighting-git

pacaur -S i3-gaps
pacaur -S i3ipc-glib-git
pacaur -S i3lock-color-git
    
pacaur -S gitflow-avh
pacaur -S gitflow-zshcompletion-avh

pacaur -S polybar-git

################################################################################

echo "
###########################################
1) :PlugInstall
2) Configure pavucontrol
###########################################
"

#fonts
    #noto-fonts-emoji
    #ttf-symbola
    #ttf-font-awesome
    #awesome-terminal-fonts
    #fonts on bar
