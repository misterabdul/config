#!/usr/bin/env bash

# keys {{{1

sudo mkdir /mnt/usb
sudo mount -L KEYS /mnt/usb

cp -r /mnt/usb/ssh ~/.ssh
chmod 700 ~/.ssh
chmod 644 ~/.ssh/id_ed25519.pub
chmod 600 ~/.ssh/id_ed25519

sudo umount /mnt/usb
sudo rmdir /mnt/usb


# clone repo {{{1

while [[ ! -d "~/config" ]]; do
	hub clone cjbassi/config
done


# Directories {{{1

mkdir -p \
	~/Downloads \
	~/Drive \
	~/projects/{mine,other} \
	$XDG_CONFIG_HOME


# AUR {{{1

yay \
	rofi-dmenu \

yay \
	evscript-git \
	ncurses5-compat-libs \
	nerd-fonts-complete \
	network-manager-applet-indicator \
	raven-reader-bin \
	swaylock-blur-bin \
	teiler-git \
	texlive-latexindent-meta \
	tmpreaper \
	udiskie-dmenu-git \


# package managers {{{1

pipx install colour-valgrind
pipx install --spec git+https://github.com/cjbassi/rofi-power rofi-power
pipx install --spec git+https://github.com/cjbassi/rofi-copyq rofi-copyq
pipx install --spec git+https://github.com/cjbassi/rofi-files rofi-files

yarn global add \
	typesync

trust_install_url="https://raw.githubusercontent.com/japaric/trust/c268696ab9f054e1092f195dddeead2420c04261/install.sh"
function trust-download {
	bash <(curl $trust_install_url) -f --git "$@"
}
trust-download cjbassi/batch-rename
trust-download cjbassi/license-gen
trust-download cjbassi/sway-utils
trust-download cjbassi/trash-cli

# TODO
# cargo-tree


# systemd {{{1

systemctl --user enable \
	evscript \
	insync \
	swayidle \
	variety

sudo systemctl enable \
	lockscreen-on-suspend@$USER \
	reload-settings-on-wake@$USER \
	\
	opensnitchd

# Cleanup {{{1

rm -f .bash_logout .bash_profile .bashrc install3.sh
