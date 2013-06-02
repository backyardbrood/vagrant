include_recipe "apt"

package "git" do
  action :install
end

if platform_family?("rhel")
  bin_dir = "/usr/bin"
else
  bin_dir = "/usr/local/bin"
end

remote_file "composer" do
  action :create_if_missing
  source "http://getcomposer.org/composer.phar"
  mode "0777"
  path bin_dir + "/composer"
end

cookbook_file "php-config-timezone" do
  source "php/conf.d/timezone.ini"
  mode "0644"
  path "/etc/php5/conf.d/timezone.ini"
  notifies :reload, "service[apache2]", :delayed
end

cookbook_file "php-config-short-tags" do
  source "php/conf.d/short-tags.ini"
  mode "0644"
  path "/etc/php5/conf.d/short-tags.ini"
  notifies :reload, "service[apache2]", :delayed
end

cookbook_file "php-config-xdebug-extra" do
  source "php/conf.d/xdebug-extra.ini"
  mode "0644"
  path "/etc/php5/conf.d/xdebug-extra.ini"
  notifies :reload, "service[apache2]", :delayed
end

cookbook_file "apache-site-website" do
  source "sites/100-backyardbrood.com"
  mode "0644"
  path "/etc/apache2/sites-enabled/100-backyardbrood.com"
  notifies :reload, "service[apache2]", :delayed
end

cookbook_file "apache-site-api" do
  source "sites/200-api.backyardbrood.com"
  mode "0644"
  path "/etc/apache2/sites-enabled/200-api.backyardbrood.com"
  notifies :reload, "service[apache2]", :delayed
end

apache_site ""
