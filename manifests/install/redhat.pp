
class mcollective::install::redhat {

    exec {
      "download mcollective":
          command => "wget http://mcollective.googlecode.com/files/mcollective-0.4.9-1.el5.noarch.rpm",
          cwd => "/usr/local/src",
          creates => "/usr/local/src/mcollective-0.4.9-1.el5.noarch.rpm";
      "download mcollective-common":
          command => "wget http://mcollective.googlecode.com/files/mcollective-common-0.4.9-1.el5.noarch.rpm",
          cwd => "/usr/local/src",
          creates => "/usr/local/src/mcollective-common-0.4.9-1.el5.noarch.rpm";
      "install mcollective":
          command => "rpm -i mcollective-0.4.9-1.el5.noarch.rpm mcollective-common-0.4.9-1.el5.noarch.rpm --nodeps",
          cwd => "/usr/local/src",
          unless => "rpm -ql mcollective &> /dev/null",
          require => [ Exec["download mcollective"] , Exec["download mcollective-common"] ];
    }

}

