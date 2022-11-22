#!/bin/bash

# exit script immediately on non-zero status
set -e

PROGRAM_NAME="Debian Bootstrapper"
PROGRAM_VERSION="1.0.0-SNAPSHOT"
DEBIAN_VERSION=11.5
CONFIG_FILENAME="server.conf"
REPO_SOURCE_URL="https://github.com/genebarker/deb11base/raw/master"
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

display_script_info()
{
    echo "${PROGRAM_NAME} for Debian ${DEBIAN_VERSION}"
    echo "Version ${PROGRAM_VERSION} - MIT License"
}

has_default_config_file()
{
    if [ -f ${BASE_DIR}/${CONFIG_FILENAME} ]
    then
        echo ".. found default config file (${CONFIG_FILENAME})"
        return 0
    else
        echo ".. no default config file found (${CONFIG_FILENAME})"
        return 1
    fi

    return $result
}

get_default_config_file()
{
    echo ".. downloading default config file from repo"
    wget ${REPO_SOURCE_URL}/${CONFIG_FILENAME}
    echo ".. config file download successful"
}

display_script_info

if ! has_default_config_file
then
    get_default_config_file
fi

echo
echo "${HELP}"

