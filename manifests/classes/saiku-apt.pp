class saiku::apt {
include apt

        apt::key { "alabs repo":
                source => "http://webserver.analytical-labs.com/debian/public.key"
        }

        apt::sources_list { "analyticallabs":
                content => "deb http://webserver.analytical-labs.com/debian natty main"
        }


}

