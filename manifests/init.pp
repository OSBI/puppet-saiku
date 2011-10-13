import "classes/*.pp"

class saiku {

include tomcat::source
include saiku::data
include apt
	
	apt::key { "alabs repo":
		source => "http://webserver.analytical-labs.com/debian/public.key"
	}

	apt::sources_list { "analyticallabs":
		content => "deb http://webserver.analytical-labs.com/debian natty main"
	}
	
	tomcat::instance {"saiku":
  		ensure      => present,
  		ajp_port    => "8009",
	}


    package { 'saiku':
        ensure => latest,
        #notify  => Service['tomcat-saiku'],
		require => Tomcat::Instance["saiku"],
    }


}
