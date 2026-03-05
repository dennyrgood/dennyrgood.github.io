The GL.iNet GL-SFT1200 (Opal) can absolutely be used standalone in your
cruise cabin to create a private local WiFi network with no internet
connection required --- exactly what you need for your Legion 5 and
MacBook Air to communicate directly (via Tailscale or other local
sharing).How It Works in Standalone / Offline Mode

- Supported Modes for Private Network:

  - Router Mode (default): Creates its own isolated private network
    (SSID + password) with NAT/firewall/DHCP. Your two laptops connect
    to it → they get local IPs (e.g., 192.168.8.x range) → Tailscale
    detects the local subnet and routes peer-to-peer traffic directly at
    full WiFi speed (no cloud relay needed).

  - Access Point (AP) Mode: Turns it into a pure wireless access point
    (broadcasts SSID, no NAT/DHCP). Connect laptops → they can still
    talk locally (Tailscale works fine here too).

  - Extender / Repeater Mode (with no upstream WiFi selected): Can also
    be forced into local-only by not joining any external network.

- No WAN / No Internet Needed:

  - Leave the WAN port empty and don\'t configure any Repeater /
    Tethering / Cellular uplink.

  - The router still broadcasts its own WiFi SSID and allows devices to
    connect and communicate locally (LAN-to-LAN traffic).

  - GL.iNet docs and user reports confirm this: You can run it purely
    for local networking (e.g., offline device sharing, smart home
    control, or private VPN mesh) without any upstream connection.

  - Cruise users on forums (including GL.iNet and Reddit) often use it
    this way in cabins for private device-to-device access when ship\'s
    WiFi is unreliable or unwanted.

- Setup Steps (Standalone Private Network):

  1.  Plug in the Opal (USB power from cabin outlet, laptop charger, or
      power bank).

  2.  Power on → it auto-creates a default SSID (printed on bottom
      label, e.g., GL-SFT1200-xxx) with password \"goodlife\" or
      similar.

  3.  Connect both your Legion 5 and MacBook Air to that SSID (change
      password in admin panel if desired).

  4.  Access admin interface (<http://192.168.8.1> from a connected
      laptop) → confirm Network Mode is \"Router\" (default) or switch
      to \"Access Point\" if you prefer no NAT.

  5.  Tailscale should auto-detect the local connection → devices see
      each other via Tailscale IPs/hostnames → file sharing, remote
      desktop, ComfyUI sync, etc., all work locally.

  6.  No ship\'s WiFi involved --- fully isolated.

- Optional Switch to Ship Uplink Later:

  - Go to admin panel → Internet → Repeater → Scan → Join ship\'s WiFi →
    authenticate portal once (via one connected laptop).

  - Router shares ship internet to your private SSID (MAC cloning
    available in advanced settings to count as one device).

  - Toggle back to standalone anytime by disabling the repeater
    connection.

Yes, the GL.iNet GL-SFT1200 (Opal) can fully work with your iPhone as a
hotspot to provide internet to your two portables (Legion 5 and MacBook
Air) while still maintaining your private cabin network.It supports two
main ways to use your iPhone\'s Personal Hotspot as the internet source
(WAN/uplink), and both keep your private SSID active for the laptops to
connect to.1. WiFi Repeater / Hotspot Mode (Wireless Uplink --
Recommended for Ease)

- The Opal connects wirelessly to your iPhone\'s Personal Hotspot (just
  like any other WiFi network).

- It then shares that internet connection to its own private SSID (which
  your two laptops connect to).

- Tailscale runs locally over the private network (fast peer-to-peer
  between laptops) while also allowing internet access via the iPhone
  hotspot when needed.

- Setup is straightforward:

  1.  Enable Personal Hotspot on iPhone (Settings \> Personal Hotspot \>
      Allow Others to Join).

  2.  Power on Opal → connect one laptop to Opal\'s default SSID.

  3.  Log into Opal admin panel (192.168.8.1) → Internet → Repeater →
      Scan → Select your iPhone\'s hotspot SSID → Enter password →
      Apply.

  4.  Once connected (green dot shows), Opal now passes iPhone internet
      to its private SSID.

  5.  Connect both laptops to Opal\'s private SSID → they get internet
      from iPhone + local Tailscale routing.

- Pros: No cables, easy to toggle (disable repeater to go
  offline/private-only).

- Cons: Slightly slower than wired due to double WiFi hop (iPhone → Opal
  → laptops), but fine for browsing/email/light use on cruise.

2\. USB Tethering (Wired Uplink -- More Reliable/Stable)

- Connect iPhone to Opal\'s USB 2.0 port with a Lightning/USB-C cable.

- Enable Personal Hotspot on iPhone → iPhone shares internet via USB
  (tethering).

- Opal detects it automatically (or click Connect in admin panel →
  Internet → Tethering).

- Internet is shared to Opal\'s private SSID → your laptops connect
  wirelessly to Opal.

- Pros: More stable than WiFi repeater (no wireless interference),
  charges iPhone at the same time (if cable supports power delivery),
  lower latency.

- Cons: Requires cable (keep a short one handy), USB 2.0 speed limit
  (but plenty for cruise internet).

Additional Cruise Tips for This Setup

- Data Limits / Battery: Use iPhone hotspot sparingly (cruise data is
  expensive/slow) → turn off when not needed. Opal runs low-power so
  your iPhone battery drain is minimal.

- MAC Cloning (if Cruise Counts Devices): If the ship limits devices per
  package, clone your iPhone\'s MAC address in Opal admin (Advanced →
  MAC Clone) so the hotspot counts as only one authorized device.

- Captive Portal: If ship WiFi requires login (rare for hotspot, but
  possible), authenticate once via a laptop connected to Opal.

- Standalone Fallback: At any time, disable tethering/repeater in admin
  panel → Opal reverts to pure private local network (no internet,
  laptops talk via Tailscale locally).

- Test Before Cruise: At home, enable iPhone hotspot → connect Opal via
  WiFi repeater or USB → connect both laptops → confirm internet works +
  Tailscale pings locally.

Bottom Line: Yes --- the GL-SFT1200 Opal handles this perfectly (both
standalone private mode and iPhone hotspot uplink via WiFi repeater or
USB tethering). It\'s a popular cruise choice for exactly this scenario.
At €38.99, it\'s low-risk and flexible. Grab it with tomorrow\'s
delivery --- you\'ll have full control over private/offline vs. shared
internet in the cabin. Safe travels! If you need exact admin screenshots
or MAC clone steps once it\'s in hand, let me know.
