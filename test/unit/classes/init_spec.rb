require 'spec_helper'

describe 'henchman_example' do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      case facts[:osfamily].downcase
      when 'debian'
        package_name = 'vim'
      else
        package_name = 'vim-enhanced'
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('henchman_example') }
      it { is_expected.to contain_class('henchman_example::params') }
      it do
        is_expected.to contain_class('henchman_example::install')
          .that_comes_before('Class[henchman_example::config]')
      end
      it do
        is_expected.to contain_class('henchman_example::config')
          .that_comes_before('Class[henchman_example]')
      end

      it do
        is_expected.to contain_package('vim').with(
          'ensure' => 'present',
          'name'   => package_name,
        )
      end

      it do
        is_expected.to contain_file('global-vimrc').with(
          'ensure' => 'file',
          'path'   => '/etc/vimrc',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0644',
        )
      end

    end
  end

  context 'on unsupported operating system' do
    let(:facts) { { osfamily: 'Solaris', operatingsystem: 'Nexenta' } }
    it { is_expected.to compile.and_raise_error(/Nexenta not supported/) }
  end

  context 'with parameters passed' do
    let (:facts) { { osfamily: 'Debian' } }
    let (:params) do
      {
        :package_name => 'apple',
        :global_vimrc => 'orange'
      }
    end

    it { is_expected.to contain_package('vim').with_name('apple') }
    it { is_expected.to contain_file('global-vimrc').with_path('orange') }
  end

end
