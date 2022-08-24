#!/bin/bash

method=1

clear
echo "Which method do you want to use to install Spotify? 1 - Apt Package Manager, 2 - Snap Store (Default=1): "
read method

if [$method == 1]; then
  echo "Installing Spotify using Apt Package Manager..."
  sleep 3
  curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo gpg --dearmour -o /usr/share/keyrings/spotify.gpg
  echo "deb [signed-by=/usr/share/keyrings/spotify.gpg arch=amd64] http://repository.spotify.com stable non-free"| sudo tee /etc/apt/sources.list.d/spotify.list
  sudo apt update
  sudo apt install spotify-client -y
elif [$method == 2]; then
  echo "Installing Spotify using Snap Store..."
  sleep 3
  sudo snap install spotify
else
  echo "Specify 1 or 2 in the command prompt!"
  echo "Restarting the script.."
  sleep 3
  $SHELL ./install.sh
fi
