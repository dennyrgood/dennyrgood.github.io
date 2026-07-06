**Ubuntu in VirtualBox**

WorkBench --- Linux Experimentation VM

Ubuntu 24.04 LTS • VirtualBox • 8 GB RAM • Host: WorkBench (Win11 Pro,
32 GB)

**🧠 Why This Setup**

This VM exists for Linux experimentation and to mirror the E5520 server
environment on a machine with full GUI access and no consequences for
breaking things. VirtualBox snapshots let you save state before trying
anything risky and roll back in seconds if it goes wrong.

Ubuntu 24.04 LTS matches the E5520 exactly --- same commands, same
package manager, same behaviour. Anything you learn or test here
transfers directly to the real server.

**🗺️ Quick Reference**

  ---------------------- ------------------------------------------------
  **Host machine**       WorkBench (Win11 Pro, 32 GB RAM)

  **Hypervisor**         VirtualBox (free, open source)

  **Guest OS**           Ubuntu 24.04 LTS (Noble Numbat)

  **VM RAM**             8 GB (leaves 24 GB for Windows)

  **VM CPU cores**       4 cores (adjust in VirtualBox settings)

  **VM disk**            50 GB dynamically allocated VDI

  **VM username**        dhm

  **Display**            Full Ubuntu GNOME desktop in a window

  **GUI remote access**  Jump Desktop via RDP to VM\'s local IP

  **Snapshots**          Take one before any major experiment
  ---------------------- ------------------------------------------------

**Phase 0 --- Download VirtualBox and Ubuntu ISO**

**0.1 Download VirtualBox**

Go to virtualbox.org and download VirtualBox for Windows. Also download
the VirtualBox Extension Pack from the same page --- you need it for USB
2.0/3.0 support and better display drivers.

  ---------------------- -----------------------------------------------------
  **VirtualBox           VirtualBox-x.x.x-Win.exe
  installer**            

  **Extension Pack**     Oracle_VirtualBox_Extension_Pack-x.x.x.vbox-extpack
  ---------------------- -----------------------------------------------------

⚠️ **Install VirtualBox first, then double-click the Extension Pack file
to install it into VirtualBox.**

**0.2 Download Ubuntu ISO**

Download Ubuntu 24.04 LTS desktop ISO from ubuntu.com. Leave it in your
Downloads folder.

  -----------------------------------------------------------------------
  Downloads\\ubuntu-24.04.4-desktop-amd64.iso

  -----------------------------------------------------------------------

✅ Same ISO as the E5520 --- if you already downloaded it, reuse it.

**Phase 1 --- Create the VM in VirtualBox**

**1.1 New VM wizard**

Open VirtualBox. Click New. Work through the wizard with these settings:

  ---------------------- ------------------------------------------------
  **Name**               Ubuntu-24.04 (or anything you like)

  **Folder**             Default or a drive with 50+ GB free

  **ISO Image**          Select your ubuntu-24.04 .iso file

  **Type**               Linux

  **Version**            Ubuntu (64-bit)

  **Skip unattended**    Tick \'Skip Unattended Installation\'
  ---------------------- ------------------------------------------------

⚠️ **Tick \'Skip Unattended Installation\' --- otherwise VirtualBox
creates a default user you did not configure. You want to run the normal
Ubuntu installer yourself.**

**1.2 Hardware settings**

  ---------------------- ------------------------------------------------
  **Base Memory**        8192 MB (8 GB)

  **Processors**         4 (do not exceed half your physical cores)

  **Enable EFI**         Yes --- tick \'Enable EFI (special OSes only)\'
  ---------------------- ------------------------------------------------

**1.3 Virtual disk**

  ---------------------- ------------------------------------------------
  **Disk type**          Create a Virtual Hard Disk Now

  **Size**               50 GB

  **Format**             VDI (VirtualBox Disk Image)

  **Allocation**         Dynamically Allocated (only uses real space as
                         needed)
  ---------------------- ------------------------------------------------

