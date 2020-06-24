#!/usr/bin/env bash

## Removendo travas eventuais do apt ##

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Atualizando o repositório ##

sudo apt update -y

## Adicionando repositórios de terceiros (Papirus-Icon Theme) ##

sudo add-apt-repository ppa:papirus/papirus-dev -y

## Atualizando o repositório depois da adição de novos repositórios ##

sudo apt update -y

## Download e instalaçao de programas externos ##

mkdir /home/$USER/Downloads/programas
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /home/$USER/Downloads/programas

## Instalando pacotes externos ##

sudo dpkg -i /home/$USER/Downloads/programas/*.ded

## Instalando programas no apt ##

sudo apt install beignet-dev deluge gnome-tweaks gparted gnome-sushi nautilus-admin papirus-icon-theme stacer synaptic stacer ubuntu-restricted-extras -y

## Instalando pacotes Flatpak ##

flatpak update

flatpak install flathub io.atom.Atom -y ##ATOM##
flatpak install flathub com.github.bilelmoussaoui.Authenticator -y ##AUTHENTICATOR## 
flatpak install flathub org.blender.Blender -y ##BLENDER##
flatpak install flathub com.bitwarden.desktop -y ##BITWARDEN##
flatpak install flathub com.calibre_ebook.calibre -y ##CALIBRE##
flatpak install flathub com.github.johnfactotum.Foliate -y ##FOLIATE##
flatpak install flathub com.github.tchx84.Flatseal -y ##FLATSEAL##
flatpak install flathub com.axosoft.GitKraken -y ##GITKRAKEN##
flatpak install flathub org.libreoffice.LibreOffice  -y ##LIBREOFFICE##
flatpak install flathub net.codeindustry.MasterPDFEditor -y ##MASTERPDF##
flatpak install flathub com.jetbrains.PyCharm-Community -y ##PYCHARM##
flatpak install flathub org.signal.Signal -y ##SIGNAL##
flatpak install flathub com.spotify.Client -y ##SPOTIFY##
flatpak install flathub org.gnome.Shotwell -y ##SHOTWELL##
flatpak install flathub org.mozilla.Thunderbird -y ##THUNDERBIRD##
flatpak install flathub org.telegram.desktop -y ##TELEGRAM##
flatpak install flathub com.visualstudio.code -y ##VSCODE##
flatpak install flathub com.vscodium.codium -y ##VSCODIUM##
flatpak install flathub org.videolan.VLC -y ##VLC##

## Removendo LibreOffice e Firefox (.deb)##

sudo apt-get remove libreoffice* -y
sudo apt-get remove geary* -y

## Corrigindo possíveis pacotes quebrados ##

sudo apt --fix-broken install

## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y

echo "Lembre-se de instalar o Anki, o Stremio, e o Simplenote, e de criar os webapps do YoutubeMusic, Instagram, Whatsapp, Twitter, Notion e Pinterest."

