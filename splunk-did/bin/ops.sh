#!/usr/bin/env bash

set -euo pipefail

IMAGE_NAME=${IMAGE_NAME:-ubuntu}
IMAGE_VERSION=${IMAGE_VERSION:-latest}
WORK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../" && pwd)"

env+=(--env TMPDIR=/tmp)

env+=(--env PYTHONHTTPSVERIFY=0)
env+=(--env CURL_CA_BUNDLE="")

# using --tty causes output to use CRLF line endings, which is problematic
# when trying to handle the output programmatically. so we only request
# a tty if both stdin _and_ stdout are already ttys.
# https://github.com/moby/moby/issues/8513
_flags="--interactive"
[[ -t 0 && -t 1 ]] && _flags="${_flags} --tty"

# env or volumes may be an empty array which bash treats as unset
set +u

exec docker run \
  --rm \
  ${_flags} \
  "${volumes[@]}" \
  "${env[@]}" \
  "${IMAGE_NAME}:${IMAGE_VERSION}" \
  "$@" ls 
