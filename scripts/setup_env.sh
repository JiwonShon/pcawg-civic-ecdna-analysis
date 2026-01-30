#!/usr/bin/env bash
set -euo pipefail

ENV_NAME="${ENV_NAME:-ecDNA_drug_env}"
ENV_FILE="${ENV_FILE:-environment.yml}"
FORCE_RECREATE="${FORCE_RECREATE:-0}"

source "$(conda info --base)/etc/profile.d/conda.sh"

echo ">>> ENV_NAME=${ENV_NAME}"
echo ">>> ENV_FILE=${ENV_FILE}"

if conda env list | awk '{print $1}' | grep -qx "${ENV_NAME}"; then
  if [[ "${FORCE_RECREATE}" == "1" ]]; then
    echo ">>> Environment exists. Removing (FORCE_RECREATE=1)..."
    conda env remove -n "${ENV_NAME}" -y
  else
    echo ">>> Environment '${ENV_NAME}' already exists."
    echo ">>> Activate: conda activate ${ENV_NAME}"
    echo ">>> Recreate: FORCE_RECREATE=1 ./setup_env.sh"
    exit 0
  fi
fi

echo ">>> Creating environment from ${ENV_FILE}..."
conda env create -f "${ENV_FILE}"

echo ">>> Activating ${ENV_NAME}..."
conda activate "${ENV_NAME}"

echo ">>> Registering Jupyter kernel..."
python -m ipykernel install --user --name "${ENV_NAME}" --display-name "Python 3.9 (${ENV_NAME})"

echo ">>> Setup Complete!"
echo "To activate: conda activate ${ENV_NAME}"
