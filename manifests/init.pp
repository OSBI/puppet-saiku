import "classes/*.pp"

class saiku {

include saiku::webstack
include saiku::apt
include saiku::app	


}
