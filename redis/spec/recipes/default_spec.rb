require_relative '../spec_helper'

describe 'redis::default' do
  let (:chef_run) do
    chef_run = ChefSpec::Runner.new(platform:'centos', version:'6.4') do |node|
      node.set[:memory][:total] = "1024000"
    end.converge(described_recipe)
  end

  it "install redis" do
    %w{
      gperftools-libs
      redis
    }.each do |pkg|
      expect(chef_run).to install_package(pkg)
    end
  end

  it 'configure redis' do
    expect(chef_run).to render_file('/etc/redis.conf').with_content("save 300 10")
  end

  it 'configure redis maxmemory' do
    expect(chef_run).to render_file('/etc/redis.conf').with_content("maxmemory 700mb")
  end

  it 'configure sentinel' do
    expect(chef_run).to render_file('/etc/redis-sentinel.conf').with_content("port 26379")
    expect(chef_run).to render_file('/etc/redis-sentinel.conf').with_content("bind 0.0.0.0")
    expect(chef_run).to render_file('/etc/redis-sentinel.conf').with_content("sentinel monitor mymaster 127.0.0.1 6379 2")
  end

  it 'not service redis and sentinel' do
    expect(chef_run).to disable_service('redis')
  end

  it 'not service sentinel' do
    expect(chef_run).to disable_service('redis-sentinel')
  end
end

