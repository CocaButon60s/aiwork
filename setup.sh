#!/bin/bash

[ ! -d "sd-scripts" ] && git clone https://github.com/kohya-ss/sd-scripts.git
[ ! -d "ComfyUI" ] && git clone https://github.com/comfyanonymous/ComfyUI.git
(
    cd ComfyUI/custom_nodes
    [ ! -d "comfyui-manager" ] && git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager
)