class profile::app {

  $application_port = hiera('application_port')

  yumrepo { "node-repo":
    baseurl => "https://rpm.nodesource.com/pub_6.x/el/7/x86_64/",
    enabled  => 1,
    gpgcheck => 0
  } ->
  package { 'nodejs':
    ensure => 'latest'
  }

  yumrepo { "xebia-repo":
    baseurl  => 'http://repo.docker',
    descr    => "xebia repo",
    enabled  => 1,
    gpgcheck => 0
  } ->

  package { 'xebia-puppet-app':
    ensure => 'latest'
  } ->

  file { '/opt/app/config.json' :
    ensure  => 'present',
    content => template('profile/app/config.json.erb')
  } ->

  service { 'xebia-app':
    ensure => 'running',
    enable => true
  }


}