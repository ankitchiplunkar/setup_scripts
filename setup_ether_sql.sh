#!/bin/bash
#
# This script setups ether_sql along with PostgreSQL and python3.
# It was written to be used on Ubuntu 16.04.
# Technically it can work with other Ubuntu versions,
# but you might get non compatible versions some dependencies.
#
# This script is not idempotent and if it stops in the middle, you can't just run it again.
# You should either understand what parts of it to exclude or just start over on a new VM (assuming you're using a VM).

set -eu

PSQL_PASSWORD='develop'
ETHER_SQL_REPO='https://github.com/analyseether/ether_sql.git'
ETHER_SQL='ether_sql'
ETHER_SQL_VENV='venv'

install_linux_packages() {
  sudo apt-get update
  sudo apt-get -y install python-pip
  sudo apt-get -y install postgresql
}

ether_sql_setup() {
  git clone $ETHER_SQL_REPO
  cd $ETHER_SQL
  pip install virtualenv
  virtualenv -p python3 $ETHER_SQL_VENV
  source $ETHER_SQL_VENV/bin/activate
  pip install -e . -r requirements.txt
}

database_setup() {
  pip install pexpect
  
}
