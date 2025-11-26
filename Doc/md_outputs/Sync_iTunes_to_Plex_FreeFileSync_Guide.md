# Syncing iTunes Library from Windows 11 to macOS Plex using FreeFileSync

This guide explains how to mirror your iTunes (Windows 11) music library
and playlists to a Plex Media Server running on macOS using
FreeFileSync. It supports incremental updates, so only new or changed
files are copied each time.

## Overview

Goal:\
• Copy new or updated songs from Windows iTunes library to Plex server
on macOS.\
• Copy iTunes Music Library.xml (for playlists).\
• Perform incremental updates.\
• Optionally delete removed songs to keep Plex tidy.

## Step 1: Prepare Your Windows iTunes Library

Default paths on Windows:\
C:\\Users\\\<YourName\>\\Music\\iTunes\\iTunes Media\\\
C:\\Users\\\<YourName\>\\Music\\iTunes\\iTunes Music Library.xml

If the XML file is missing, open iTunes → Edit → Preferences → Advanced
→ enable \'Share iTunes Library XML with other applications\', then
restart iTunes.

## Step 2: Make Your Mac Folder Accessible from Windows

1\. On macOS, open System Settings → General → Sharing → enable File
Sharing.\
2. Click the "i" next to File Sharing → add your Plex music folder, e.g.
/Users/\<YourName\>/Music/PlexMusic/.\
3. Under Options, enable SMB file sharing and check your user account.\
4. Note the network address (e.g. smb://MacName.local).\
\
On Windows, map the Mac share:\
• File Explorer → This PC → Map Network Drive → choose letter Z:.\
• Folder: \\\\MacName.local\\PlexMusic\
• Enable \'Reconnect at sign-in\' and log in with your Mac
username/password.

## Step 3: Configure FreeFileSync

In FreeFileSync on Windows:\
1. Left (source): C:\\Users\\\<YourName\>\\Music\\iTunes\\iTunes
Media\\\
Right (destination): Z:\\Music\\\
2. Add another folder pair for playlists:\
Left: C:\\Users\\\<YourName\>\\Music\\iTunes\\iTunes Music Library.xml\
Right: Z:\\iTunes Music Library.xml\
3. Click the gear icon → set Sync Variant = Mirror.\
4. Exclude temporary files (.tmp, Thumbs.db, etc.).\
5. Click Compare → Synchronize to test.\
FreeFileSync copies only new or changed files after the first sync.

## Step 4: Automate It (Optional)

Save the setup: File → Save as Batch Job →
Sync_iTunes_to_Plex.ffs_batch.\
Then either:\
• Run manually (double-click the .ffs_batch file), or\
• Use Windows Task Scheduler to automate it:\
\'C:\\Program Files\\FreeFileSync\\FreeFileSync.exe\'
\'C:\\Users\\\<You\>\\Sync_iTunes_to_Plex.ffs_batch\'\
You can also use RealTimeSync (bundled) for automatic syncing when files
change.

## Step 5: Plex Library Update

After copying, Plex will detect new songs and playlists on its next
scan.\
If needed, force it manually in Plex Web → Library Menu → Scan Library
Files.

## Summary

✔ Copy new/changed songs --- Incremental mirroring\
✔ Copy deleted songs --- Mirror mode (optional)\
✔ Copy iTunes XML --- Extra folder pair\
✔ Automate --- Task Scheduler or RealTimeSync\
✔ Plex auto-updates playlists --- on next scan
