#!/bin/bash

git submodule update --init --recursive
(
    cd ComfyUI/custom_nodes
    if [ ! -d comfyui-manager ]; then
        git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager
    fi
)
