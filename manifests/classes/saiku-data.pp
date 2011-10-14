class saiku::data {

include mysql::server

mysql::database{"saikudemo":
  ensure   => present,
  require => Class["mysql::server"]
}


mysql::rights{"saikudemo rights":
  ensure   => present,
  database => "saikudemo",
  user     => "saiku",
  password => "password",
  require => Class["mysql::server"],
}

file { "/tmp/foodmart_mysql.sql":
    mode => 440,
    owner => root,
    group => root,
    source => "puppet:///modules/saiku/foodmart_mysql.sql",
    notify => Exec["importfoodmart"],
}

exec { "importfoodmart":
	cwd => "/tmp",
	command => "mysql -uroot saikudemo < /tmp/foodmart_mysql.sql",
	refreshonly => true,
	require => Mysql::Database["saikudemo"],
}

file { "/srv/tomcat/${tomcat_name}/webapps/saiku/WEB-INF/classes/saiku-datasources/foodmart":
	ensure => absent,
	require => File["/srv/tomcat/saiku/webapps/saiku/WEB-INF/classes/saiku-datasources/foodmart_mysql"],
}

file { "/srv/tomcat/${tomcat_name}/webapps/saiku/WEB-INF/classes/saiku-datasources/foodmart_mysql":
	ensure => present,
    content => template('saiku/foodmart_mysql.erb'),
	#notify => Service[tomcat-saiku],
}
}
