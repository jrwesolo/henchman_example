class henchman_example::install {

  package { 'vim':
    ensure => present,
    name   => $::henchman_example::package_name,
  }

}
