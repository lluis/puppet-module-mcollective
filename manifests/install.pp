class mcollective::install {
  include common::stomp
  case $operatingsystem {
    debian,ubuntu: { include mcollective::install::debian }
    redhat,centos,fedora: { include mcollective::install::redhat }
    default: { fail("${hostname}: mcollective: trying to install unsupported operatingsystem $operatingsystem") }
  }
}

