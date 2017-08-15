#!/usr/bin/env bash
INSTALL_DIR="${1:-${HOME}}" # "${HOME}"

readonly MINICONDA_URL="https://repo.continuum.io/miniconda" ## 4.3.21
readonly CONDA="Miniconda3"
readonly CONDA_VERSION="4.3.21" # "latest"; "4.3.21" # July 2017: latest
readonly ARCH="Linux-x86_64" # MacOSXx86_64

echo "[INFO: $(date)] Installing: ${CONDA}-${CONDA_VERSION}-${ARCH}"
echo "[INFO: $(date)] Installation Directory: ${INSTALL_DIR}"

CONDA_BASH_INSTALL="${CONDA}-${CONDA_VERSION}-${ARCH}.sh"

# install
CMD1="wget --quiet -nc ${MINICONDA_URL}/${CONDA_BASH_INSTALL} -O ${INSTALL_DIR}/conda_install.sh"
CMD2="bash ${INSTALL_DIR}/conda_install.sh -b -p ${INSTALL_DIR}/${CONDA}"
CMD3="rm -v ${INSTALL_DIR}/conda_install.sh"

echo "[INFO: $(date)] Running CMD: ${CMD1}"

${CMD1} | tee -a ${INSTALL_DIR}/conda-install-$(date +%y%m%d%M).log

echo "[INFO: $(date)] Running CMD: ${CMD2}"
${CMD2} | tee -a ${INSTALL_DIR}/conda-install-$(date +%y%m%d%M).log

echo "[INFO: $(date)] Running CMD: ${CMD3}"
${CMD3} | tee -a ${INSTALL_DIR}/conda-install-$(date +%y%m%d%M).log

echo "[INFO: $(date)] Adding Conda to PATH"
export PATH="${INSTALL_DIR}/${CONDA}/bin:${PATH}"

echo "[INFO: $(date)] Conda Version $(conda -V)"

echo "[INFO: $(date)] END"