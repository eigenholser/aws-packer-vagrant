
echo "Rebasing system."
apt-get clean
apt-get update

echo "Installing build tools."
apt-get install --assume-yes \
    build-essential curl gcc libc6-dev zlib1g-dev libffi-dev libssl-dev