✅ 50 GB is comfortable for OS + packages + experimentation. The dynamic
allocation means it starts small on your actual drive and grows only as
you use it.

**1.4 Review and finish**

Review the summary and click Finish. The VM appears in your VirtualBox
list but has not started yet.

**Phase 2 --- Tune VM Settings Before First Boot**

Before starting the VM, open its Settings and make these adjustments:

**2.1 Display**

  ---------------------- ------------------------------------------------
  **Video Memory**       128 MB (max out the slider)

  **Graphics             VMSVGA
  Controller**           

  **Enable 3D Accel.**   Yes (helps desktop rendering)
  ---------------------- ------------------------------------------------

**2.2 Storage (verify ISO is attached)**

Under Storage, confirm the Ubuntu ISO is attached to the virtual optical
drive. It should be there from the wizard, but worth checking.

**2.3 Shared Clipboard and Drag-and-Drop**

  ---------------------- ------------------------------------------------
  **Shared Clipboard**   Bidirectional (copy/paste between host and VM)

  **Drag and Drop**      Bidirectional (drag files between host and VM)
  ---------------------- ------------------------------------------------

✅ These require Guest Additions to be installed (Phase 4). Set them now
so they work automatically once Guest Additions are in.

**2.4 Network**

  ---------------------- ------------------------------------------------
  **Adapter 1**          NAT (default --- VM gets internet via Windows,
                         no extra config needed)

  ---------------------- ------------------------------------------------

NAT is correct for this use case. The VM can reach the internet for apt
installs. Tailscale (installed in Phase 5) handles remote access from
other devices --- you do not need Bridged networking for that.

**Phase 3 --- Install Ubuntu**

**3.1 Start the VM and boot the installer**

- Click Start in VirtualBox

- VM boots from the ISO into the Ubuntu live environment

- You will see a desktop with a \'Try or Install Ubuntu\' option ---
  click Install Ubuntu

**3.2 Installer choices**

  ---------------------- ------------------------------------------------
  **Language**           Your choice

  **Keyboard**           Default

  **Install type**       Normal installation

  **Download updates**   checked

  **Third-party sw**     checked

  **Installation disk**  Erase disk and install (this is the virtual
                         disk, not your real SSD)
  ---------------------- ------------------------------------------------

+-----------------------------------------------------------------------+
| 💻 **Erase disk is safe here**                                        |
|                                                                       |
| The \'Erase disk and install\' option only affects the virtual disk   |
| VirtualBox created. It cannot touch your real Windows SSD or any      |
| other physical drive. This is one of the core benefits of a VM.       |
+-----------------------------------------------------------------------+

**3.3 Create your user account**

  ---------------------- ------------------------------------------------
  **Your name**          Dennis (display only)

  **Username**           dhm

  **Password**           Choose a password --- used for sudo inside the
                         VM

  **Login**              Require password (recommended)
  ---------------------- ------------------------------------------------

Click Install Now and wait --- typically 10--15 minutes inside a VM.

When prompted, click Restart Now. VirtualBox will eject the ISO
automatically. Press Enter when asked to remove the installation medium.

**Phase 4 --- First Boot and Guest Additions**

**4.1 System update**

Open a terminal (right-click desktop -\> Open Terminal, or search
Terminal in the app menu):

  -----------------------------------------------------------------------
  sudo apt update && sudo apt upgrade -y

  -----------------------------------------------------------------------

**4.2 Install VirtualBox Guest Additions ← DO NOT SKIP**

Guest Additions unlock: proper display scaling, shared clipboard,
drag-and-drop, and better mouse integration. Without them the VM feels
broken.

In the VirtualBox menu bar (at the top of the VM window):

- Click Devices

- Click \'Insert Guest Additions CD image\...\'

A CD icon will appear on the Ubuntu desktop. Open a terminal and run:

  -----------------------------------------------------------------------
  sudo apt install build-essential dkms linux-headers-\$(uname -r) -y\
  \
  \# Mount and run the Guest Additions installer:\
  sudo mount /dev/cdrom /mnt\
  sudo /mnt/VBoxLinuxAdditions.run

  -----------------------------------------------------------------------

