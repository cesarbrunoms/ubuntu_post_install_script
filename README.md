# Ubuntu Post Install Script
<details><summary>Script</summary>

 ~~~shell
# Download script from GitHub
wget https://raw.githubusercontent.com/cesarbrunoms/ubuntu_post_install_script/main/after_install_ubuntu.sh

# Execute permission script
chmod +x after_install_ubuntu.sh

# Run script
bash after_install_ubuntu.sh
  
~~~  
</details>

## Description
This is Ubuntu post installation script.<br/>
This prepares the Flutter environment in Ubuntu.<br/>
This script generates a queue of executions, which are accompanied by a log file in case something goes wrong in the log file.<br/>
So far it has not been possible to automate the installation part of the Microsoft fonts, unfortunately requiring user interaction.<br/>
### What will be installed?
* ubuntu-restricted-extras
* unrar unzip p7zip
* HTOP
* IPCalc
* GParted
* Neofetch
* Gnome-Tweaks
* ZRAM-Config
* enable flatpak
### Development
* Git
* Flutter
* Android Studio
* VSCode
### Virtualization
* Virt-Manager
### Internet
* Google Chrome
### Audio & Video
* FFmpeg
* Spotify
* VLC


