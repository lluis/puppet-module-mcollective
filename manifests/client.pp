
class mcollective::client {
    case $operatingsystem {
        ubuntu,debian,redhat,centos,fedora: { include mcollective::client::actual }
        default: { notice("${hostname}: mcollective: module does not yet support $operatingsystem") }
    }
}

