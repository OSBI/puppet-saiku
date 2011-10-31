class saiku::webstack {
  include tomcat::source

  tomcat::instance {"saiku":
    ensure      => present,
    ajp_port    => "8009",
    server_port    => "8005",
    http_port    => "8080",
  }

}

