class saiku::apt {
include apt

        apt::key { "alabs repo":
                source => "http://debian.analytical-labs.com/public.key"
        }

        apt::sources_list { "analyticallabs":
                content => "deb http://debian.analytical-labs.com/ natty main"
        }


}

