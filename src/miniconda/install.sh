set -e

. ./library_scripts.sh


ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then \
        MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"; \
    elif [ "$ARCH" = "aarch64" ]; then \
        MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh"; \
    else \
        echo "Unsupported architecture: $ARCH"; exit 1; \
    fi && \
    clean_download $MINICONDA_URL $(basename $MINICONDA_URL) && \
    chmod +x $(basename $MINICONDA_URL) && \
    ./$(basename $MINICONDA_URL) -b -p /opt/conda && \
    rm $(basename $MINICONDA_URL)


echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc
echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.zshrc

teardown

echo 'Done!'