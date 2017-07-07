#!/usr/bin/env bash
INSTALL_DIR="${1-HOME}" # "${HOME}"
readonly ANCONDA_URL="https://repo.continuum.io/archive" ## 4.4.0
readonly CONDA="Anaconda3"
readonly CONDA_VERSION="4.4.0" # 4.4.0
readonly ARCH="Linux-x86_64" # MacOSXx86_64
echo "[INFO: $(date)] Installing: ${CONDA}-${CONDA_VERSION}-${ARCH}"
echo "[INFO: $(date)] Installation Directory: ${INSTALL_DIR}"
CONDA_BASH_INSTALL="${CONDA}-${CONDA_VERSION}-${ARCH}.sh"
# install
wget ${MINICONDA_URL}/${CONDA_BASH_INSTALL} -O ${INSTALL_DIR}/conda_install.sh && \
bash ${INSTALL_DIR}/conda_install.sh -b -p ${INSTALL_DIR}/${CONDA} && \
rm ${INSTALL_DIR}/conda_install.sh && \
export PATH="${INSTALL_DIR}/${CONDA}/bin:${PATH}"
