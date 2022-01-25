# update following command for PSQL create databases
export PGHOST=$1
export PGUSER=$2;
export PGPASSWORD=$3;

createdb -h $PGHOST -U $PGUSER  'EdFi_Admin'
createdb -h $PGHOST -U $PGUSER  'EdFi_Security'
createdb -h $PGHOST -U $PGUSER  'EdFi_Ods_2022'
