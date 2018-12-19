VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.hostname = "node-mongo"

  # config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 3000, host: 8031
  config.vm.network "forwarded_port", guest: 80, host: 8030
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.network "private_network",  ip: "10.10.30.30"
  # config.vm.network "public_network"

  config.ssh.forward_agent = true # Default: false

  # config.vm.synced_folder "../data", "/vagrant_data"
  # config.vm.synced_folder "../data", "/vagrant-data", type: "nfs"

  config.vm.provider "virtualbox" do |v|
    v.name = "node-mongo"
  end

  config.vm.provision :shell, path: "./scripts/provision-node-mongo.sh"
  # config.vm.provision :shell, path: "./scripts/start_microsites3.sh", run: "always", privileged: false
end

