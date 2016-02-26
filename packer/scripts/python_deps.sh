
# Install latest pip. Will also grab setuptools.
echo "Installing pip."
wget https://bootstrap.pypa.io/get-pip.py -O - | python

echo "Installing deps for ssl and urllib3."
# The system requests is old!
apt-get remove --assume-yes python-requests

pip install requests
pip install pyopenssl
pip install ndg-httpsclient
pip install pyasn1
pip install virtualenvwrapper

