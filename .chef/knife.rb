# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "sma"
client_key               "#{current_dir}/sma.pem"
chef_server_url          "https://shameem-mubassir1.mylabserver.com/organizations/smalab"
cookbook_path            ["#{current_dir}/../cookbooks"]
