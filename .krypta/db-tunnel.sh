#!/bin/bash
# Script for creating SSH tunnel for database connection outside of the office.
# It is recommended to copy this script locally and adjust \$USERNAME variable.
#
#
ENV=$1
USERNAME=marcin.glod
TESTPORT=25433
PRODPORT=25432
DB_TUNNEL=10.250.3.220

function Help {
	cat <<EOF

    Syntax:
        $0 <environment>
    
    where environment is test or prod
EOF
}

function Info {
	cat <<EOF
    ############################################################
    Connection estabilished. 
    You can connect to database using local ports:
    
    localhost:$TESTPORT  -> douglas-test
    localhost:$PRODPORT  -> douglas-prod
    
    This window needs to stay open for the connection to persist

    ############################################################
    
EOF
}

if [ $# != 1 ]; then
	echo "Incorect variables."
	Help
	exit 1
fi

case $ENV in
test)
	Info
	ssh -L "$TESTPORT:douglas-test-db-2.postgres.database.azure.com:5432" "$USERNAME@$DB_TUNNEL"
	;;
prod)
	Info
	ssh -L "$PRODPORT:douglas-prod.postgres.database.azure.com:5432" "$USERNAME@$DB_TUNNEL"
	;;
*)
	echo "Incorrect environment."
	Help
	exit 1
	;;
esac
