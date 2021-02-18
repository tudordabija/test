Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"

  config.vm.define "web1" do |web1|
    web1.vm.network "private_network", ip: "172.17.177.11"
    web1.vm.network "forwarded_port", guest: 80, host: 8081, auto_correct: true
    web1.vm.hostname = 'web1'
    web1.vm.provision :ansible_local do |ansible|
      ansible.playbook       = "src/web.yml"
      ansible.verbose        = true
      ansible.install        = true
      ansible.become		 = true
    end
  end

  config.vm.define "web2" do |web2|
    web2.vm.network "private_network", ip: "172.17.177.12"
    web2.vm.network "forwarded_port", guest: 80, host: 8082, auto_correct: true
    web2.vm.hostname = 'web2'
    web2.vm.provision :ansible_local do |ansible|
      ansible.playbook       = "src/web.yml"
      ansible.verbose        = true
      ansible.install        = true
      ansible.become		 = true
    end
  end
end

