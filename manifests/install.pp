class mcollective::install {
  include rubygems
  case $operatingsystem {
    ubuntu,debian: { include mcollective::install::debian }
    redhat,centos,fedora: { include mcollective::install::redhat }
    default: { fail("${hostname}: mcollective: trying to install unsupported operatingsystem $operatingsystem") }
  }
}

