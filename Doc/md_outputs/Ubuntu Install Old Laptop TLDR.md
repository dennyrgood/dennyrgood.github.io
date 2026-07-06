Here's the clean TL;DR.

**💾 1) Where to put the Ubuntu ISO**

You don't "install" it anywhere.

👉 Just download Ubuntu 24.04 LTS ISO and leave it in your normal
**Downloads folder**.

Example:

Downloads/\
ubuntu-24.04.4-desktop-amd64.iso

That's it --- Rufus reads it from there.

**🧰 2) Create boot USB with Rufus**

**Step-by-step:**

1.  Plug in USB stick (8GB+)

    - ⚠️ everything on it will be erased

2.  Open Rufus (no install needed --- it's portable)

3.  In Rufus:

- **Device**\
  → select your USB drive

- **Boot selection**\
  → click **SELECT**\
  → choose your Ubuntu .iso file from Downloads

- **Partition scheme**\
  → GPT

- **Target system**\
  → UEFI (non-CSM)

- Leave everything else default

4.  Click **START**

5.  If prompted:

- Choose **"ISO mode (Recommended)"**

6.  Wait until it says **READY**

**🔥 3) Boot the laptop from USB**

On your Dell:

1.  Plug USB in

2.  Turn on laptop

3.  Spam **F12**

4.  Select **USB Storage Device**

You'll enter Ubuntu installer.

**🧠 4) Install Ubuntu (quick path)**

Inside installer:

- Click **Install Ubuntu**

- Normal installation

- ✔ Download updates

- ✔ Third-party drivers

- Install to SSD → "Erase disk and install"

Wait → reboot → remove USB

**⚙️ 5) After install (what you do first)**

Open terminal:

sudo apt update && sudo apt upgrade -y

Then you're ready for Plex install + mode switching (we covered that
earlier).

**⚡ Key mental model**

- ISO = file on your Windows machine

- Rufus = tool that writes it to USB

- USB = temporary installer boot drive

- Laptop = gets wiped and becomes Linux system

**🧭 1) Install Ubuntu (USB boot)**

Using Rufus (already done):

**On the laptop:**

1.  Plug USB in

2.  Power on → spam **F12** (Dell boot menu)

3.  Choose **USB**

4.  Click **Install Ubuntu**

**Installer choices:**

- Language: your choice

- Keyboard: default

- Install type: **Normal installation**

- ✔ "Download updates while installing"

- ✔ "Install third-party software"

- Installation disk: SSD → **Erase disk and install**

Finish install → reboot → remove USB

**⚙️ 2) First boot cleanup (important for speed)**

Open terminal:

sudo apt update && sudo apt upgrade -y

Remove heavy apps:

sudo apt remove \--purge libreoffice\* thunderbird -y

Install basics:

sudo apt install htop curl -y

**🧠 3) Install Plex server**

Install Plex:

**Add Plex repo + install:**

curl https://downloads.plex.tv/plex-keys/PlexSign.key \| sudo gpg
\--dearmor -o /usr/share/keyrings/plex.gpg

echo \"deb \[signed-by=/usr/share/keyrings/plex.gpg\]
https://downloads.plex.tv/repo/deb public main\" \| sudo tee
/etc/apt/sources.list.d/plex.list

sudo apt update\
sudo apt install plexmediaserver -y

**🚀 4) Start Plex automatically**

sudo systemctl enable plexmediaserver\
sudo systemctl start plexmediaserver

Access in browser:

http://localhost:32400/web

**🧪 5) Plex optimization (IMPORTANT for your hardware)**

In Plex settings:

- Disable video transcoding when possible

- Prefer **Direct Play**

- Use H.264 / AAC files if possible

**🖥️ 6) Switch between Desktop ↔ Server mode**

This is your "on/off GUI switch".

**🟢 Desktop mode (normal GNOME UI)**

sudo systemctl set-default graphical.target\
sudo reboot

**🔵 Plex/server-only mode (no desktop, faster)**

sudo systemctl set-default multi-user.target\
sudo reboot

**🔁 What each mode means**

  -----------------------------------------
  **Mode**     **What happens**
  ------------ ----------------------------
  Graphical    Full Ubuntu desktop (GNOME)

  Multi-user   No GUI, terminal only, Plex
               runs lean
  -----------------------------------------

**⚡ 7) Your best real-world workflow**

For your use case (single Google TV remote Plex box):

👉 Default to:

- **server mode (multi-user.target)**

Then:

- SSH in if needed

- Or temporarily switch to desktop for maintenance

**🧠 8) Optional (highly recommended tweak)**

Install zRAM (helps 4GB RAM a LOT):

sudo apt install zram-tools -y

**🎯 Final mental model**

- Ubuntu = base system

- Plex = always running service

- Desktop = optional "maintenance layer"

- Switch mode = reboot toggle

Here's your **post-install TL;DR (first boot → Plex → SSH → Tailscale →
RDP)** for Ubuntu on your E5520.

