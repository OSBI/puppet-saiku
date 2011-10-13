class saiku::webstack {
include tomcat::source

        tomcat::instance {"saiku":
                ensure      => present,
                ajp_port    => "8009",
        }

}

