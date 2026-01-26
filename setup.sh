#!/bin/bash

git submodule update --init --recursive
if [ ! -L ComfyUI/user/default/workflows ]; then
    mkdir -p ComfyUI/user/default
    ln -s ../../../workflows ComfyUI/user/default/workflows
fi
(
    cd ComfyUI/custom_nodes
    git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager --depth 1
    # resize image and remove bg
    git clone https://github.com/cubiq/ComfyUI_essentials.git comfyui_essentials --depth 1
)