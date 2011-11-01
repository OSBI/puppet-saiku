define saiku::datasource($ensure , $tomcat_name, $datasource_name) {
  
  file { "/srv/tomcat/${tomcat_name}/webapps/saiku/WEB-INF/classes/saiku-datasources/${datasource_name}":
      ensure => $ensure,
      content => template('saiku/foodmart_mysql.erb')
   }

}