FROM python:3.11-slim

RUN apt-get update && apt-get install -y git

# Bring necessary files
COPY . /app/lmms-eval/

WORKDIR /app/lmms-eval

# Install dependencies
RUN pip install .
# Create volume mount point
VOLUME /app/lmms-eval/results

ENV CUDA_VISIBLE_DEVICES=""
ENV HF_TOKEN=""
ENV OPENAI_API_URL=""
ENV OPENAI_API_KEY=""

ENV MODEL_VERSION=""
ENV MODALITIES=image
ENV TASK=mme,mmmu,mmbench_en
ENV TASK_SUFFIX="${TASK//,/_}"

# Entrypoint is defined in teamcity
