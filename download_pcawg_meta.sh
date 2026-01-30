#!/usr/bin/env bash
set -euo pipefail

OUT_DIR="${1:-pcawg_meta}"
mkdir -p "${OUT_DIR}"

echo ">>> Downloading PCAWG clinical metadata to ${OUT_DIR} ..."

aws s3 cp \
  "s3://icgc25k-open/PCAWG/clinical_and_histology/pcawg_donor_clinical_August2016_v9.xlsx" \
  "${OUT_DIR}/pcawg_donor_clinical_August2016_v9.xlsx" \
  --endpoint-url "https://object.genomeinformatics.org" \
  --no-sign-request

echo ">>> Done."
ls -lh "${OUT_DIR}/pcawg_donor_clinical_August2016_v9.xlsx"
