FROM conda/miniconda3

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        make \
        git \
        nano \
        # for matplotlib
        libxext6 && \
    rm -rf /var/lib/apt/lists/*

ENV HOME=/home/developer
WORKDIR ${HOME}
COPY requirements.txt .
RUN pip install --upgrade --no-cache-dir pip && \
    pip install --no-cache-dir -r requirements.txt