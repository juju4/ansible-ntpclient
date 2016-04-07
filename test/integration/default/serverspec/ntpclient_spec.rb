require 'serverspec'

# Required by serverspec
set :backend, :exec

describe service('openntpd'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
end

describe process("ntpd"), :if => os[:family] == 'ubuntu' do
  its(:user) { should eq "root" }
#  its(:user) { should eq "ntpd" }
  it { should be_running }
end

describe file('/etc/openntpd/ntpd.conf'), :if => os[:family] == 'ubuntu' do
  it { should be_file }
  its(:content) { should match /^servers pool.ntp.org/ }
end

describe file('/var/log/syslog'), :if => os[:family] == 'ubuntu' do
  it { should be_file }
  its(:content) { should match /ntp engine ready/ }
## Note: might not appear fast enough after starting
#  its(:content) { should match /adjusting local clock by 0./ }
end

describe service('ntpd'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

describe process("ntpd"), :if => os[:family] == 'redhat' do
  its(:user) { should eq "ntp" }
  it { should be_running }
end

describe file('/etc/ntp.conf'), :if => os[:family] == 'redhat' do
  it { should be_file }
  its(:content) { should match /^server pool.ntp.org/ }
end

describe file('/var/log/messages'), :if => os[:family] == 'redhat' do
  it { should be_file }
  its(:content) { should match /Listen normally on / }
## Note: might not appear fast enough after starting
#  its(:content) { should match /adjusting local clock by 0./ }
end

