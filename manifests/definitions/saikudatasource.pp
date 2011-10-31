define saiku::datasource($ensure , $tomcat_name) {
  
  file { "/srv/tomcat/${tomcat_name}/webapps/saiku/WEB-INF/classes/saiku-datasources/${name}":
      ensure => ${ensure},
   }

}