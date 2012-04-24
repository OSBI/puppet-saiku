#
# saikudatasource.pp
# 
# Copyright (c) 2011, OSBI Ltd. All rights reserved.
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA 02110-1301  USA
#
define saiku::datasource($ensure, $tomcat_name, $datasource_name, $database_type = 'mysql5') {
  
  if($database_type='mysql5'){
  	file { "/srv/tomcat/${tomcat_name}/webapps/saiku/WEB-INF/classes/saiku-datasources/${datasource_name}":
      ensure => $ensure,
      content => template('saiku/foodmart_mysql.erb')
   	}
   }
   
   if($database_type='vectorwise2'){
   	file { "/srv/tomcat/${tomcat_name}/webapps/saiku/WEB-INF/classes/saiku-datasources/${datasource_name}":
      ensure => $ensure,
      content => template('saiku/foodmart_vectorwise.erb')
   	}
   }

}
