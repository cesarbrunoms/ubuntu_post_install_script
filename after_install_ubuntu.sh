#!/bin/bash

# Função para criar um log de erros
# Caminho para o arquivo de log
LOG_FILE="install_log.txt"

# Função para atualizar o Ubuntu
function update_ubuntu() {
    echo "Atualizando Ubuntu"
    sudo apt update 2>>"$LOG_FILE"
    sudo apt upgrade -y 2>>"$LOG_FILE"
    sudo apt full-upgrade -y 2>>"$LOG_FILE"

    # Se o comando anterior deu certo
    if [ $? -eq 0 ]; then
        echo "update_ubuntu OK!"
    else
        echo "Erro ao atualizar o Ubuntu. Tentando corrigir o erro..."
        sudo apt clean -y 2>>"$LOG_FILE"
        sudo apt autoclean -y 2>>"$LOG_FILE"
        sudo apt autoremove -y 2>>"$LOG_FILE"
        sudo dpkg --configure -a 2>>"$LOG_FILE"
        sudo apt update 2>>"$LOG_FILE"
        sudo apt upgrade -y 2>>"$LOG_FILE"
        sudo apt full-upgrade -y 2>>"$LOG_FILE" 
        echo "update_ubuntu OK!"
    fi
}
update_ubuntu

# executando a fila
function running_the_queue() {
    process=$1
    echo "Executando: $process "
    $process
}

# fila de execuções
execution_queue=(
    # install extras
    "sudo apt install -y ubuntu-restricted-extras"
    # install flatpak
    "sudo apt install flatpak -y"
    "sudo apt install gnome-software-plugin-flatpak -y"
    "flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo"
    # corrigir erro SnapStore
    "sudo killall snap-store"
    "sudo snap refresh"
    # install extras 2
    "sudo apt install -y unrar"
    "sudo apt install -y unzip"
    "sudo apt install -y p7zip"
    "sudo apt install -y ffmpeg"
    "sudo apt install -y htop"
    "sudo apt install -y ipcalc"
    "sudo apt install -y gparted"
    "sudo apt install -y neofetch"
    "sudo apt install -y gnome-tweaks"
    "sudo apt install -y zram-config"
    # install google-chrome
    "wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    "sudo dpkg -i google-chrome-stable_current_amd64.deb"
    "sudo apt-get install -f"
    # habilitando x86
    "sudo dpkg --add-architecture i386"
    "gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'"
    # install virt-manager
    "sudo apt install -y qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager"
    "sudo usermod -a -G libvirt $USER"
    # install git
    "sudo add-apt-repository ppa:git-core/ppa -y"
    "sudo apt install -y git"
    "git config --global user.email bruno.cesar@outlook.it"
    "git config --global user.name Bruno Cesar"
    # install flutter via snap
    "sudo apt install -y clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev"
    "sudo snap install flutter --classic"
    # install android-studio
    "sudo snap install android-studio --classic"
    # install vscode
    "sudo snap install code --classic"
    # install vlc via snap
    "sudo snap install vlc"
    # install spotify via snap
    "sudo snap install spotify"
)

# Iterar pela lista de execuções e rodar cada um
for process in "${execution_queue[@]}"; do
    running_the_queue "$process" 2>>"$LOG_FILE"
done

echo "Todos os processos foram executados."
