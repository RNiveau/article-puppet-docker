Package {
  allow_virtual => false
}

node /^repo/ {
  include profile::rpm_repo
}

node /^app\d+$/ {
  include profile::app
}