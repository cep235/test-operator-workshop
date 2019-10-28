#!/bin/bash

##################################################################
# ABOUT                                                          #
#                                                                #
# Installs prerequisite packages for building a simple operator  #
# on RHEL 7 or RHEL 8.                                           #
##################################################################


# Get the Red Hat release so that we can figure out which version of RHEL we're using
release=$(cat /etc/redhat-release)
rhel_version=

# Get RHEL version from kernel version
if [[ ${release} == *"7."* ]]; then
    rhel_version=7
elif [[ ${release} == *"8."* ]]; then
    rhel_version=8
else
    echo "ERROR. Unrecognized RHEL version. Exiting now."
    exit 1
fi

# Install packages
if [[ ${rhel_version} == "7" ]]; then
    pkg_installer="yum"
else
    pkg_installer="dnf"
fi

${pkg_installer} -y install git \
                            go \
			    mercurial \
			    podman

# Print out successes
echo "${pkg_installer} packages successfully installed."

# Check for kubectl/oc
if [ ! -x $(which oc) ] && [ ! -x $(which kubectl) ]; then
    echo "ERROR. Could not find 'oc' or 'kubectl'. Please install them or update your path."
fi

# Install Operator SDK. (Instructions aken from:
# https://github.com/operator-framework/operator-sdk/blob/master/doc/user/install-operator-sdk.md#install-from-github-release)
RELEASE_VERSION="v0.11.0"
curl -LO https://github.com/operator-framework/operator-sdk/releases/download/${RELEASE_VERSION}/operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu
chmod +x operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu && sudo mkdir -p /usr/local/bin/ && sudo cp operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu /usr/local/bin/operator-sdk && rm operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu
