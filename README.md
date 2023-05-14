# Ubuntu Post Install Script
<details><summary>Script DTI PMA</summary>

 ~~~shell
# Baixar o script do GitHub
wget https://raw.githubusercontent.com/cesarbrunoms/ubuntu_post_install_script/main/after_install_ubuntu.sh

# Dar permissão de execução ao script baixado
chmod +x after_install_ubuntu.sh

# Executar o script baixado
bash after_install_ubuntu.sh
  
~~~  
</details>

## Preparing Flutter Environment on Ubuntu
Este repositório contém um script de pós instalação para o Linux Ubuntu 22.04 LTS.
Este script instala o básico para quem deseja um Linux Ubuntu para desenvolvimento em Flutter.
Este script foi criado para automatizar os processos de download e instalação dos pacotes (aplicativos). Com este script, basta rodá-lo e aguardar o seu término. Ao fim, tudo estará instalado existe apenas uma interação com usuario na parte de instalação das fontes microsoft.
## What will be installed?
### Development
* Git
* Flutter
* Android Studio
* VSCode
### Virtualization
* Virt-Manager
## No geral
* ubuntu-restricted-extras
* unrar unzip p7zip
* ffmpeg
* htop
* ipcalc
* gparted
* neofetch
* gnome-tweaks
* zram-config

