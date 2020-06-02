#!/usr/bin/env bash

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

mkdir /home/gustavoca/Downloads/programas
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /home/gustavoca/Downloads/programas

## Instalando pacotes externos ##

sudo dpkg -i /home/gustavoca/Downloads/programas/*.ded

## Instalando programas no apt ##

sudo apt install deluge gnome-tweaks gparted papirus-icon-theme shotwell stacer synaptic stacer thunderbird ubuntu-restricted-extras -y

## Instalando pacotes Flatpak ##

flatpak install flathub io.atom.Atom -y
flatpak install flathub com.github.bilelmoussaoui.Authenticator  -y
flatpak install flathub com.calibre_ebook.calibre -y
flatpak install flathub com.github.johnfactotum.Foliate -y
flatpak install flathub com.github.tchx84.Flatseal -y
flatpak install flathub fr.handbrake.ghb -y
flatpak install flathub org.libreoffice.LibreOffice  -y
flatpak install flathub net.codeindustry.MasterPDFEditor -y
flatpak install flathub org.signal.Signal -y
flatpak install flathub org.videolan.VLC -y

## Instalndo pacotes Snap ##

sudo snap install bitwarden 
sudo snap install blender --classic 
sudo snap install code --classic
sudo snap install gitkraken --classic
sudo snap install pycharm-community --classic
sudo snap install simplenote
sudo snap install spotify
sudo snap install sublime-text --classic
sudo snap install telegram-desktop

## Removendo LibreOffice (para instalar em Flatpak), Firefox e Geary ##

sudo apt-get remove libreoffice* -y
sudo apt-get remove firefox* -y
sudo apt-get remove geary* -y

## Corrigindo possíveis pacotes quebrados ##

sudo apt --fix-broken install

## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y

echo "Lembre-se de instalar o Anki, Stremio, e de criar os webapps do YoutubeMusic, Instagram, Whatsapp, Twitter, Notion e Pinterest."

