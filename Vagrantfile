VAGRANT_COMMAND = ARGV[0]

Vagrant.configure("2") do |config|
  username = "jay"
  password = "1234"

  config.vm.define "router" do |router|
    router.vm.hostname = "router"
    router.vm.box = "generic/debian11"
    router.vm.network "private_network", ip: "10.10.10.128"
    router.vm.network "private_network", ip: "10.10.20.128"
    router.vm.network "public_network", dhcp: true

    router.vm.provider "vmware" do |vm| 
      vm.name = "router"
      vm.gui = false
      vm.memory = "1028"
    end

    router.vm.provision "shell", path: "router_setup.sh"

    router.vm.provision "shell", path: "setup_user.sh", args: "#{username} #{password}"
    if VAGRANT_COMMAND == "ssh"
      router.ssh.username = username
      router.ssh.password = password
    end
  end

  config.vm.define "client1" do |client1|
    client1.vm.hostname = "client1"
    client1.vm.box = "generic/debian11"
    client1.vm.network "public_network", auto_config: false
    client1.vm.network "private_network", ip: "10.10.10.1"

    client1.vm.provider "vmware" do |vm| 
      vm.name = "client1"
      vm.gui = false
      vm.memory = "1028"
    end

    username = "#{ENV['USERNAME'] || `whoami`}"
    client1.vm.provision :shell, inline: "echo #{username} > /etc/profile.d/me"

    client1.vm.provision "shell", path: "setup_user.sh", args: "#{username} #{password}"
    if VAGRANT_COMMAND == "ssh"
      client1.ssh.username = username
      client1.ssh.password = password
    end
  end

  config.vm.define "client2" do |client2|
    client2.vm.hostname = "client2"
    client2.vm.box = "generic/debian11"
    client2.vm.network "public_network", auto_config: false
    client2.vm.network "private_network", ip: "10.10.20.1"

    client2.vm.provider "vmware" do |vm| 
      vm.name = "client2"
      vm.gui = false
      vm.memory = "1028"
    end

    username = "#{ENV['USERNAME'] || `whoami`}"
    client2.vm.provision :shell, inline: "echo #{username} > /etc/profile.d/me"
    
    client2.vm.provision "shell", path: "setup_user.sh", args: "#{username} #{password}"
    
    if VAGRANT_COMMAND == "ssh"
      client2.ssh.username = username
      client2.ssh.password = password
    end
  end
end
