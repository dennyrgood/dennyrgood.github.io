Tailscale with Surfshark

MacOS, cli:

systemextensionsctl list \| grep -i surfshark

\* \* YHUG37CKN8
com.surfshark.vpnclient.macos.direct.PacketTunnel-WireGuard
(4.26.0/4206) Surfshark. WireGuard \[activated enabled\]

\* YHUG37CKN8 com.surfshark.vpnclient.macos.direct.TransparentProxy
(4.26.0/4206) Surfshark. TransparentProxy \[activated waiting for user\]

**Steps:**

1.  Apple menu → Shut Down (full shutdown, not restart)

2.  Press and hold the **power button** until you see \"Loading startup
    options\"

3.  Click **Options** → **Continue**

4.  Menu bar → **Utilities → Startup Security Utility**

5.  Check your security policy is on **Full Security**

6.  If it was already Full Security, toggle it to Reduced, click OK,
    then toggle back to Full Security, click OK --- this sometimes
    forces a re-evaluation of pending extension approvals

7.  Reboot normally

8.  Open Surfshark → try enabling Bypasser immediately

The act of touching the security policy can prompt macOS to re-surface
any pending waiting for user extension approvals on next boot.

systemextensionsctl list \| grep -i surfshark

\* \* YHUG37CKN8
com.surfshark.vpnclient.macos.direct.PacketTunnel-WireGuard
(4.26.0/4206) Surfshark. WireGuard \[activated enabled\]

\* \* YHUG37CKN8 com.surfshark.vpnclient.macos.direct.TransparentProxy
(4.26.0/4206) Surfshark. TransparentProxy \[activated enabled\]

In SurfShark bypasser:

Bypass app "Tailscale" ... seems to work
