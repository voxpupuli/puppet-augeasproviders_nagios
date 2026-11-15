# frozen_string_literal: true

require 'spec_helper'

describe Puppet::Type.type(:nrpe_command) do
  describe 'name' do
    ['check_users', 'check-load', 'check.disk', 'check:procs'].each do |name|
      it "accepts #{name}" do
        expect { described_class.new(name: name) }.not_to raise_error
      end
    end

    ['check[x', 'check]x', 'check(x)', 'check/x', 'check\\x', 'check=x', 'check,x', 'check!x', 'check|x', "check\nx"].each do |name|
      it "rejects #{name.inspect}" do
        expect { described_class.new(name: name) }.to raise_error(Puppet::ResourceError, %r{Invalid command name})
      end
    end
  end
end
