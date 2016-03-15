class henchman_example::config {

  $global_vimrc = $::henchman_example::global_vimrc

  file { 'global-vimrc':
    ensure  => file,
    path    => $global_vimrc,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => file('henchman_example/vimrc'),
  }

}
