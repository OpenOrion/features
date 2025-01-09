#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# testing conda installation of cadquery
check "cadquery test" conda run -n base python -c "import cadquery"

# Report result
reportResults