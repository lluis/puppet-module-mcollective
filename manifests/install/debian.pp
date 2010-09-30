class mcollective::install::debian {

    include stomp

    package { "mcollective":
        ensure => $mcollective_package_version ? {
            "" => present,
            default => $mcollective_package_version
        },
        require => Package["stomp"],
    }

}
