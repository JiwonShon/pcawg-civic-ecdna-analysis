# pcawg-civic-ecdna-analysis
AI-assisted, reproducible genomics analysis using public PCAWG metadata and CIViC evidence (Jupyter + conda)


알겠슈. 네가 적어준 3개 항목을 그대로 살려서, **GitHub 루트의 `README.md`에 바로 붙여넣으면 되는 형태**로 만들어줄게유. (한글+영문 혼합 없이, 깔끔한 **영문 README**로 가는 게 국제 심사/공개에 제일 무난해서 영문 버전으로 제안하고, 아래에 한글 버전도 같이 드릴게유.)

---

## README.md (영문 템플릿 — 그대로 복붙)

````md
# pcawg-civic-ecdna-analysis

Reproducible analysis of public PCAWG clinical metadata integrated with CIViC evidence using Jupyter notebooks.

## Data sources & download

### PCAWG clinical metadata (public S3)
This project downloads the PCAWG donor clinical metadata Excel file from a public S3 bucket using AWS CLI with `--no-sign-request` and a custom endpoint.

Example:
```bash
aws s3 cp s3://icgc25k-open/PCAWG/clinical_and_histology/pcawg_donor_clinical_August2016_v9.xlsx pcawg_meta/ \
  --endpoint-url https://object.genomeinformatics.org --no-sign-request
````

### CIViC data

CIViC data is retrieved in `notebooks/01_CIViC_request.ipynb` (via API / download workflow implemented in the notebook).

## How to run

1. Create the conda environment:

   ```bash
   ./scripts/setup_env.sh
   conda activate ecDNA_drug_env
   ```

2. Download PCAWG metadata:

   ```bash
   ./scripts/download_pcawg_meta.sh
   ```

3. Run notebooks in order:

   * `notebooks/01_CIViC_request.ipynb`
   * `notebooks/02_pcawg_analysis.ipynb`

## AI usage disclosure

This work used multiple AI tools with clear role separation:

* Hypothesis building & theoretical framing: Perplexity
* Outline drafting / structure: Gemini
* Code writing & debugging: ChatGPT

## Repository structure (recommended)

* `notebooks/`: analysis notebooks (run in order)
* `scripts/`: setup and data download scripts
* `data/`: local data directory (not committed)
* `results/`: generated figures/tables (optional to commit if small)

## Notes

* Do **not** commit credentials or private keys. This repo uses public data access (`--no-sign-request`).
* If you change dependencies, update `environment.yml`.

````

> 위에서 `notebooks/` / `scripts/` 경로는 “네가 실제로 그렇게 폴더 정리한 경우” 기준이에요. 아직 루트에 파일이 있다면, 경로만 살짝 바꿔서 쓰면 돼유.

---

## README.md (한글 버전 — 원하면 이걸로)
```md
# pcawg-civic-ecdna-analysis

공개 PCAWG 임상 메타데이터와 CIViC evidence를 통합하여 분석하는 재현 가능한(Jupyter 기반) 프로젝트입니다.

## 데이터 출처 & 다운로드

### PCAWG 임상 메타데이터 (공개 S3)
본 프로젝트는 AWS CLI를 사용하여 공개 S3 버킷에서 `--no-sign-request` 옵션으로 PCAWG donor clinical xlsx 파일을 다운로드합니다(커스텀 endpoint 사용).

예시:
```bash
aws s3 cp s3://icgc25k-open/PCAWG/clinical_and_histology/pcawg_donor_clinical_August2016_v9.xlsx pcawg_meta/ \
  --endpoint-url https://object.genomeinformatics.org --no-sign-request
````

### CIViC 데이터

CIViC 데이터는 `notebooks/01_CIViC_request.ipynb`에서 API/다운로드 방식으로 수집되며(노트북에 구현), 이후 분석에 사용됩니다.

## 실행 순서

1. conda 환경 생성 및 활성화

   ```bash
   ./scripts/setup_env.sh
   conda activate ecDNA_drug_env
   ```

2. PCAWG 메타데이터 다운로드

   ```bash
   ./scripts/download_pcawg_meta.sh
   ```

3. 노트북 순서대로 실행

   * `notebooks/01_CIViC_request.ipynb`
   * `notebooks/02_pcawg_analysis.ipynb`

## AI 사용 고지

본 작업은 아래와 같이 역할을 분리하여 여러 AI 도구를 사용했습니다.

* 가설/이론 구성: Perplexity
* 개요/구조 작성: Gemini
* 코드 작성/디버깅: ChatGPT

## 폴더 구조(권장)

* `notebooks/`: 분석 노트북(순서대로 실행)
* `scripts/`: 환경 세팅/데이터 다운로드 스크립트
* `data/`: 로컬 데이터 저장(커밋하지 않음)
* `results/`: 생성된 figure/table(용량이 작으면 커밋 가능)

## 주의사항

* credential/private key 등 민감정보는 절대 커밋하지 마세요.
* 의존성 변경 시 `environment.yml`을 업데이트하세요.

```

---

## 네 repo 상태에 맞춰 “경로만” 고치면 되는 포인트
- 아직 `scripts/` / `notebooks/`로 안 옮겼으면:
  - `./scripts/setup_env.sh` → `./setup_env.sh`
  - `notebooks/01...` → `CIViC_request.ipynb` 이런 식으로만 바꿔서 바로 쓸 수 있어유.

---

원하면, 네가 **지금 실제로 GitHub에 정리한 폴더 구조**(루트 파일 목록)만 한 번 보여주면, 내가 README를 **현재 구조에 100% 맞춰서** 경로까지 정확히 확정해드릴게유.
::contentReference[oaicite:0]{index=0}
```
