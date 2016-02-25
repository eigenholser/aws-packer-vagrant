
echo "Rebasing system."
apt-get clean
apt-get dist-upgrade
apt-get update
apt-get upgrade --assume-yes --fix-broken


echo "Installing build tools."
apt-get install --assume-yes \
    build-essential curl gcc zlib1g-dev libffi-dev libssl-dev

