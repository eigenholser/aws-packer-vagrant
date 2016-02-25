
# Install latest pip. Will also grab setuptools.
echo "Installing pip."
wget https://bootstrap.pypa.io/git-pip.py -O - | python

echo "Installing deps for ssl and urllib3."
pip install pyopenssl ndg-httpsclient pyasn1
