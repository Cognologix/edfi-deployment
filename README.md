## Building and Deploying Ed-Fi with Extension
This repository contains all code and instructions to deploy the Ed-Fi Platform. This README will walk you through how to build and deploy the Ed-Fi ODS as well as the Ed-Fi API and Admin App.


## Ed-Fi ODS

#### prerequisites
1. Empty Postgres instance is available
2. You have "createdb" and "psql" utility installed on machine from where you will run below scripts

####  Enable APIs and download artifacts
The first script will download ODS backup files along with extension and unzip the downloaded files so they are ready to be imported once you have your Postgres Sql instance created.

```bash
bash edfi-ods/001-init.sh;
```

#### Create Empty Database into Postgres SQL instance
The second script will create the empty ODS databases that you'll import data into later on. 

```bash
bash edfi-ods/002-create-database-sql.sh $PGHOST $PGUSER $PGPASSWORD;
```

#### Import ODS data

The third script to import the ODS data.

```bash
bash edfi-ods/003-import-ods-data.sh $PGHOST $PGUSER $PGPASSWORD;
```
That's it for the ODS! You now have an Ed-Fi ODS created and your databases seeded with data.



#### Ed-Fi Admin App encryption key

* Create a new secret with the name `admin-app-encryption-key`
* Store the output of the command below

```bash
/usr/bin/openssl rand -base64 32
```


## Ed-Fi API

Time to deploy the API on Google Cloud Run. You'll notice a few files in the `edfi-api` folder that we will use to deploy the API. These files were created by the Ed-Fi Team Team who has created a more generalized [Docker repository](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-Docker).


```bash
bash edfi-api/001-deploy-api.sh $GOOGLE_CLOUD_PROJECT;
```

## Ed-Fi Admin App
Ed-Fi's Admin App be deployed to Google Cloud Run as a separate application.

```bash
bash edfi-admin-app/001-deploy-admin-app.sh $GOOGLE_CLOUD_PROJECT <CLOUD_RUN_EDFI_API_URL>;
```
