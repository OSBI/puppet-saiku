define saiku::instance($ensure , $tomcat_name, $tomcat_http, $tomcat_ajp, $tomcat_server) {

		include tomcat::source

        tomcat::instance {"${name}":
                ensure      => present,
                ajp_port    => "${tomcat_ajp}",
                server_port    => "${tomcat_server}",
                http_port    => "${tomcat_http}",
        }

		class { "saiku::apt":
			require => Tomcat::Instance["${name}"]
	  	}
		class { "saiku::app":
			require => Class["saiku::apt"]
		}
		class { "saiku::data":
			require => Class["saiku::app"]
		}



}