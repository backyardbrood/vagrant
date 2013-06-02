Vagrant::configure("2") do |config|
  config.vm.box = "backyard-brood-dev"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.hostname = "backyardbrood.dev"

  config.vm.provider :virtualbox do |vb|
    vb.name = "backyard-brood-dev"
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  config.ssh.forward_agent = true

  config.vm.network :forwarded_port, guest: 80, host: 8080 #http
  config.vm.network :forwarded_port, guest: 443, host: 4443 #https
  config.vm.network :forwarded_port, guest: 3306, host: 3306 #mysql

  config.vm.network :private_network, ip: "10.1.0.3"

  config.vm.synced_folder "code", "/virtualhosts", :nfs => true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe("openssl")
    chef.add_recipe("mysql::server")
    chef.add_recipe("mysql::client")
    chef.add_recipe("apache2")
    chef.add_recipe("apache2::mod_rewrite")
    chef.add_recipe("php")
    chef.add_recipe("op")

    chef.json = {
        "mysql" => {
            'server_debian_password' => '',
            'server_root_password' => '',
            'server_repl_password' => ''
        },
        "php" => {
            "packages" => ['php5', 'php5-cli', 'php-pear', 'php5-dev', 'php5-curl', 'php5-xdebug'],
            "directives" => {
                "date.timezone" => "America/Los_Angeles"
            }
        }
    }
  end
end
