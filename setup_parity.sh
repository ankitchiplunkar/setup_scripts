verify_root() {
    # Verify running as root:
    if [ "$(id -u)" != "0" ]; then
        if [ $# -ne 0 ]; then
            echo "Failed running with sudo. Exiting." 1>&2
            exit 1
        fi
        echo "This script must be run as root. Trying to run with sudo."
        sudo bash "$0" --with-sudo
        exit 0
    fi
}

ubuntu_dependencies() {
  apt-get update
  apt-get -y install python-pip
  apt-get -y install supervisor
}

python_dependencies() {
  pip install virtualenv
}

install_parity() {
  bash <(curl https://get.parity.io -Lk) -r stable
}

setup_supervisor() {
    mkdir /opt/parity
    cp ./files/supervisord.conf /etc/supervisor/conf.d/parity.conf 
    service supervisor restart
}

verify_root
ubuntu_dependencies
python_dependencies
install_parity
setup_supervisor
