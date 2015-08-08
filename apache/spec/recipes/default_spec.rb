require_relative '../spec_helper'

describe 'apache::default' do
  let (:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'install' do
    expect(chef_run).to install_package 'httpd-2.4.16-1.x86_64.rpm'
    expect(chef_run).to install_package 'httpd-tools-2.4.16-1.x86_64.rpm'
    expect(chef_run).to install_package 'mod_proxy_html-2.4.16-1.x86_64.rpm'
    expect(chef_run).to install_package 'mod_ssl-2.4.16-1.x86_64.rpm'
  end

  it 'config' do
    expect(chef_run).to create_template '/etc/httpd/conf/httpd.conf'
    expect(chef_run).to render_file '/etc/httpd/conf/extra/httpd-default.conf'
    expect(chef_run).to render_file('/etc/httpd/conf/extra/httpd-default.conf').with_content('Timeout 30')
    expect(chef_run).to render_file '/etc/httpd/conf/extra/httpd-mpm.conf'
    expect(chef_run).to render_file '/etc/httpd/conf/extra/httpd-info.conf'
    expect(chef_run).to render_file('/etc/httpd/conf/extra/httpd-ssl.conf').with_content("RequestHeader set X_Forwarded_Proto 'https'")
    expect(chef_run).to render_file('/etc/httpd/conf/extra/httpd-ssl.conf').with_content('ProxyPass / http://127.0.0.1:8000/ keepalive=On')

    expect(chef_run).to delete_directory '/var/www/icons'
    expect(chef_run).to delete_file '/var/www/html/index.html'
  end

  it 'service' do
    expect(chef_run).to disable_service('httpd')
  end
end

