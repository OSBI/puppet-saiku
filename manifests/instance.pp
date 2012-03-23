#
# saikuinstance.pp
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
define saiku::instance($ensure , $tomcat_name, $tomcat_http, $tomcat_ajp, $tomcat_server, $app_name = 'saiku') {

  include tomcat::source

  package { "${app_name}":
     ensure => latest,
    # notify  => Service["tomcat-${name}"],
     }
     
  tomcat::instance {"${name}":
    ensure      => present,
    ajp_port    => "${tomcat_ajp}",
    server_port    => "${tomcat_server}",
    http_port    => "${tomcat_http}",
    before => Package["${app_name}"],
  }

  saiku::datasource { "foodmart_dev_${name}":
      ensure => absent,
      datasource_name => "foodmart",
      tomcat_name => "${name}",
      require =>Package["${app_name}"],
      notify  => Service["tomcat-${name}"],
    }
    
    saiku::datasource { "foodmart_mysql_dev_${name}" :
      ensure => present,
      datasource_name => "foodmart_mysql_${name}",
      tomcat_name => "${name}",
      notify  => Service["tomcat-${name}"],
      require =>Package["${app_name}"],
    }


}
