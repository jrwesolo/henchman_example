class henchman_example (
  $package_name = $::henchman_example::params::package_name,
  $global_vimrc = $::henchman_example::params::global_vimrc,
) inherits ::henchman_example::params {

  class { '::henchman_example::install': } ->
  class { '::henchman_example::config': } ->
  Class['henchman_example']

}
