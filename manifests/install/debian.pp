class mcollective::install::debian {

    include rubygems

    $ver="0.4.10-1"
    $mcollective="mcollective_${ver}_all.deb"
    $mcollective_common="mcollective-common_${ver}_all.deb"

    gem_package { "stomp": ensure => "installed" }

    exec {
      "download mcollective":
          command => "wget http://mcollective.googlecode.com/files/$mcollective",
          cwd => "/usr/local/src",
          creates => "/usr/local/src/$mcollective";
      "download mcollective-common":
          command => "wget http://mcollective.googlecode.com/files/$mcollective_common",
          cwd => "/usr/local/src",
          creates => "/usr/local/src/$mcollective_common";
      "install mcollective":
          command => "dpkg --force-confold -i $mcollective $mcollective_common",
          unless => "dpkg -l | grep 'mcollective ' | grep '^ii' | grep '$ver' &> /dev/null",
          cwd => "/usr/local/src",
          require => [ Exec["download mcollective"] , Exec["download mcollective-common"] ],
          notify => Service["mcollective"];
    }

}
