# dennyrgood.github.io
# MyWebsiteGIT
A GitHub Pages site hosting USDZ 3D models with thumbnails.

## Scripts
- **usdz_thumbnailer.swift**: Swift script to generate PNG thumbnails from USDZ files.
- **generate_usdz_thumbnails.sh**: Generates thumbnails for all USDZ files.
- **generate_index_with_USDZ.sh**: Creates `index.html` with USDZ links.
- **deploy.sh**: Commits and pushes changes to GitHub.
- **refresh.sh**: Runs thumbnail generation, index generation, and deployment.

## Usage
1. Add new `.usdz` files to the repository.
2. Run `./refresh.sh` to generate thumbnails, update `index.html`, and deploy.
