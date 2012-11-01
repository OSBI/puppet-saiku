class saiku::server($app_name, $default_datasource, $database){
#include saiku::app
#  package {
#    "${app_name}" :
#      ensure => latest,
#      require => [Apt::Key["Analytical Labs"],Service[tomcat-saiku]]
#  }

tomcat::instance {"saiku":
    ensure      => present,
    ajp_port    => "8009",
    server_port    => "8005",
    http_port    => "8080",
  }
  package {
    "saiku" :
      ensure => held,
      require => Apt::Key["Analytical Labs"]
  }
  
  group { "tomcatshared ${app_name}":
    name => "tomcatshared",
    ensure => present,
  }
  
 exec { 
   "chown to tomcat" :
     command => "chown -R tomcat:tomcatshared /srv/tomcat/saiku/webapps/",
     require => Package["saiku"],
 }
 
  if ($default_datasource == true) {
#    saiku::datasource {
#      "foodmart_${database}_dev_saiku" :
#        ensure => present,
#        datasource_name => "foodmart_${database}_saiku",
#        tomcat_name => "saiku",
#        notify  => Service["tomcat-saiku"],
#        require =>Package["${app_name}"],
#        database_type => $database,
#    }
  }
}
