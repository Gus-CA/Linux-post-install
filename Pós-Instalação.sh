#!/bin/bash

## Removendo travas eventuais do apt ##

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Atualizando o repositório ##

sudo apt update -y

## Adicionando repositórios de terceiros e suporte a Snap (Papirus-Icon Theme e Caffeine) ##

sudo add-apt-repository ppa:papirus/papirus-dev -y
sudo apt install snapd -y

## Atualizando o repositório depois da adição de novos repositórios ##

sudo apt update -y

## Download e instalaçao de programas externos ##

mkdir Downloads/programas
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P Downloads/programas
wget -c https://dl.strem.io/linux/v4.4.106/stremio_4.4.106-1_amd64.deb -P Downloads/programas
wget -c https://github.com/ankitects/anki/releases/download/2.1.26/anki-2.1.26-linux-amd64.tar.bz2 -P Downloads/programas

## Instalando pacotes externos ##

sudo dpkg -i Downloads/programas/*.deb
tar xjf Downloads/anki-2.1.26-linux-amd64.tar.bz2
cd Downloads/anki-2.1.26-linux-amd64
sudo make install
cd

## Instalando programas no apt ##

sudo apt install caffeine deluge gnome-tweaks papirus-icon-theme shotwell synaptic stacer thunderbird ubuntu-restricted-extras -y

## Removendo LibreOffice (para instalar em Flatpak), Firefox e Geary ##

sudo apt-get remove libreoffice* -y
sudo apt-get remove firefox* -y
sudo apt-get remove geary* -y

## Corrigindo possíveis pacotes quebrados ##

sudo apt --fix-broken install

## Instalando pacotes Flatpak ##

flatpak install flathub io.atom.Atom 
flatpak install flathub com.github.bilelmoussaoui.Authenticator
flatpak install flathub com.calibre_ebook.calibre
flatpak install flathub com.github.johnfactotum.Foliate
flatpak install flathub fr.handbrake.ghb 
flatpak install flathub org.kde.kdenlive
flatpak install flathub org.libreoffice.LibreOffice
flatpak install flathub net.codeindustry.MasterPDFEditor
flatpak install flathub org.signal.Signal
flatpak install flathub org.videolan.VLC

## Instalndo pacotes Snap ##

sudo snap install bitwarden 
sudo snap install blender --classic 
sudo snap install code --classic
sudo snap install noted
sudo snap install pycharm-community --classic
sudo snap install simplenote
sudo snap install spotify
sudo snap install sublime-text --classic
sudo snap install telegram-desktop

## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y

