#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# check "conda" conda --version | grep 24.11.1
# check "conda-forge" conda config --show channels | grep conda-forge
# check "if conda-notice.txt exists" cat /usr/local/etc/vscode-dev-containers/conda-notice.txt

# Report result
reportResults