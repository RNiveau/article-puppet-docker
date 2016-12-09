class profile::app {

  $application_port = hiera('application_port')

  yumrepo { "xebia-repo":
    baseurl  => 'http://repo.docker',
    descr    => "xebia repo",
    enabled  => 1,
    gpgcheck => 0
  } ->

  package { 'xebia-puppet-app':
    ensure => 'latest'
  } ->

  file {'/opt/app/config.json' :
    ensure => 'present',
    content => template('profile/app/config.json.erb')
  }


}