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

USER user
RUN git clone https://github.com/comfyanonymous/ComfyUI.git --depth 1
WORKDIR /app/ComfyUI
RUN pip install --no-cache-dir -r requirements.txt
WORKDIR /app/ComfyUI/custom_nodes
RUN git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager --depth 1
