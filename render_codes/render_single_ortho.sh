#!/usr/bin/env bash
# Example: render one object with an orthographic camera.
# Set BLENDER_INSTALL_PATH to your local Blender installation used by BlenderProc.

CUDA_VISIBLE_DEVICES=0 \
blenderproc run --blender-install-path "${BLENDER_INSTALL_PATH:-/path/to/blender}" \
  blenderProc_ortho.py \
  --object_path ./data/sample_object.glb \
  --view 0 \
  --output_folder ./out_renderings/ \
  --object_uid sample_object \
  --ortho_scale 1.35 \
  --resolution 512
