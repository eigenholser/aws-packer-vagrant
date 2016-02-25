
echo "Configuring user environment."

cat >>"/home/ubuntu/.bashrc" <<EOF
export WORKON_HOME=\${HOME}/.virtualenvs
export PROJECT_HOME=/vagrant
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

EOF

source /home/ubuntu/.bashrc

su -l ubuntu -c \
    "source /usr/share/virtualenvwrapper/virtualenvwrapper.sh; mkvirtualenv --system-site-packages senior-project"

cat >>"/home/ubuntu/.bashrc" <<EOF
# Activate default virtualenv automatically
workon senior-project

EOF

chown ubuntu:ubuntu /home/ubuntu/.bashrc
