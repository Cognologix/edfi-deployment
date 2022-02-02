## Building and Deploying Ed-Fi with Extension
This repository contains all code and instructions to deploy the Ed-Fi Platform. This README will walk you through how to build and deploy the Ed-Fi ODS as well as the Ed-Fi API and Admin App.


## Ed-Fi ODS

#### Prerequisites
* Empty Postgres instance is available
* You have `createdb` and `psql` utility installed on machine from where you will run below scripts

####  Enable APIs and download artifacts
The first script will download ODS backup files along with extension and unzip the downloaded files so they are ready to be imported once you have your Postgres Sql instance created.

```bash
bash edfi-ods/001-init.sh
```

#### Create Empty Database into Postgres SQL instance
The second script will create the empty ODS databases that you'll import data into later on. 

```bash
bash edfi-ods/002-create-database-sql.sh $PGHOST $PGUSER $PGPASSWORD
```

#### Import ODS data

The third script to import the ODS data.

```bash
bash edfi-ods/003-import-ods-data.sh $PGHOST $PGUSER $PGPASSWORD
```
That's it for the ODS! You now have an Ed-Fi ODS created and your databases seeded with data.


## Ed-Fi API

#### Build Ed-Fi Api Image
Time to build an Ed-Fi API docker image. You'll notice a few files in the `edfi-api` folder that we will use to build/deploy the API. These files were created by the Ed-Fi Team who has created a more generalized [Docker repository](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-Docker).


```bash
bash edfi-api/build-edfi-api.sh $IMAGE_TAG $DOCKER_REPOSITIRY
```

#### Deploy Ed-Fi Api Image

Time to deploy the Ed-Fi API docker image. 

```bash
bash edfi-api/deploy-edfi-api.sh $IMAGE_TAG $DOCKER_REPOSITIRY $PGHOST $PGUSER $PGPASSWORD
```


## Ed-Fi Admin App

Ed-Fi's Admin App be deployed as a separate application.

#### Build Ed-Fi Admin App Image
Time to build an Ed-Fi Admin App docker image.

```bash
bash edfi-admin-app/build-edfi-admin-app.sh $IMAGE_TAG $DOCKER_REPOSITIRY
```

#### Ed-Fi Admin App encryption key

Run the Below command the keep the generated encryption key handy. This will need while deploying Ed-Fi Admin App
```bash
/usr/bin/openssl rand -base64 32
```

#### Deploy Ed-Fi Admin App Image

Time to deploy the Ed-Fi Admin App docker image

```bash
bash edfi-admin-app/deploy-edfi-admin-app.sh $IMAGE_TAG $DOCKER_REPOSITIRY $PGHOST $PGUSER $PGPASSWORD $ENCRYPTION_KEY $API_URL
```



