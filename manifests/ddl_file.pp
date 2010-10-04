
define mcollective::ddl_file ( $source ) {

    case $operatingsystem {
        debian,ubuntu: { $p_base = "/usr/share/mcollective/plugins/mcollective" }
        redhat,centos,fedora: { $p_base = "/usr/libexec/mcollective/mcollective" }
    }
    $s_base = "puppet:///modules/mcollective/plugins"

    File {
        owner => root,
        group => root,
        mode  => 0444,
        require => Exec["install mcollective"],
    }

    file { "${p_base}/${title}": source => "${s_base}/${source}" }

}

