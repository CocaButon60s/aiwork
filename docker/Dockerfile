FROM pytorch/pytorch:2.10.0-cuda13.0-cudnn9-runtime

ENV LD_LIBRARY_PATH=/opt/conda/lib/python3.11/site-packages/nvidia/cu13/lib:$LD_LIBRARY_PATH

RUN <<EOF
apt-get update
apt-get install -y --no-install-recommends git
apt-get install -y libxcb1 libx11-xcb1 libxrender1 libgl1-mesa-glx libglib2.0-0
apt-get install -y cargo
rm -rf /var/lib/apt/lists/*
EOF
RUN cargo install safetensors-cli

RUN <<'EOF' >> /root/.bashrc
export PATH=$PATH:/root/.cargo/bin
EOF

COPY --chmod=744 <<EOF /entrypoint.sh
#!/bin/bash
(
    cd sd-scripts
    python -m venv venv
    ./venv/bin/pip install --no-cache-dir -r requirements.txt
    ./venv/bin/pip install torchvision
)
(
    cd ComfyUI
    python -m venv venv
    ./venv/bin/pip install --no-cache-dir -r requirements.txt
    ./venv/bin/pip install rembg[gpu] accelerate diffusers opencv-python mistral-common
    ./venv/bin/python main.py --listen 0.0.0.0
)
EOF
