class saiku::server($app_name, $default_datasource, $database){
  package {
    "${app_name}" :
      ensure => latest,
      require => Apt::Key["Analytical Labs"],
  } ->
  group { "tomcatshared ${app_name}":
    name => "tomcatshared",
    ensure => present,
  } ->
 exec { 
   "chown to tomcat" :
     command => "chown -R tomcat:tomcatshared /srv/tomcat/saiku/webapps/",
 } ->
   file { "/srv/tomcat/saiku/webapps/saiku/WEB-INF/classes/saiku-datasources/foodmart":
      ensure => absent,
     notify          => Service["tomcat-saiku"],
      
        }
  if ($default_datasource == true) {
    saiku::datasource {
      "foodmart_${database}_dev_saiku" :
        ensure => present,
        datasource_name => "foodmart_${database}_saiku",
        tomcat_name => "saiku",
        notify  => Service["tomcat-saiku"],
        require =>Package["${app_name}"],
        database_type => $database,
    }
  }
}