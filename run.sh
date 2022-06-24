#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"

: "${IMAGE:="gcr.io/cf-identity-service-oak/mbrauer/pod-terminated-tls"}"

 docker run \
   --rm \
   --volume $PWD/pod-terminated-tls.mamachanko.com.p12:/keystore.p12 \
   --env SERVER_PORT=8443 \
   --env SERVER_SSL_ENABLED=true \
   --env SERVER_SSL_KEYSTORE=/keystore.p12 \
   --env SERVER_SSL_KEYSTORETYPE=PKCS12 \
   --env SERVER_SSL_KEYSTOREPASSWORD=changeit \
   --publish 8443:8443 \
   "${IMAGE}"
