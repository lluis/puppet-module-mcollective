class mcollective::install::debian {

    include stomp

    exec {
      "download mcollective":
          command => "wget http://mcollective.googlecode.com/files/mcollective_0.4.9-1_all.deb -P /usr/local/src",
          creates => "/usr/local/src/mcollective_0.4.9-1_all.deb";
      "download mcollective-common":
          command => "wget http://mcollective.googlecode.com/files/mcollective-common_0.4.9-1_all.deb -P /usr/local/src",
          creates => "/usr/local/src/mcollective-common_0.4.9-1_all.deb";
      "install mcollective":
          command => "dpkg -i /usr/local/src/mcollective_0.4.9-1_all.deb /usr/local/src/mcollective-common_0.4.9-1_all.deb",
          unless => "dpkg -L mcollective &> /dev/null",
          require => [ Exec["download mcollective"] , Exec["download mcollective-common"] ];
    }

}
