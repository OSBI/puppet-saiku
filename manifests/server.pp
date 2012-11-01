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
  saiku::datasource {
    "foodmart_dev_${name}" :
      ensure => absent,
      datasource_name => "foodmart",
      tomcat_name => "${name}",
      require =>Package["${app_name}"],
      notify  => Service["tomcat-${name}"],
  } 
  if ($default_datasource == true) {
    saiku::datasource {
      "foodmart_${database}_dev_${name}" :
        ensure => present,
        datasource_name => "foodmart_${database}_${name}",
        tomcat_name => "${name}",
        notify  => Service["tomcat-saiku"],
        require =>Package["${app_name}"],
        database_type => $database,
    }
  }
}