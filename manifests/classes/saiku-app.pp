class saiku::app {
include saiku::data

    package { 'saiku':
        ensure => latest,
        notify  => Service['tomcat-saiku'],
        require => Tomcat::Instance["saiku"],
    }


}

