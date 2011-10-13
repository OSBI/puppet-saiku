import "classes/*.pp"

class saiku {

include tomcat

include saiku::data


    package { 'saiku':
        ensure => latest,
        notify  => Service['tomcat7'],
	require => Package['tomcat7-alabs'],
    }


}
