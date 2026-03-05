# Plex Metadata Transfer Guide (Mac to Windows)

Extracted from PDF: Plex Metadata Transfer Guide (Mac to Windows).pdf

---

Plex Metadata Transfer Guide: Mac to Windows
The Problem
Copying video files from a Mac Plex server to a Windows Plex server causes hours of scanning and metadata
downloading, especially problematic with slow internet at the remote location.

The Solution
Copy the Plex database and metadata from your Mac (home) to Windows (remote) so Plex doesn't need to
rescan or redownload anything.

Your Setup
• Home (Mac): Master Plex server
• Videos: /volume/macexternal/plexserver/videos
• TV Shows: /volume/macexternal/plexserver/series
• Remote (Windows): Secondary Plex server
• Videos: D:\videos
• TV Shows: D:\series
• D: drive is portable (carried between locations)
• Remote Access: Jump Desktop configured to home Mac

Step-by-Step Workflow
At Home (Mac)
1. Stop the Plex server
2. Copy these folders to your D: drive (create a temp folder like D:\plex_transfer ):
•

~/Library/Application Support/Plex Media Server/Metadata

•

~/Library/Application Support/Plex Media Server/Media

•

~/Library/Application Support/Plex Media Server/Plug-in Support/Databases

3. Optional but recommended: Compress these folders first to reduce size from ~6GB to ~3-4GB
4. Restart your home Plex server

At Remote (Windows)
1. Stop the Plex server (if running)
2. Copy the folders from D: drive to:

C:\Users\[YourUsername]\AppData\Local\Plex Media Server

Replace/merge the existing Metadata, Media, and Databases folders

3. Edit the database to fix file paths:
• Download and install DB Browser for SQLite
• IMPORTANT: Make a backup of this file first:

C:\Users\[YourUsername]\AppData\Local\Plex Media Server\Plug-in
Support\Databases\com.plexapp.plugins.library.db

• Open the .db file in DB Browser
• Go to "Execute SQL" tab
• Run these commands:

sql

UPDATE media_parts
SET file = REPLACE(file, '/volume/macexternal/plexserver/videos', 'D:/videos');
UPDATE media_parts
SET file = REPLACE(file, '/volume/macexternal/plexserver/series', 'D:/series');

4. Click "Write Changes" and close DB Browser
5. Start the Plex server
6. Verify in Plex:
• Go to Settings → Manage → Libraries
• Click "Scan Library Files" on each library
• Should complete almost instantly

Alternative: Speed Up Regular Scanning
If you don't want to copy metadata, at least disable these heavy features before scanning:
1. Settings → Manage → Libraries → Edit library → Advanced tab
2. Uncheck:
• Generate video preview thumbnails
• Generate chapter thumbnails
• Enable intro detection
This reduces scan time from hours to 30-60 minutes for most libraries.

Remote Transfer Option (If Needed)
If you're already at the remote site and need the metadata:

1. Via Jump Desktop: Connect to your Mac
2. Stop Plex on the Mac
3. Compress the 3 folders (right-click → Compress)
4. Upload to cloud storage (Google Drive, Dropbox, etc.)
5. Download at remote (will be slow with bad internet, but still better than Plex downloading all metadata)
6. Follow the Windows steps above
Note: With very slow remote internet, this could take a long time but is still faster than letting Plex download
metadata for your entire library.

Current Situation Recommendation
Given your ancient Surface 3 machine and terrible remote internet:
Best approach: Wait for the Surface Go setup
• Don't torture the Surface 3
• Set up Plex fresh on Surface Go when ready
• Do ONE scan with heavy features disabled
• Next time home, implement this metadata transfer workflow
• Future updates will be instant

Troubleshooting
Plex won't stop scanning:
• Open Task Manager (Ctrl+Shift+Esc)
• Find "Plex Media Server" processes
• End Task on all of them
• If machine is frozen, restart computer
Libraries show as empty after database edit:
• Check your SQL paths match exactly: D:/videos not D:\videos (forward slashes)
• Verify files actually exist at those paths on D: drive
• Restore database backup and try again
Database file is locked:
• Make sure Plex server is completely stopped
• Check Task Manager for any lingering Plex processes

Notes

• Database size: ~6GB (Metadata + Media + Databases combined)
• Use forward slashes (/) in SQL even for Windows paths
• Always backup the database before editing
• The portable D: drive carries both media files and metadata transfer folders

