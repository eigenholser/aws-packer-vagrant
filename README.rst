===========================
AWS EC2 with Vagrant/Packer
===========================

The contents of this repository contain artifacts that will demonstrate how to
use Packer to build an AWS EC2 AMI and Vagrant to control it. There is a
Packer build template, a ``Vagrantfile``, and a dummy box for AWS.

--------------------------
Install Packer and Vagrant
--------------------------

Install `Packer <https://www.packer.io/downloads.html>`_ and
`Vagrant <https://www.vagrantup.com/downloads.html>`_. Then install the
`Vagrant AWS Provider <https://github.com/mitchellh/vagrant-aws>`_.

-------------
Configuration
-------------
The Packer build template and ``Vagrantfile`` depend on several environment
variables. The most important of these is the AWS Access Key ID and Secret
Access Key. Do not ever ever commit those two values to your repository. They
should be set somewhere outside of your repository or from a file that is
``git`` ignored. Personally I'd opt for the former. Set them like this::

    export AWS_ACCESS_KEY_ID="<redacted>"
    export AWS_SECRET_ACCESS_KEY="<redacted>"

Packer will look for those environment variables during the build. The included
``Vagrantfile`` also references them.

See the `AWS IAM documentation <http://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html>`_ for best practices.

The Packer build template depends on two environment variables that must be
set or provided on the command line. They specify the AWS region and AMI ID.
Set these environment variables as needed. The following settings work at the
time of this commit::

    export AWS_REGION="us-east-1"
    export AWS_SOURCE_AMI="ami-7b386c11"

To do this, just source ``set_build_envs.sh``::

    source set_build_envs.sh

Or use the Bourne shell equivalent ``. set_build_envs.sh``.

To unset these environment variables::

    source unset_build_envs.sh

The ``Vagrantfile`` depends on several environment variables that are required
to start your AWS EC2 instance::

    export AWS_PRIVATE_KEY_PATH="<full path to username.pem>"
    export AWS_AMI_ID="<ami id from packer build>"
    export AWS_REGION="<aws region you are using>"
    export AWS_SECURITY_GROUP="<the security group you created>"
    export AWS_KEYPAIR_NAME="<the keypair name you want to use>"

These are not necessarily sensitive. But don't commit them to your repository.
I suggest setting them externally.

----------
Invocation
----------

To invoke the Packer build::

    packer build packer-quick-start.json

When the build is complete, Packer will output the AWS region and AMI ID. You
will need that for Vagrant. Save the information and initialize the environment
variables as described above.

Build the Vagrant box `as described <https://github.com/eigenholser/aws-packer-vagrant/tree/master/vagrant_box>`_. Then add it::

    vagrant box add packer-starter vagrant_box/aws.box

Then invoke Vagrant::

    vagrant up

Once Vagrant has spun up your EC2 instance you may just::

    vagrant ssh

to get a shell on the box.

Shut down the Vagrant box when done to avoid AWS charges::

    vagrant halt

-----
Notes
-----

This is totally bare bones right now. I'll work on adding some provisioning
to make this actually useful. Since right now you're probably wondering why
go to all this trouble to spin up a box when I can just use the AWS Console.

