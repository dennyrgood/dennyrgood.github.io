# ComfyUI Face-Preserving Cleanup Workflow Guide

## Overview
This workflow fixes composite images with multiple faces by addressing seams, lighting differences, and color mismatches while keeping all faces exactly as they are.

---

## How This Workflow Works

1. **Face Detection**: Automatically detects all faces using UltralyticsDetector
2. **Face Protection**: Creates masks to lock faces exactly as they are
3. **ControlNet Tile**: Preserves overall structure while harmonizing everything else
4. **Low Denoising (0.35)**: Fixes seams, lighting, and colors without major changes

---

## Required Models & Extensions

### ComfyUI Extensions (Install via ComfyUI Manager)
- **ComfyUI-Impact-Pack** (for FaceDetailer node)
- **ComfyUI-Advanced-ControlNet**

### Models to Download

**Checkpoint Model:**
- realisticVisionV60B1_v51VAE.safetensors (or any realistic SD1.5 model)
- Place in: `ComfyUI/models/checkpoints/`

**ControlNet Model:**
- control_v11f1e_sd15_tile.pth
- Download from: https://huggingface.co/lllyasviel/ControlNet-v1-1/tree/main
- Place in: `ComfyUI/models/controlnet/`

**Face Detector:**
- bbox/face_yolov8m.pt (auto-downloads when you install Impact Pack)

---

## Installation Steps

1. **Install Extensions:**
   - Open ComfyUI Manager (click Manager button)
   - Search for "ComfyUI-Impact-Pack"
   - Click Install
   - Search for "ComfyUI-Advanced-ControlNet"
   - Click Install
   - Restart ComfyUI

2. **Download Models:**
   - Download the checkpoint model and place in checkpoints folder
   - Download ControlNet Tile model and place in controlnet folder
   - Face detector will download automatically

3. **Load Workflow:**
   - Open ComfyUI
   - Drag and drop the workflow JSON file into the ComfyUI window

---

## Key Settings to Adjust

| Setting | Default | Description |
|---------|---------|-------------|
| **Denoise Strength** | 0.35 | Lower (0.25) for subtle fixes, higher (0.45) for aggressive cleanup |
| **ControlNet Strength** | 0.85 | How much to preserve structure - keep high |
| **Steps** | 20 | More steps = smoother results but slower |
| **CFG Scale** | 7 | How closely to follow prompt (7-8 recommended) |

---

## Usage Instructions

1. Load the workflow JSON into ComfyUI
2. In the **LoadImage** node, click and upload your composite image
3. Click **Queue Prompt** to run
4. Wait for processing to complete
5. Check the result in the **SaveImage** node
6. If faces changed even slightly, lower denoise to 0.25-0.30 and re-run
7. If cleanup isn't strong enough, increase denoise to 0.40-0.45

---

## Workflow Prompts

**Positive Prompt:**
```
professional photo, unified lighting, consistent color temperature, seamless composition, harmonious, photorealistic, high quality
```

**Negative Prompt:**
```
seams, visible edges, color mismatch, inconsistent lighting, artifacts, blurry, low quality, different exposures
```

---

## Pro Tips

- **If faces still change slightly**: Lower denoise to 0.25-0.30
- **For severe color mismatches**: Run multiple passes with low denoise
- **Check face detection**: Look at the mask output to ensure all faces are detected
- **Manual mask editing**: You can manually edit the mask if detector misses faces
- **Multiple iterations**: Sometimes running 2-3 times with low denoise (0.25) works better than one high denoise pass
- **Background vs faces**: This workflow prioritizes face preservation - backgrounds will change more

---

## Troubleshooting

**Problem: Faces are changing**
- Solution: Lower denoise to 0.20-0.25
- Increase ControlNet strength to 0.90

**Problem: Seams still visible**
- Solution: Increase denoise to 0.40-0.45
- Increase steps to 30-40

**Problem: Not all faces detected**
- Solution: Check the mask output node
- Manually create a mask for missed faces
- Adjust face detection threshold in FaceDetailer

**Problem: Colors not matching**
- Solution: Run workflow 2-3 times
- Consider using a color correction node after
- Increase denoise slightly (0.40)

---

## Quick Start Checklist

- [ ] Install ComfyUI-Impact-Pack extension
- [ ] Install ComfyUI-Advanced-ControlNet extension
- [ ] Download realisticVisionV60B1_v51VAE.safetensors checkpoint
- [ ] Download control_v11f1e_sd15_tile.pth ControlNet model
- [ ] Load workflow JSON into ComfyUI
- [ ] Upload your composite image
- [ ] Run workflow
- [ ] Adjust denoise if needed

---

## Advanced Tips

### If you need even more control:

**Add a Color Correction Pass:**
- After the main workflow, you can add color matching nodes
- Use ImageBlend nodes to gradually blend the result with the original
- This gives you fine control over how much change is applied

**For Stubborn Seams:**
- Try running the workflow twice at denoise 0.30
- Use an inpainting workflow on specific seam areas
- Manually paint masks over problem areas

**Preserving More Detail:**
- Lower the CFG scale to 5-6 for softer processing
- Reduce steps to 15 for less aggressive changes
- Use a different sampler like "euler" for gentler results

---

## Support & Resources

- **ComfyUI GitHub**: https://github.com/comfyanonymous/ComfyUI
- **ComfyUI Manager**: https://github.com/ltdrdata/ComfyUI-Manager
- **Impact Pack**: https://github.com/ltdrdata/ComfyUI-Impact-Pack
- **ControlNet Models**: https://huggingface.co/lllyasviel/ControlNet-v1-1

---

**Created for fixing composite images with multiple faces while preserving facial features exactly as they are.**
