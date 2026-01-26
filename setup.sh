#!/bin/bash

if [ ! -d "ComfyUI" ]; then
    git clone https://github.com/comfyanonymous/ComfyUI.git --depth 1
    (
        cd ComfyUI/custom_nodes
        git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager --depth 1
        # resize image and remove bg
        git clone https://github.com/cubiq/ComfyUI_essentials.git comfyui_essentials --depth 1
    )
fi