**🧭 0) First boot (after install)**

Login locally once.

Update system:

sudo apt update && sudo apt upgrade -y

Install basics:

sudo apt install curl htop net-tools -y

**🌐 1) Install Tailscale (DO THIS FIRST)**

curl -fsSL https://tailscale.com/install.sh \| sh

sudo tailscale up

➡️ Log in via browser\
➡️ Get your 100.x.x.x IP

**🔐 2) Enable SSH (primary access)**

sudo apt install openssh-server -y

Enable:

sudo systemctl enable ssh\
sudo systemctl start ssh

Test from another machine:

ssh user@100.x.x.x

**🎬 3) Install Plex server**

curl https://downloads.plex.tv/plex-keys/PlexSign.key \| sudo gpg
\--dearmor -o /usr/share/keyrings/plex.gpg

echo \"deb \[signed-by=/usr/share/keyrings/plex.gpg\]
https://downloads.plex.tv/repo/deb public main\" \| sudo tee
/etc/apt/sources.list.d/plex.list

sudo apt update\
sudo apt install plexmediaserver -y

Enable service:

sudo systemctl enable plexmediaserver\
sudo systemctl start plexmediaserver

Access:

http://100.x.x.x:32400/web

**🖥️ 4) Install RDP (your GUI fallback)**

Install xrdp:

sudo apt install xrdp -y

Enable:

sudo systemctl enable xrdp\
sudo systemctl start xrdp

**(Recommended) install lightweight desktop for RDP stability**

sudo apt install xfce4 xfce4-goodies -y

Set XFCE for xrdp session:

echo \"startxfce4\" \> \~/.xsession

**💻 5) How you connect (final result)**

**🟢 SSH (daily control)**

ssh user@100.x.x.x

**🎬 Plex UI**

http://100.x.x.x:32400/web

**🖥️ RDP (Windows 11 / macOS)**

- Open Remote Desktop app

- Connect to:

100.x.x.x

Login with Ubuntu credentials

**⚙️ 6) Optional: make it "server-first" (recommended)**

Disable full GUI boot (saves RAM on 4GB):

sudo systemctl set-default multi-user.target

👉 You still use RDP when needed\
👉 System boots lean for Plex

To re-enable GUI boot later:

sudo systemctl set-default graphical.target

**🧠 Your final architecture**

- 🧠 SSH → primary control plane

- 🌐 Tailscale → secure network layer

- 🎬 Plex → always-on service

- 🖥️ RDP → occasional GUI access

- 🚫 No VNC, no telnet (good call 😄)

**💡 Reality check (this setup is solid)**

What you now have is basically:

a lightweight remote media server appliance with enterprise-style access

Top of Form

Bottom of Form

FINAL TLDR

**🧭 CLEAN FINAL TL;DR (your real "build sheet")**

**💾 INSTALL**

- Write Ubuntu 24.04 LTS ISO to USB using Rufus

- Boot → F12 → Install Ubuntu

- Erase disk → install

**⚙️ FIRST BOOT**

sudo apt update && sudo apt upgrade -y\
sudo apt install curl htop net-tools -y

**🌐 TAILSCALE (FIRST PRIORITY)**

curl -fsSL https://tailscale.com/install.sh \| sh\
sudo tailscale up

→ gives you 100.x.x.x private IP

**🔐 SSH (PRIMARY CONTROL)**

sudo apt install openssh-server -y\
sudo systemctl enable ssh\
sudo systemctl start ssh

Use:

ssh user@100.x.x.x

**🎬 PLEX SERVER**

sudo apt install plexmediaserver -y\
sudo systemctl enable plexmediaserver\
sudo systemctl start plexmediaserver

Access:

http://100.x.x.x:32400/web

**🖥️ RDP (GUI FALLBACK)**

Install:

sudo apt install xrdp xfce4 xfce4-goodies dbus-x11 -y

Configure:

echo xfce4-session \> \~/.xsession

Enable:

sudo systemctl enable xrdp\
sudo systemctl start xrdp

**💻 CONNECT FROM CLIENTS**

- SSH → terminal control

- Plex UI → browser

- RDP → Windows 11 / macOS client to 100.x.x.x

**⚙️ BOOT MODES**

**Server mode (recommended default)**

sudo systemctl set-default multi-user.target

**GUI mode (only if needed locally/RDP troubleshooting)**

sudo systemctl set-default graphical.target

**🧠 FINAL ARCHITECTURE**

- 🧠 SSH → admin brain

- 🌐 Tailscale → private network backbone

- 🎬 Plex → always-on media service

- 🖥️ RDP → occasional GUI access

- 🚫 No VNC, no telnet (correct decision)

**🧠 Honest assessment**

What you built here is basically:

a lightweight, VPN-secured, headless media server with optional GUI
escape hatch

That's *exactly* how small remote Linux appliances are normally deployed
in practice.
