### Updated Setup for Your Specific Workflow

Based on the provided ComfyUI server (image.ldmathes.cc) and the attached `SimpleZpoodle.json` workflow, here's how to integrate it into OpenWebUI for image generation. This builds on the previous steps, focusing on your custom workflow. Assume ComfyUI is running on the standard port (8188); if it's different, adjust the URL accordingly (e.g., http://image.ldmathes.cc:8188). Ensure the server is accessible from where OpenWebUI is hosted—if they're on the same network or machine, use the local IP if needed for security.

#### Step 1: Verify and Prepare ComfyUI
1. Access your ComfyUI instance at `http://image.ldmathes.cc:8188` (or the correct port). If it's not running, start it on the server (e.g., via SSH: `python main.py --listen 0.0.0.0 --port 8188` for remote access).
2. Download the model specified in the workflow: "z-image-turbo-fp8-aio.safetensors" (likely from Hugging Face or CivitAI). Place it in ComfyUI's `models/checkpoints` folder on the server.
3. Save the attached JSON content as `SimpleZpoodle.json` on your local machine.
4. In ComfyUI's UI:
   - Click "Load" and upload `SimpleZpoodle.json` to import the workflow.
   - Test it: Queue the prompt. It should generate a realistic brown poodle image based on the detailed prompt (100 steps for higher quality).
5. Enable Dev Mode:
   - Click the gear icon near "Queue Prompt."
   - Check "Enable Dev mode Options."
6. Export the API format:
   - Click "Save (API Format)" to download `workflow_api.json`. This is crucial for OpenWebUI integration, as it converts the workflow to a prompt-based API structure.

#### Step 2: Configure OpenWebUI
1. Open OpenWebUI (e.g., http://localhost:3000 if local).
2. Go to **Admin Panel** > **Settings** > **Images** tab.
3. Set **Image Generation Engine** to **ComfyUI**.
4. Enter the **ComfyUI API URL**: `http://image.ldmathes.cc:8188/` (include the trailing slash; use HTTPS if your server supports it).
   - If OpenWebUI is in Docker, add environment variables to your `docker-compose.yml` or run command:
     ```
     COMFYUI_BASE_URL=http://image.ldmathes.cc:8188/
     ENABLE_IMAGE_GENERATION=True
     ```
     Then restart the container.
5. Toggle **Image Generation (Experimental)** ON.
6. Test the connection: OpenWebUI should show a success message. If not, check server logs for CORS issues (add `--enable-cors-header` to ComfyUI startup if needed) or network connectivity.

#### Step 3: Upload and Map the Workflow
1. In the **Images** tab, find the **ComfyUI Workflow** upload section.
2. Upload the `workflow_api.json` from Step 1.
3. After upload, configure the node mappings (these are based on analyzing your `SimpleZpoodle.json`):
   - **Positive Prompt Node ID**: 2 (this is the CLIPTextEncode node with the detailed poodle prompt; OpenWebUI will override its text with user inputs).
   - **Negative Prompt Node ID**: 3 (the "blurry" node; will be overridden).
   - **Seed Node ID**: 5 (the KSampler node; input name is "seed").
   - **Other optional mappings** (if available in your OpenWebUI version):
     - Steps Node ID: 5 (input: "steps")
     - CFG Node ID: 5 (input: "cfg")
     - If your OpenWebUI supports custom inputs, note the sampler is "euler" and scheduler "simple" in node 5.
   - Model is loaded via node 1; ensure it's compatible (this workflow uses a turbo FP8 model for faster generation).
4. Save the changes. OpenWebUI will now use this workflow as the backend for image gen.

#### Step 4: Generate Images in OpenWebUI
1. Start a chat in OpenWebUI.
2. Use a prompt like: "@image Generate an image of [your description]" (the "@image" prefix may be needed in some OpenWebUI setups to trigger image gen; check your version's docs).
   - Example: "@image A fluffy white cat in a similar style to the poodle workflow."
   - OpenWebUI will pass the description to the positive prompt node (ID 2), keep the negative as "blurry" or override if specified, randomize/fix the seed, and run the workflow on your ComfyUI server.
3. The generated image will appear inline in the chat response.
4. Customization tips:
   - For variations, modify the workflow in ComfyUI (e.g., add LoRAs or controlnets), re-export API, and re-upload.
   - If generations are slow, reduce steps from 100 to 20-50 in the workflow.
   - Monitor ComfyUI's console for errors during API calls.

#### Troubleshooting
- **Connection Errors**: Ensure no firewall blocks port 8188. Test with `curl http://image.ldmathes.cc:8188/` from the OpenWebUI host.
- **Model Not Found**: Double-check the model path in the workflow (it's "Z-image\z-image-turbo-fp8-aio.safetensors"—note the backslash; fix to forward slash if needed on Linux servers).
- **Node Mapping Issues**: If OpenWebUI throws errors, inspect `workflow_api.json` (it's a dict of node IDs with inputs). Adjust IDs accordingly.
- **Remote Server**: If image.ldmathes.cc is public, secure it with auth (ComfyUI supports `--auth` flags).
- For advanced setups, join the OpenWebUI Discord or check their GitHub for ComfyUI-specific issues.

This should get you generating images directly in OpenWebUI using your poodle workflow as a base. If the port isn't 8188 or you hit a specific error, share details!
