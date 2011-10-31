define saiku::instance($ensure , $tomcat_name, $tomcat_http, $tomcat_ajp, $tomcat_server, $app_name = 'saiku') {

  include tomcat::source
  tomcat::instance {"${name}":
    ensure      => present,
    ajp_port    => "${tomcat_ajp}",
    server_port    => "${tomcat_server}",
    http_port    => "${tomcat_http}",
  }



}
