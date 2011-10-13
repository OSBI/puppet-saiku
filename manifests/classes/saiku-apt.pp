class saiku::apt {
include apt

        apt::key { "alabs repo":
                source => "http://repo.analytical-labs.com/public.key"
        }

        apt::sources_list { "analyticallabs":
                content => "deb http://repo.analytical-labs.com/ natty main"
        }


}

