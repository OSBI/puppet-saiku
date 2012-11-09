#
# saikudatasource.pp
#
# Copyright (c) 2012, OSBI Ltd. All rights reserved.
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
define saiku::datasource ($ensure, $tomcat_name, $datasource_name, $database_type = "mysql5") {
  if ($database_type == "mysql5") {
    $template = "mysql"

    file { "/srv/tomcat/${tomcat_name}/webapps/saiku/WEB-INF/classes/saiku-datasources/${datasource_name}":
      ensure  => $ensure,
      content => template("saiku/foodmart_${template}.erb"),
      notify  => Service["tomcat-saiku"],
    }

  }

  if ($database_type == "vectorwise2") {
    $template = "vectorwise"

    if $::vectorwise_exists == "true" {
      $vectorw_password = $::vw_password

      file { "/srv/tomcat/${tomcat_name}/webapps/saiku/WEB-INF/classes/saiku-datasources/${datasource_name}":
        ensure  => $ensure,
        content => template("saiku/foodmart_${template}.erb"),
        notify  => Service["tomcat-saiku"],
        require => File["/home/ingres/.vw"],
      }
    } else {
      $vectorw_password = "password"
    }

  }

  if ($database_type == "postgresql8") {
    $template = "postgresql"

    file { "/srv/tomcat/${tomcat_name}/webapps/saiku/WEB-INF/classes/saiku-datasources/${datasource_name}":
      ensure  => $ensure,
      content => template("saiku/foodmart_${template}.erb"),
      notify  => Service["tomcat-saiku"],
    }

  }

}

