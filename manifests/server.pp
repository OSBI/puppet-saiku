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
# exec { 
#   "chown to tomcat" :
#     command => "chown -R tomcat:tomcatshared /srv/tomcat/saiku/webapps/",
# } ->
#  saiku::datasource {
#    "foodmart_dev_saiku" :
#      ensure => absent,
#      datasource_name => "foodmart",
#      tomcat_name => "${name}",
#      require =>Package["${app_name}"],
#      notify  => Service["tomcat-saiku"],
#  } 
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