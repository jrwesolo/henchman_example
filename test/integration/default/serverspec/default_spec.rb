require 'spec_helper'

case os[:family].downcase
when 'redhat'
  package_name = 'vim-enhanced'
when 'debian'
  package_name = 'vim'
end

describe package(package_name) do
  it { is_expected.to be_installed }
end

describe file('/etc/vimrc') do
  it { is_expected.to be_file }
  it { is_expected.to be_mode(644) }
  it { is_expected.to be_owned_by('root') }
  it { is_expected.to be_grouped_into('root') }
end
