require_relative '../spec_helper'

describe 'apache::default' do
  subject { ChefSpec::Runner.new.converge(described_recipe) }

  it 'install' do
    expect(subject).to install_package 'httpd-2.4.10-1.x86_64.rpm'
    expect(subject).to install_package 'httpd-tools-2.4.10-1.x86_64.rpm'
    expect(subject).to install_package 'mod_proxy_html-2.4.10-1.x86_64.rpm'
    expect(subject).to install_package 'mod_ssl-2.4.10-1.x86_64.rpm'
  end

  it 'config' do
  end

  it 'service' do
  end
end

