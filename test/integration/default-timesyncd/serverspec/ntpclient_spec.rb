require 'serverspec'

# Required by serverspec
set :backend, :exec

describe service('systemd-timesyncd') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/systemd/timesyncd.conf') do
  it { should be_file }
  its(:content) { should match /^NTP=/ }
end
