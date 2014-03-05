require_relative '../spec_helper'

describe 'redis::default' do
  let (:chef_run) { ChefSpec::Runner.new(platform:'centos', version:'6.4').converge(described_recipe) }

  it "install redis" do
    expect(chef_run).to install_package("redis")
  end 
end

