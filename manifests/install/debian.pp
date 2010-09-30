class mcollective::install::debian {

    include stomp

    exec {
      "download mcollective":
          command => "cd /usr/local/src ; wget http://mcollective.googlecode.com/files/mcollective_0.4.9-1_all.deb",
          creates => "/usr/local/src/mcollective_0.4.9-1_all.deb";
      "download mcollective-common":
          command => "cd /usr/local/src ; wget http://mcollective.googlecode.com/files/mcollective-common_0.4.9-1_all.deb",
          creates => "/usr/local/src/mcollective-common_0.4.9-1_all.deb";
      "install mcollective":
          command => "cd /usr/local/src ; dpkg -i mcollective_0.4.9-1_all.deb mcollective-common_0.4.9-1_all.deb",
          unless => "dpkg -L mcollective &> /dev/null",
          require => [ Exec["download mcollective"] , Exec["download mcollective-common"] ];
    }

}
