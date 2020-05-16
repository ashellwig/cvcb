#!/usr/bin/env bash

# --- Script Options ---
set -o errexit
set -o pipefail
set -o nounset

# --- Variables ---
declare update_env_DIR
update_env_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

declare project_DIR
project_DIR=$(cd "$(dirname "${update_env_DIR}")" &> /dev/null && pwd)

# --- Libraries ---
# shellcheck source=SCRIPTDIR/lib/lib.sh
. "${update_env_DIR}/lib/lib.sh"

# --- Actions ---
function __update_env_usage() {
  echo "$0 usage:" && grep "[[:space:]].)\ #" "$0" \
    | sed 's/#//' \
    | sed -r 's/([a-z])\)/-\1/'
}

function __update_env_all() {
  # shellcheck disable=SC2143
  if (echo "$CONDA_PREFIX" | grep -Eq 'cvcb$'); then
    __log_msg -s -m "Found correct conda environment: ${CONDA_PREFIX}"
  else
    __log_msg -e -m "Please activate the cvcb conda environment."
  fi

  cd "${project_DIR}"
  conda env export --file environment.yml --from-history
}

# --- Options and Arguments ---
[ $# -eq 0 ] && __update_env_usage
while getopts ":ha" arg; do
  case $arg in
    a)
      __log_msg -i -m "Updating all (${arg})"
      __update_env_all
      if [[ "$?" -eq 0 ]]; then
        __log_msg -s -m "Successfully updated all requirements files"
      else
        __log_msg -e -m "Failed to updated all requirements files"
      fi
      ;;
    h)
      __update_env_usage
      ;;
    *)
      __update_env_usage
      ;;
  esac
done

# --- Cleanup ---
## Variables
unset update_env_DIR
unset project_DIR

## Functions
unset __update_env_all
unset __update_env_usage

# --- Exit Cleanly ---
true
