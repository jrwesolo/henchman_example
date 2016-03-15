class henchman_example::params {

  $global_vimrc = '/etc/vimrc'

  case $::osfamily {
    'RedHat': {
      $package_name = 'vim-enhanced'
    }
    'Debian': {
      $package_name = 'vim'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

}
