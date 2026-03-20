FROM pytorch/pytorch:2.10.0-cuda13.0-cudnn9-runtime


COPY --chmod=744 <<EOF /entrypoint.sh
#!/bin/bash

apt update
apt install -y git libx11-xcb1 libxrender1 libglib2.0-0 libopencv-dev
rm -rf /var/lib/apt/lists/*

(
    cd sd-scripts
    [ ! -d ".venv" ] && uv venv
    uv pip install -r requirements.txt
)
(
    cd ComfyUI
    [ ! -d ".venv" ] && uv venv
    uv pip install -r requirements.txt
    uv run python main.py --listen 0.0.0.0
)
EOF
