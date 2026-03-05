**GL.iNet Opal (GL-SFT1200) + Surfshark**

Setup Guide: Cruise Travel & Home Use

**Part 1: Cruise Ship Setup**

The GL.iNet Opal acts as a personal VPN-secured WiFi hotspot aboard the
ship. Your devices connect to the Opal, which connects to the ship\'s
WiFi, with Surfshark tunneling your traffic for privacy.

**What You Need**

- GL.iNet Opal router (fully charged or plugged in via USB-C)

- Surfshark account credentials (email + password)

- A laptop or phone to access the Opal admin panel

- Short ethernet cable (optional but useful for a wired fallback)

**Step 1 --- First-Time Opal Configuration (do this at home before you
leave)**

Configure the Opal before the cruise so you\'re not troubleshooting on
the ship\'s slow WiFi.

1.  Power on the Opal and connect your laptop to its WiFi network.
    Default SSID and password are printed on the bottom of the unit.

2.  Open a browser and go to http://192.168.8.1 --- this is the Opal
    admin panel.

3.  Set a new admin password when prompted. Write it down somewhere
    safe.

4.  Go to VPN \> WireGuard Client in the left menu.

5.  Click Add Manually or use the Surfshark configuration option if
    available.

6.  In a separate browser tab, log into your Surfshark account at
    my.surfshark.com \> VPN \> Manual Setup \> Router \> WireGuard.
    Generate and download a config file for your preferred server
    location.

7.  Back in the Opal admin panel, upload or paste the WireGuard config
    file.

8.  Enable the VPN connection and confirm the status shows Connected.

9.  Rename your Opal\'s WiFi network (SSID) to something personal so you
    recognize it on the ship.

> *Tip: Test this at home by browsing to whatismyip.com while connected
> through the Opal. The IP shown should be a Surfshark server, not your
> home IP.*

**Step 2 --- Connecting on the Ship**

10. Plug in the Opal via USB-C to a cabin USB port or a portable
    battery.

11. Connect your laptop or phone to the ship\'s WiFi network directly
    (not through the Opal yet).

12. Open the ship\'s captive portal login page and authenticate with
    your cruise WiFi credentials. This step must be done device-to-ship
    directly --- the Opal cannot complete a captive portal on your
    behalf.

13. Once authenticated, disconnect from the ship\'s WiFi on your device.

14. Go into the Opal admin panel (http://192.168.8.1) from a device
    connected to the Opal.

15. Go to Internet \> Repeater and scan for the ship\'s WiFi network.

16. Select the ship\'s network and enter the WiFi password. The Opal
    will now use the ship\'s connection as its upstream internet source.

17. Verify the VPN is active: VPN \> WireGuard Client should show
    Connected.

18. All your devices can now connect to the Opal\'s WiFi and are
    automatically routed through Surfshark.

> *Note: Some cruise lines re-authenticate every few hours. If internet
> stops working, reconnect one device directly to the ship WiFi and
> re-authenticate through the portal, then reconnect to the Opal.*

**Step 3 --- If VPN Won\'t Connect on the Ship**

Cruise ship networks sometimes block standard VPN ports. Try these in
order:

19. In the Opal admin panel go to VPN \> WireGuard Client \> your config
    \> Edit.

20. Change the port to 443 (HTTPS port --- almost never blocked) and
    save.

21. If still blocked, try port 80. If neither works, the ship may be
    blocking WireGuard entirely --- in that case, connect without VPN
    for the trip and use Surfshark\'s app directly on each device
    instead.

> *Reminder: Without VPN on a shared ship network, avoid banking or
> sensitive logins. Use a cellular data connection for those if
> possible.*

**Part 2: Home Setup --- Samsung Frame TV**

The Samsung Frame (and most smart TVs) cannot run a VPN natively. By
connecting the TV through the Opal, all of the TV\'s traffic is
automatically tunneled through Surfshark --- enabling geo-unblocking of
streaming services without any configuration on the TV itself.

**How to Set It Up**

22. Plug the Opal into a power source near your TV (USB-C to USB-A
    adapter or phone charger works).

23. Run a short ethernet cable from one of the Opal\'s LAN ports into
    the ethernet port on your Samsung Frame. If your Frame is not near
    an ethernet port, you can also connect the TV to the Opal via its
    separate WiFi broadcast.

24. Connect the Opal\'s WAN port (or configure it in Repeater mode) to
    your home router --- either via ethernet from your TP-Link, or
    connect the Opal to your home WiFi network as an upstream source.

25. Log into the Opal admin panel (http://192.168.8.1) and confirm the
    WireGuard VPN shows as Connected.

26. On the Samsung Frame, go to Settings \> General \> Network and
    connect to the Opal\'s network (either wired via ethernet, or
    wireless to the Opal\'s SSID).

27. Test by opening a streaming app on the Frame --- it should now
    appear as if you\'re browsing from the Surfshark server location you
    configured.

> *Tip: If you configured a US-based Surfshark server, streaming apps on
> the Frame will see a US IP. Change the WireGuard config server in the
> Opal admin panel to any country you want for geo-unblocking purposes.*

**Switching Between Cruise and Home Configs**

The Opal remembers multiple WireGuard configurations. You can save a
cruise-optimized config (closest server to your destination) and a home
config separately, then activate whichever you need from the admin panel
under VPN \> WireGuard Client.

- At home: activate your home/streaming server config, connect via
  ethernet to TP-Link router.

- On cruise: switch to Repeater mode, activate cruise server config,
  connect to ship WiFi.

- Switching takes under 2 minutes via the admin panel at
  http://192.168.8.1.

**Quick Reference --- Opal Admin Panel**

- Admin panel URL: http://192.168.8.1

- VPN config: VPN \> WireGuard Client

- Repeater mode (cruise): Internet \> Repeater

- Router mode (home): Internet \> Cable or Internet \> Wireless

- Status check: Dashboard shows WAN status and VPN status at a glance

*GL.iNet Opal supports Surfshark WireGuard natively. For firmware
updates, visit gl-inet.com/products/gl-sft1200. Surfshark WireGuard
configs can be regenerated anytime at my.surfshark.com.*
