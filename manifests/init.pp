import "classes/*.pp"

class saiku {

class { "saiku::webstack":}
class { "saiku::apt":
		require => Class["saiku::webstack"]
	  }
class { "saiku::app":
		require => Class["saiku::apt"]
		}
class { "saiku::data":
		require => Class["saiku::app"]}
#include saiku::webstack
#include saiku::apt
#include saiku::app
#include saiku::data	


}
