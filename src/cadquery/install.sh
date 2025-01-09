set -e

. ./library_scripts.sh

# # nanolayer is a cli utility which keeps container layers as small as possible
# # source code: https://github.com/devcontainers-contrib/nanolayer
# # `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# # and if missing - will download a temporary copy that automatically get deleted at the end 
# # of the script
ensure_nanolayer nanolayer_location "v0.5.4"


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/openorion/features/miniconda:latest"

$nanolayer_location install apt-get libgl1-mesa-glx
. /opt/conda/etc/profile.d/conda.sh && \
conda activate base && \
if [ "$VERSION" = "latest" ]; then
    conda install -n base -c conda-forge -c cadquery -y
else
    conda install -n base -c conda-forge -c cadquery cadquery=$VERSION -y
fi && \
pip install ezdxf --upgrade

teardown

echo 'Done!'