Wait for it to complete, then reboot:

  -----------------------------------------------------------------------
  sudo reboot

  -----------------------------------------------------------------------

✅ After reboot the display will auto-resize when you resize the
VirtualBox window, clipboard sharing will work, and the mouse will move
freely in and out of the VM.

**4.3 Take your first snapshot ← DO THIS NOW**

This is your clean baseline. Before you install anything or experiment
with anything, save this state.

In VirtualBox menu: Machine -\> Take Snapshot

  ---------------------- ------------------------------------------------
  **Snapshot name**      Clean install --- Guest Additions

  **Description**        Ubuntu 24.04 LTS, dhm user, fully updated, Guest
                         Additions installed
  ---------------------- ------------------------------------------------

+-----------------------------------------------------------------------+
| 📸 **Snapshot workflow --- use this every time**                      |
|                                                                       |
| Before any experiment: Machine -\> Take Snapshot -\> give it a        |
| descriptive name. If something breaks: Machine -\> Snapshots -\>      |
| select the snapshot -\> Restore. If it worked and you want to keep    |
| it: just keep going. Snapshots stack. You can have as many snapshots  |
| as disk space allows. Delete old ones when you no longer need the     |
| rollback point.                                                       |
+-----------------------------------------------------------------------+

**Phase 5 --- GUI Remote Access via Jump Desktop**

**5.1 Install xrdp in the VM**

This lets Jump Desktop connect to the VM over RDP --- the same way it
connects to any other machine.

  -----------------------------------------------------------------------
  sudo apt install xrdp xfce4 xfce4-goodies dbus-x11 -y\
  \
  \# Run as dhm (no sudo):\
  echo xfce4-session \> \~/.xsession\
  \
  sudo systemctl enable xrdp\
  sudo systemctl start xrdp

  -----------------------------------------------------------------------

⚠️ **Run the echo command without sudo. If you use sudo it lands in
/root and RDP sessions get a blank screen.**

**5.2 Install Tailscale in the VM**

Enrolling the VM in your existing Tailnet gives it a stable 100.x.x.x
address --- reachable from any of your devices, not just WorkBench. This
is the right way to connect Jump Desktop from your MacBook, phone, or
any other machine.

  -----------------------------------------------------------------------
  curl -fsSL https://tailscale.com/install.sh \| sh\
  sudo tailscale up

  -----------------------------------------------------------------------

+-----------------------------------------------------------------------+
| 💻 **Auth URL --- open on another device**                            |
|                                                                       |
| After running \'sudo tailscale up\', the terminal prints a URL. Open  |
| it on any other device (your Windows host, phone, etc.) and authorize |
| it in your Tailscale account. The VM will appear as a new node in     |
| your Tailnet alongside the E5520 and your other machines. Give it a   |
| recognisable name in the Tailscale admin panel:                       |
| https://login.tailscale.com/admin                                     |
+-----------------------------------------------------------------------+

Get the VM\'s Tailscale IP:

  -----------------------------------------------------------------------
  tailscale ip -4

  -----------------------------------------------------------------------

✅ Write down this 100.x.x.x address. Use it for Jump Desktop instead of
the NAT IP --- it works from any device on your Tailnet, not just
WorkBench.

**5.3 Find the VM\'s local IP (WorkBench-only fallback)**

If you ever want to connect from WorkBench without Tailscale running,
the VM\'s NAT address still works locally:

  -----------------------------------------------------------------------
  ip addr show \| grep \'inet \'

  -----------------------------------------------------------------------

Look for a 10.0.x.x address. This only works from WorkBench itself ---
use the Tailscale IP for everything else.

**5.4 Connect from Jump Desktop**

- Open Jump Desktop on any device in your Tailnet

- Add new connection -\> RDP

