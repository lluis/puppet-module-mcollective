
class mcollective::install::redhat {

    $ver="0.4.10-1.el5"
    $mcollective="mcollective-$ver.noarch.rpm"
    $mcollective_common="mcollective-common-$ver.noarch.rpm"

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
          command => "rpm -U $mcollective $mcollective_common --nodeps",
          cwd => "/usr/local/src",
          unless => "rpm -ql mcollective-$ver &> /dev/null",
          require => [ Exec["download mcollective"] , Exec["download mcollective-common"] ],
          notify => Service["mcollective"];
    }

}

