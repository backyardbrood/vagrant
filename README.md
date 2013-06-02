# Back Yard Brood Vagrant Config

## Prerequisites
* Vagrant
* VirtualBox
* dnsmasq for .dev or hosts entries for `api.backyardbrood.dev` and `backyardbrood.dev`to 127.0.0.1

## How to Use
1. Clone this repo
2. Clone the `website` repo in the code directory
3. clone the `api` repo in the code directory
3. run `vagrant up`


The API will be available at `http://api.backyardbrood.dev:8080`

The site will be available at `http://backyardbrood.dev:8080`