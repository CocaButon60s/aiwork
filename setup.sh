#!/bin/bash

git submodule update --init --recursive
if [ ! -L ComfyUI/user/default/workflows ]; then
    mkdir -p ComfyUI/user/default
    ln -s ../../../workflows ComfyUI/user/default/workflows
fi
(
    cd ComfyUI/custom_nodes
    if [ ! -d comfyui-manager ]; then
        git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager --depth 1
    fi
    # resize image and remove bg
    if [ ! -d comfyui_essentials ]; then
        git clone https://github.com/cubiq/ComfyUI_essentials.git comfyui_essentials --depth 1
    fi
)