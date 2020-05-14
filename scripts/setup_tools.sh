#!/usr/bin/env bash

# --- Script Options ---
set -o errexit
set -o pipefail
set -o nounset

# --- Variables ---
declare setuptools_sh_DIR
setuptools_sh_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

declare project_DIR
project_DIR=$(cd "$(dirname "${setuptools_sh_DIR}")" &> /dev/null && pwd)

# --- Libraries ---
if [[ -d "${setuptools_sh_DIR}/lib" ]]; then
  # shellcheck source=SCRIPTDIR/lib/lib.sh
  . "${setuptools_sh_DIR}/lib/lib.sh"
fi

# --- Actions ---
function check_python_path() {
  command -v which python | grep -e cvcb &> /dev/null
}

function setuptools_sh_usage() {
  echo "$0 usage:" && grep "[[:space:]].)\ #" "$0" \
    | sed 's/#//' \
    | sed -r 's/([a-z])\)/-\1/'
}

function setuptools_sh_build() {
  if [[ "$(check_python_path)" ]]; then
    cd "${project_DIR}" || return 1

    __log_msg -i -m "Building and installing"

    python setup.py develop -e -b ./build

    cd - || return 1
  fi
}

function setuptools_sh_run() {
  if [[ "$(check_python_path)" ]]; then
    cd "${project_DIR}" || return 1

    __log_msg -i -m "Running"

    "${CONDA_PREFIX:?}"/bin/cvcb

    cd - || return 1
  fi
}

function setuptools_sh_clean() {
  if [[ "$(check_python_path)" ]]; then
    if [[ -d "${project_DIR}" ]]; then
      cd "${project_DIR}"
    else
      __log_msg -e -m "Dir [${project_DIR}] not found."
    fi

    __log_msg -i -m "Removing installation"

    python setup.py develop -u

    rm -rf "${project_DIR}/cvcb/__pycache__"
    rm -rf "${project_DIR}/cvcb.egg-info"
    rm "${CONDA_PREFIX:?}"/bin/cvcb

    cd - || return 1
  fi
}

function setuptools_sh_build_run_clean() {
  setuptools_sh_build \
    && setuptools_sh_run \
    && setuptools_sh_clean
}

# --- Options and Arguments ---
[ $# -eq 0 ] && setuptools_sh_usage
while getopts "hbrca" arg; do
  case $arg in
    h)
      setuptools_sh_usage
      ;;
    b)
      setuptools_sh_build
      ;;
    r)
      setuptools_sh_run
      ;;
    c)
      setuptools_sh_clean
      ;;
    a)
      setuptools_sh_build_run_clean
      ;;
    *)
      setuptools_sh_usage
      ;;
  esac
done

# --- Cleanup ---
## Variables
unset setuptools_sh_DIR
unset project_DIR

## Functions
unset check_python_path
unset setuptools_sh_usage
unset setuptools_sh_build
unset setuptools_sh_run
unset setuptools_sh_clean
unset setuptools_sh_build_run_clean
unset setuptools_sh_usage
