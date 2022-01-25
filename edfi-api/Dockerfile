# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# Sourced from https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-Docker

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine
LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"

ENV VERSION="5.3.1146"

WORKDIR /app
COPY appsettings.template.json /app/appsettings.template.json
COPY run.sh /app/run.sh
COPY log4net.config /app/log4net.txt

RUN apk add unzip dos2unix bash gettext postgresql-client && \
    wget -O /app/WebApi.zip  https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.WebApi/versions/${VERSION}/content && \
    unzip /app/WebApi.zip -d /app && \
    rm -f /app/WebApi.zip && \
    wget -O /app/texasextensions.zip https://storage.googleapis.com/cglx-edfi-extensions/EdFi.Ods.Extensions.TexasExtensions.1.0.0.nupkg && \
    unzip /app/texasextensions.zip -d /app/Plugin/EdFi.Ods.Extensions.TexasExtensions.1.0.0 && \
    rm -f /app/texasextensions.zip && \
    rm -rf /app/Plugin/EdFi.Ods.Extensions.TexasExtensions.1.0.0/_rels && \
    rm -rf /app/Plugin/EdFi.Ods.Extensions.TexasExtensions.1.0.0/Artifacts/MsSql && \
    rm -rf /app/Plugin/EdFi.Ods.Extensions.TexasExtensions.1.0.0/Artifacts/PgSql && \
    rm -rf /app/Plugin/EdFi.Ods.Extensions.TexasExtensions.1.0.0/package && \
    rm -rf /app/Plugin/EdFi.Ods.Extensions.TexasExtensions.1.0.0/'[Content_Types].xml' && \
    rm -rf /app/Plugin/EdFi.Ods.Extensions.TexasExtensions.1.0.0/assemblyMetadata.json && \
    rm -rf /app/Plugin/EdFi.Ods.Extensions.TexasExtensions.1.0.0/'EdFi.Ods.Extensions.TexasExtensions.nuspec' && \
    cp /app/log4net.txt /app/log4net.config && \
    dos2unix /app/*.json && \
    dos2unix /app/*.sh && \
    dos2unix /app/log4net.config && \
    chmod 700 /app/*.sh ** && \
    rm -f /app/*.exe

EXPOSE "80"

ENTRYPOINT exec /app/run.sh
