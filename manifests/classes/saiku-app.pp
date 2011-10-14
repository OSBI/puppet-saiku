class saiku::app {


    package { "${app_name}":
        ensure => latest,
        #notify  => Service['tomcat-saiku'],
        #require => Tomcat::Instance["saiku"],
    }


}

