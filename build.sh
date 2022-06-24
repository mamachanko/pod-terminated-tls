#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"

: "${IMAGE:="gcr.io/cf-identity-service-oak/mbrauer/pod-terminated-tls"}"

./gradlew \
  bootBuildImage \
  --imageName="$IMAGE"

docker push "${IMAGE}"
