#!/usr/bin/env bash
# Example: render one object with a perspective camera.

blenderproc run --blender-install-path "${BLENDER_INSTALL_PATH:-/path/to/blender}" \
  blenderProc_persp.py \
  --object_path ./data/sample_object.glb \
  --view 0 \
  --output_folder ./out_renderings/ \
  --object_uid sample_object \
  --radius 2.0
