import "classes/*.pp"

class saiku {

class { "saiku::webstack":}
class { "saiku::apt":
		requires => Class[saiku::webstack]
	  }
class { "saiku::app":
		requires => Class[saiku::apt]
		}
class { "saiku::data":
		requires => Class[saiku::app]}
#include saiku::webstack
#include saiku::apt
#include saiku::app
#include saiku::data	


}
