#
# Cookbook:: anaconda3
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
bash 'run anaconda installer' do
  code <<-EOH
  curl -O https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh
  bash Anaconda3-4.4.0-Linux-x86_64.sh -b -f -p ~/apps/anaconda3
  EOH
  action :run
end

bash 'install ssl certificate ' do
  code <<-EOH
  mkdir $HOME/apps/anaconda3/certs
  cd ~/apps/anaconda3/certs
  openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.key -out mycert.pem  -subj "/C=GB/ST=London/L=London/O=CTS/OU=Ananonda/CN=jupiter-notebook"
  EOH
  action :run
end

bash 'configure anaconda ' do
  code <<-EOH
  export PATH=$HOME/apps/anaconda3/bin:$PATH
echo -e "c = get_config() \nc.NotebookApp.certfile = u'$HOME/apps/anaconda3/certs/mycert.pem' \nc.NotebookApp.keyfile = u'$HOME/apps/anaconda3/certs/mycert.key' \nc.NotebookApp.ip = '*' \nc.NotebookApp.open_browser = False \nc.NotebookApp.port = 8888 \n" >> $HOME/.jupyter/jupyter_notebook_config.py
  EOH
  action :run
end

bash 'start anaconda ' do
  code <<-EOH
  jupyter notebook &> /dev/null &
  EOH
  action :run
end