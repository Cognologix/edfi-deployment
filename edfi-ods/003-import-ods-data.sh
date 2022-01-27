#######################################################################
# This script will import the ODS data into postgres database instance
#######################################################################

export PGHOST=$1
export PGUSER=$2;
export PGPASSWORD=$3;
psql -h $PGHOST -U $PGUSER  'EdFi_Admin' < artifacts/edfi-ods-admin/EdFi_Admin.sql;
psql -h $PGHOST -U $PGUSER  'EdFi_Security' < artifacts/edfi-ods-security/EdFi_Security.sql;
psql -h $PGHOST -U $PGUSER  'EdFi_Ods_2022' < artifacts/edfi-ods-minimal/EdFi.Ods.Minimal.Template.TPDM.Core.sql;

for FILE in `LANG=C ls artifacts/ed-fi-ods-admin-scripts/PgSql/* | sort -V`
    do
        psql -h $PGHOST -U $PGUSER 'EdFi_Admin' < $FILE 
    done



# installation of TexasExtensions
for FILE in `LANG=C ls artifacts/edfi-ods-extensions-texasextensions/Artifacts/PgSql/Structure/Ods/*.sql | sort -V`
    do
        psql -h $PGHOST -U $PGUSER 'EdFi_Ods_2022' < $FILE 
    done

for FILE in `LANG=C ls artifacts/edfi-ods-extensions-texasextensions/Artifacts/PgSql/Structure/Ods/Changes/*.sql | sort -V`
    do
        psql -h $PGHOST -U $PGUSER 'EdFi_Ods_2022' < $FILE 
    done

for FILE in `LANG=C ls artifacts/edfi-ods-extensions-texasextensions/Artifacts/PgSql/Data/Ods/*.sql | sort -V`
    do
        psql -h $PGHOST -U $PGUSER 'EdFi_Ods_2022' < $FILE
    done


for FILE in `LANG=C ls artifacts/edfi-ods-extensions-texasextensions/Artifacts/PgSql/Data/Security/*.sql | sort -V`
    do
        psql -h $PGHOST -U $PGUSER 'EdFi_Security' < $FILE 
    done