- Address: 100.x.x.x (the VM\'s Tailscale IP from step 5.2)

- Username: dhm

- Password: your VM password

✅ You now have three ways into the VM: VirtualBox window (direct on
WorkBench), Jump Desktop via Tailscale IP (any device), and RDP to the
NAT IP (WorkBench only). Use whichever suits.

**Phase 6 --- Mirror the E5520 Environment (Optional)**

Since this VM runs identical Ubuntu 24.04 LTS, you can replicate the
E5520 setup here for testing before touching the real server. Take a
snapshot first, then follow the E5520 build sheet exactly.

Things that work identically in the VM:

- apt package installs --- same commands, same results

- systemd services --- Plex, Syncthing, SSH all install and run normally

- Tailscale --- you can enroll the VM as a separate node in your Tailnet

- File system layout --- /home/dhm/media/ etc. behave identically

Things that differ from the real E5520:

- Performance --- VM disk I/O is slower; Plex playback may stutter on
  transcoded content

- Hardware decode --- not available inside a VM; Direct Play only

- Port exposure --- NAT means you need port forwarding or Bridged
  networking to reach services from outside WorkBench

+-----------------------------------------------------------------------+
| 💡 **Recommended use pattern**                                        |
|                                                                       |
| Use the VM to learn and test. When you are confident a procedure      |
| works, run it on the E5520. The VM is your scratch pad --- the E5520  |
| is the real thing.                                                    |
+-----------------------------------------------------------------------+

**📸 Snapshot Strategy**

Suggested snapshot points to build up as you go:

  ---------------------- ------------------------------------------------
  **Clean install ---    Right after Phase 4. Your always-safe baseline.
  Guest Additions**      

  **Post first-boot      After apt upgrade, trimming bloat, basics
  config**               installed.

  **Before Tailscale**   Before enrolling in Tailnet (easy to redo, but
                         snapshot is cheap).

  **Tailscale enrolled** VM is in your Tailnet with a stable 100.x.x.x
                         address.

  **Before Plex          Before adding the Plex repo.
  install**              

  **Working Plex +       Once both services are confirmed running.
  Syncthing**            

  **Before anything      Any time you are about to try something you are
  experimental**         not sure about.
  ---------------------- ------------------------------------------------

✅ Name snapshots descriptively. \'Snapshot 3\' tells you nothing six
months later. \'Before Syncthing config change\' tells you everything.

**Reference**

  ---------------------- ------------------------------------------------
  **VM console**         VirtualBox window (direct access, always works)

  **RDP via Tailscale**  Jump Desktop -\> RDP -\> 100.x.x.x (any device
                         on Tailnet) login: dhm

  **RDP local only**     Jump Desktop -\> RDP -\> 10.0.x.x (WorkBench
                         only) login: dhm

  **Tailscale admin**    https://login.tailscale.com/admin

  **Take snapshot**      VirtualBox menu: Machine -\> Take Snapshot

  **Restore snapshot**   VirtualBox menu: Machine -\> Snapshots -\>
                         select -\> Restore

  **VM files location**  C:\\Users\\dhm\\VirtualBox VMs (default)

  **E5520 build sheet**  See Ubuntu_E5520_Build_Sheet_v3.docx for the
                         real server
  ---------------------- ------------------------------------------------

**🧠 What You Have**

- **VirtualBox** → hypervisor running Ubuntu as a guest inside Windows

- **Ubuntu 24.04 LTS** → identical OS to the E5520, full GNOME desktop

- **Tailscale** → VM enrolled in your Tailnet, reachable from any device
  as 100.x.x.x

- **Snapshots** → save / restore state before any experiment

- **Jump Desktop via RDP** → remote GUI access from any Tailscale device

- **NAT networking** → VM has internet; Tailscale handles remote access

*This is your Linux playground. Break things freely --- the snapshot
baseline is always one click away.*

Last verified: April 2026 • Ubuntu 24.04 LTS • VirtualBox • WorkBench •
v1
