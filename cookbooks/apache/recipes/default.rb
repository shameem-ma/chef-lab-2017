#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
package 'apachesma' do
	package_name 'httpd'
	action :install
end

service 'apachesma' do
	service_name 'httpd'
	action [:start, :enable]
end

