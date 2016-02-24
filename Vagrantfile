Vagrant.configure("2") do |config|
  config.vm.box = "packer-starter"

  config.vm.provider :aws do |aws, override|
    aws.access_key_id = ENV['AWS_ACCESS_KEY_ID']
    aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
    #aws.session_token = "SESSION TOKEN"
    aws.keypair_name = ENV['AWS_KEYPAIR_NAME']
    aws.instance_type = "t1.micro"
    aws.security_groups = [ "ENV['AWS_SECURITY_GROUP']" ]
    aws.region_config "ENV['AWS_REGION']", :ami => "ENV['AWS_AMI_ID']"

    override.ssh.username = "ubuntu"
    override.ssh.private_key_path = ENV['AWS_PRIVATE_KEY_PATH']
  end
end
