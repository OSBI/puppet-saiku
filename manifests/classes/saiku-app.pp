class saiku::app {


    package { 'saiku':
        ensure => latest,
        #notify  => Service['tomcat-saiku'],
        #require => Tomcat::Instance["saiku"],
    }


}

