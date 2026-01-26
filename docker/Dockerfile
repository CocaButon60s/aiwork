FROM pytorch/pytorch:2.9.1-cuda13.0-cudnn9-runtime

COPY <<EOF /etc/sudoers.d/user
user ALL=(ALL) NOPASSWD:ALL

EOF

RUN <<EOF
apt-get update
apt-get install -y --no-install-recommends git sudo
rm -rf /var/lib/apt/lists/*
EOF

WORKDIR /app
RUN <<EOF
groupadd -g 1000 user
useradd -m -u 1000 -g 1000 user
chown -R user:user /app
EOF

COPY --chown=user:user --chmod=744 <<EOF /entrypoint.sh
#!/bin/bash
pip install --no-cache-dir -r requirements.txt
# for comfyui-essentials
pip install rembg[gpu]

python main.py --listen 0.0.0.0

EOF
