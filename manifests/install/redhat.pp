
class mcollective::install::redhat {

    include stomp

    exec {
      "download mcollective":
          command => "cd /usr/local/src ; wget http://mcollective.googlecode.com/files/mcollective-0.4.9-1.el5.noarch.rpm",
          creates => "/usr/local/src/mcollective-0.4.9-1.el5.noarch.rpm";
      "download mcollective-common":
          command => "cd /usr/local/src ; wget http://mcollective.googlecode.com/files/mcollective-common-0.4.9-1.el5.noarch.rpm",
          creates => "/usr/local/src/mcollective-common-0.4.9-1.el5.noarch.rpm";
      "install mcollective":
          command => "cd /usr/local/src ; rpm -i mcollective-0.4.9-1.el5.noarch.rpm mcollective-common-0.4.9-1.el5.noarch.rpm",
          unless => "dpkg -ql mcollective &> /dev/null",
          require => [ Exec["download mcollective"] , Exec["download mcollective-common"] ];
    }

}

