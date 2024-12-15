# Prepare rendering data

## Environment

Rendering scripts are based on [BlenderProc](https://github.com/DLR-RM/BlenderProc). BlenderProc uses the Blender Cycles engine by default, which can hang on some GPU models (for example, certain datacenter cards). See BlenderProc documentation if you hit rendering stalls.

```bash
cd ./render_codes
pip install -r requirements.txt
```

Set `BLENDER_INSTALL_PATH` to the Blender binary directory used by your BlenderProc install.

## Scripts

| Script | Camera |
|--------|--------|
| `blenderProc_ortho.py` | Orthographic |
| `blenderProc_persp.py` | Perspective |

### Render a single object (orthographic)

```bash
export BLENDER_INSTALL_PATH=/path/to/blender

blenderproc run --blender-install-path "$BLENDER_INSTALL_PATH" \
  blenderProc_ortho.py \
  --object_path ./data/sample_object.glb \
  --view 0 \
  --output_folder ./out_renderings/ \
  --object_uid sample_object \
  --ortho_scale 1.35 \
  --resolution 512 \
  --random_pose
```

- `--view`: tag for this render pass when you render the same asset multiple times
- `--ortho_scale`: object scale in the image
- `--random_pose`: apply a random rotation before rendering

### Render a single object (perspective)

```bash
blenderproc run --blender-install-path "$BLENDER_INSTALL_PATH" \
  blenderProc_persp.py \
  --object_path ./data/sample_object.glb \
  --view 0 \
  --output_folder ./out_renderings/ \
  --object_uid sample_object \
  --radius 2.0 \
  --random_pose
```

- `--radius`: camera distance from the object origin

### Distributed batch rendering

See `render_batch_ortho.sh` and `render_batch_persp.sh` for multi-GPU examples. Override `--objaverse_root`, `--save_folder`, and `--blender_install_path` for your environment.
