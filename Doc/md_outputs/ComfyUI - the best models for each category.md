For ComfyUI on Windows 11 with an RTX 5090, here are the best models for each category:

## **Background Removal (Photorealistic)**

**RMBG-2.0** or **BiRefNet** are your best options. RMBG-2.0 is specifically designed for high-quality background removal and works excellently with photorealistic images. BiRefNet offers even better edge detection and handles complex scenes like hair and transparent objects exceptionally well. Both integrate seamlessly into ComfyUI through custom nodes.

## **Old Photo Restoration**

**CodeFormer** is the gold standard for old photo renewal. It excels at restoring faded colors, removing scratches, and enhancing facial details in vintage photos. **GFPGAN** is another excellent alternative, particularly good for face restoration. You might also want to look at **Bringing Old Photos Back to Life** models which handle both degradation and colorization.

## **Person Removal (Inpainting)**

**LaMa (Large Mask Inpainting)** is exceptional for removing people from images \- it handles large areas and complex backgrounds very well. For ComfyUI, you can also use **SD 1.5 or SDXL inpainting models**. With your 5090, SDXL inpainting will give you excellent results. **MAT (Mask-Aware Transformer)** is another strong option specifically designed for object removal.

## **Converting People to Puppets**

**ControlNet with Canny or OpenPose** combined with a style-specific checkpoint (like a cartoon or claymation model) works great for this. You'd use ControlNet to maintain the pose/composition while applying a puppet aesthetic. Models like **Anything V5** or **DreamShaper** can be fine-tuned or prompted for puppet-like aesthetics. You might also explore **IP-Adapter** with puppet reference images for style transfer.

With your 5090's 32GB VRAM, you can run these models simultaneously in complex workflows without memory issues, which is perfect for ComfyUI's node-based approach.

I like the clay mation idea, tell me more

Jan 1

Claymation-style conversions are fantastic and your 5090 will handle them beautifully\! Here's how to achieve that look in ComfyUI:

## **Core Approach**

**ControlNet \+ Style-Specific Models** is your best bet. You'll want to:

1. **Extract the pose/structure** from your original photo using ControlNet preprocessors (OpenPose for body structure, or Canny/Depth for overall composition)  
2. **Apply a claymation aesthetic** through specialized checkpoints or LoRAs

## **Best Models for Claymation**

**Checkpoints:**

* **Protogen** series \- naturally produces that sculptural, clay-like texture  
* **DreamShaper** \- great for stylized renders with malleable, physical qualities  
* **Realistic Vision** with heavy prompting can achieve a stop-motion clay look

**LoRAs** (these are key):

* Search for "claymation," "clay animation," or "stop motion" LoRAs on Civitai  
* **"Aardman style"** LoRAs (Wallace & Gromit aesthetic)  
* **Plasticine/Play-Doh style** LoRAs for that textured, moldable appearance

## **Workflow Strategy**

Your ComfyUI workflow would look something like:

1. Load original image → **ControlNet (OpenPose or Depth)** to preserve subject structure  
2. Use **img2img** with a claymation-focused checkpoint \+ LoRA  
3. Prompts should include: "claymation, stop motion animation, clay figure, plasticine texture, studio lighting, handcrafted"  
4. Lower denoising strength (0.5-0.7) keeps more of the original pose intact  
5. Add **post-processing** for that slightly imperfect, handmade quality

## **Pro Tips**

* **Lighting matters**: Claymation has distinctive studio lighting. Include "soft studio lighting" or "three-point lighting" in prompts  
* **Texture is key**: Emphasize "visible clay texture," "fingerprint marks," or "moldable surface"  
* **Slight imperfections**: Real claymation has tiny imperfections \- sometimes adding subtle noise helps authenticity  
* **Background**: Generate simple, miniature-set-style backgrounds for the full effect

The 5090's power means you can run multiple ControlNet models simultaneously (pose \+ depth \+ canny) for maximum control while maintaining the artistic style. You could even batch process entire photo series into a coherent claymation world.

Want me to help you sketch out a specific ComfyUI node workflow for this?

