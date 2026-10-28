# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'nrpe_command' do
  before(:all) do
    shell("printf 'server_port=5666\\ncommand[check_users]=/usr/lib/nagios/plugins/check_users -w 5 -c 10\\n' > /tmp/nrpe_test.cfg")
  end

  context 'with ensure => present' do
    it_behaves_like 'an idempotent resource' do
      let(:manifest) do
        <<~PUPPET
          nrpe_command { 'check_load':
            ensure  => present,
            command => '/usr/lib/nagios/plugins/check_load -w 15,10,5 -c 30,25,20',
            target  => '/tmp/nrpe_test.cfg',
          }
          nrpe_command { 'check_users':
            ensure  => present,
            command => '/usr/lib/nagios/plugins/check_users -w 10 -c 20',
            target  => '/tmp/nrpe_test.cfg',
          }
        PUPPET
      end
    end

    describe file('/tmp/nrpe_test.cfg') do
      its(:content) { is_expected.to match(%r{^server_port=5666$}) }
      its(:content) { is_expected.to match(%r{^command\[check_load\]=/usr/lib/nagios/plugins/check_load -w 15,10,5 -c 30,25,20$}) }
      its(:content) { is_expected.to match(%r{^command\[check_users\]=/usr/lib/nagios/plugins/check_users -w 10 -c 20$}) }
    end
  end

  context 'with ensure => absent' do
    it_behaves_like 'an idempotent resource' do
      let(:manifest) do
        <<~PUPPET
          nrpe_command { 'check_users':
            ensure => absent,
            target => '/tmp/nrpe_test.cfg',
          }
        PUPPET
      end
    end

    describe file('/tmp/nrpe_test.cfg') do
      its(:content) { is_expected.not_to match(%r{check_users}) }
      its(:content) { is_expected.to match(%r{^command\[check_load\]=}) }
    end
  end
end
