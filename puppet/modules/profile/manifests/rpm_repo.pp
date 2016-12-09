class profile::rpm_repo {
  class{ 'apache':
    default_vhost     => false
  }
  apache::vhost{ 'default-80':
    docroot             => "/opt/repo/",
    ip                  => $::ipaddress,
    port                => '80'
  }

  package { 'createrepo':
    ensure => 'present'
  }
}