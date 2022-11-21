#!/bin/bash
set -e

DEBIAN_VERSION=11.5
CONFIG_FILENAME="server.config"

SCRIPT_FILENAME="$(basename ${BASH_SOURCE})"
BASE_DIR="$(dirname ${BASH_SOURCE})"

HELP=$(cat << EOF
SYNOPSIS
    ${SCRIPT_FILENAME} [-h]

DESCRIPTION
    Bootstrap a new Debian server using a configuration file.

    Given a freshly installed headless Debian ${DEBIAN_VERSION} server, this
    script configures it as per the settings found in the configuration
    file: ${CONFIG_FILENAME}

OPTIONS
    -h  Display this help
EOF
)

echo "${HELP}"

