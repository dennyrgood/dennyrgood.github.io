# Tailscale + Plex: Remote Streaming Setup Guide

## Overview

This guide explains how to set up Plex streaming over Tailscale for direct, encrypted connections between your Plex server and remote clients. This eliminates reliance on Plex's relay servers and provides faster, more reliable streaming.

## Why Use Tailscale with Plex?

**Benefits:**
- **Speed** - Direct connections are faster than Plex relay servers
- **Reliability** - No dependency on Plex's infrastructure or internet congestion
- **Privacy** - Streams stay within your encrypted Tailscale network
- **No bandwidth limits** - Avoid Plex relay throttling or restrictions
- **Security** - End-to-end encrypted mesh network

**When to Use This Setup:**
- Streaming from a secondary location regularly
- High-quality or 4K streaming requirements
- Privacy-conscious users
- Unreliable Plex relay performance

## Prerequisites

- Plex Media Server running at primary location
- Tailscale account (free tier works fine)
- Devices at remote location(s) capable of running Tailscale

## Initial Setup

### Step 1: Install Tailscale on Plex Server

1. Download Tailscale from https://tailscale.com/download
2. Install on your Plex server (Mac, Windows, Linux)
3. Log in with your Tailscale account
4. Note the Tailscale IP assigned (format: 100.x.x.x)
   - **Mac**: Run `tailscale ip` in Terminal
   - **Windows**: Run `tailscale ip` in Command Prompt

### Step 2: Configure Plex Server Network Settings

On your Plex server:

1. Open Plex Settings → Network → Show Advanced
2. Under **"Custom server access URLs"**, add:
   ```
   http://100.x.x.x:32400
   ```
   (Replace 100.x.x.x with your Plex server's actual Tailscale IP)

3. Under **"LAN Networks"**, add:
   ```
   100.64.0.0/10
   ```
   This tells Plex to treat all Tailscale IPs as "local" connections

4. Set **"Secure connections"** to "Preferred" (not "Required")
5. Click "Save Changes"
6. **Restart Plex Media Server** to apply changes

### Step 3: Install Tailscale on Remote Clients

For each device at remote locations:

1. Install Tailscale for the appropriate platform
2. Log in with the **same Tailscale account** as your Plex server
3. Verify the device appears in your Tailscale network
4. **Important**: Disable any other VPN software (NordVPN, ExpressVPN, etc.)

### Step 4: Connect Plex Client

On the remote device:

1. Open the Plex app
2. Sign in with your Plex account credentials
3. Your servers should appear automatically
4. Select your primary server and start streaming

**For best results:**
- Sign out and back into Plex after first Tailscale setup
- This forces Plex to rediscover connection methods

## Verifying Your Connection

### Check Connection Type in Plex

When playing content, check the Plex server dashboard:

**Good (Direct via Tailscale):**
```
Local (100.x.x.x) — 50 Mbps
Direct Play
```

**Bad (Still using relay):**
```
Remote (5.182.x.x) — 4 Mbps
```

### Platform-Specific Connection Tests

#### Mac
```bash
/Applications/Tailscale.app/Contents/MacOS/Tailscale ping 100.x.x.x
```

**Direct connection:**
```
pong from server (100.x.x.x) via [192.168.x.x:41641] in 45ms
```

**DERP relay:**
```
pong from server (100.x.x.x) via DERP(ams) in 236ms
```

#### Windows
```cmd
tailscale ping 100.x.x.x
```

Output format is the same as Mac.

**Alternative**: Right-click Tailscale tray icon → Click device name to see connection details

#### Linux
```bash
tailscale ping 100.x.x.x
```

#### Smart TV / Android TV

Smart TVs typically don't provide easy access to connection diagnostics. Instead:

1. Check Plex server status when TV is streaming
2. Look at bandwidth and latency indicators
3. High bandwidth (20+ Mbps) usually indicates direct connection
4. Low bandwidth (4 Mbps) with buffering suggests DERP relay

**Advanced option**: Ping the TV from another device:
```bash
tailscale ping 100.x.x.x  # TV's Tailscale IP
```

## Understanding Connection Types

### Direct Connection (Preferred)

- **How it works**: Peer-to-peer connection between devices
- **Latency**: 20-100ms typically
- **Bandwidth**: Full speed
- **Requirements**: Both networks allow UDP traffic and NAT traversal

**When you get direct connections:**
- Home networks (most residential ISPs)
- Mobile hotspots (sometimes)
- Friend's house
- Most standard WiFi networks

### DERP Relay (Fallback)

- **How it works**: Traffic routes through Tailscale's relay servers
- **Latency**: 150-400ms+
- **Bandwidth**: Limited by relay server
- **Still encrypted**: End-to-end encryption maintained

**When you fall back to DERP:**
- Corporate networks with strict firewalls
- Hotel/conference WiFi
- Public WiFi with client isolation
- Cellular networks with carrier-grade NAT (CGNAT)
- Networks blocking UDP traffic
- Symmetric NAT configurations

**Streaming performance over DERP:**
- ✓ SD/720p: Usually works fine
- ✓ 1080p: Generally acceptable
- ⚠ 4K/high bitrate: May buffer or struggle
- ✗ Very high bitrate content: Likely won't work well

## Troubleshooting

### Plex Still Shows "Remote" Connection

**Possible causes:**

1. **VPN conflict** - Other VPN software (NordVPN, ExpressVPN) interferes with Tailscale
   - **Solution**: Disable other VPNs when using Tailscale

2. **Plex settings not saved** - Network configuration not applied
   - **Solution**: Verify settings, restart Plex server

3. **Client not refreshed** - Plex client using cached connection info
   - **Solution**: Sign out and back into Plex on the client

4. **Firewall blocking** - Local firewall blocking Tailscale traffic
   - **Solution**: Check firewall settings, allow Tailscale

5. **Tailscale not connected** - Device not properly connected to tailnet
   - **Solution**: Check Tailscale status, reconnect if needed

### Cannot Ping Between Devices

1. **Check Tailscale status**: Run `tailscale status` to see all devices
2. **Verify same account**: All devices must use the same Tailscale account
3. **Check for VPN conflicts**: Disable other VPN software
4. **Firewall issues**: Temporarily disable firewall to test
5. **Use Tailscale ping**: Try `tailscale ping` instead of regular `ping` (ICMP doesn't work over DERP)

### Slow Streaming Performance

1. **Check connection type**: Are you on DERP relay?
2. **Network congestion**: Test at different times
3. **Reduce quality**: Lower Plex streaming quality settings
4. **Check bandwidth**: Use Plex's bandwidth monitoring
5. **Try different network**: Switch from hotel WiFi to mobile hotspot

## Multiple Plex Servers

If you have Plex servers at multiple locations (e.g., primary and secondary locations), each server needs the same network configuration.

### Configuring Additional Plex Servers

For each additional Plex server on your Tailscale network:

1. Open Plex Settings → Network → Show Advanced
2. Under **"Custom server access URLs"**, add that server's Tailscale IP:
   ```
   http://100.x.x.x:32400
   ```
   (Use the specific Tailscale IP for that server)

3. Under **"LAN Networks"**, add:
   ```
   100.64.0.0/10
   ```

4. Save and restart Plex Media Server

### Accessing Multiple Servers

Once configured, all servers appear in your Plex clients automatically:

- Sign into Plex with your account
- All servers on your Tailscale network will be listed
- Each will show "Local" connection via Tailscale
- Switch between servers as needed

**Use cases:**
- Primary server with full library
- Secondary server with synced content (using Syncthing or similar)
- Backup servers at different locations
- Specialized servers (4K content, music only, etc.)

## Adding Additional Locations

To replicate the setup at a third (or fourth, fifth...) location:

1. **Install Tailscale** on the device
2. **Log in** with the same Tailscale account
3. **Disable other VPNs** (if any)
4. **Open Plex** and sign in

That's it! No additional configuration needed. The device will automatically:
- Join your Tailscale network
- Discover your Plex server(s)
- Connect as "local" via Tailscale
- Stream directly with encryption

## VPN Compatibility

### Using Tailscale with Commercial VPNs

**Problem**: Commercial VPNs (NordVPN, ExpressVPN, etc.) conflict with Tailscale because both try to control network routing.

**Solutions:**

1. **Use them separately** (simplest)
   - Disable commercial VPN when using Tailscale for Plex
   - Enable commercial VPN when you need it for other purposes

2. **Split tunneling** (if supported)
   - Some VPN clients allow excluding specific apps or IP ranges
   - Exclude Tailscale's 100.64.0.0/10 range from the VPN
   - Check your VPN's settings for "split tunneling" option

3. **Choose one or the other**
   - For Plex streaming, Tailscale is better
   - For general privacy/geo-unblocking, commercial VPN is better

## Network Requirements

### Minimal Requirements (Works Everywhere)
- Internet connection
- Ability to connect to Tailscale's coordination server
- Will fall back to DERP relay if needed

### Optimal Requirements (Direct Connection)
- Outbound UDP traffic allowed
- NAT traversal supported (most home routers)
- UPnP or NAT-PMP enabled on router (helpful but not required)
- No symmetric NAT

### Blocked Scenarios (Won't Work)
- Network completely blocks Tailscale coordination servers
- Extreme firewall rules blocking all non-HTTP/HTTPS traffic
- Corporate networks with SSL inspection breaking Tailscale

## Security Considerations

- **Encryption**: All Tailscale traffic is encrypted end-to-end with WireGuard
- **Authentication**: Devices must authenticate with your Tailscale account
- **No open ports**: No need to forward ports on your router
- **Private network**: Only devices on your tailnet can connect
- **Audit logs**: Tailscale provides logs of device connections

## Cost

- **Tailscale**: Free for personal use (up to 100 devices)
- **Plex**: No additional cost beyond existing Plex Pass/subscription
- **Bandwidth**: Uses your existing internet bandwidth, no additional fees

## Summary

| Aspect | Before (Plex Relay) | After (Tailscale) |
|--------|---------------------|-------------------|
| **Connection** | Through Plex servers | Direct encrypted mesh |
| **Speed** | Limited by relay | Full bandwidth |
| **Reliability** | Depends on Plex infrastructure | Direct connection |
| **Privacy** | Data passes through Plex | Stays in your network |
| **Setup** | Automatic | One-time configuration |
| **Works everywhere** | Yes | Yes (DERP fallback) |

## Quick Reference Commands

### Mac
```bash
# Check Tailscale IP
tailscale ip

# Test connection to device
/Applications/Tailscale.app/Contents/MacOS/Tailscale ping 100.x.x.x

# Check network diagnostics
/Applications/Tailscale.app/Contents/MacOS/Tailscale netcheck

# View all devices
/Applications/Tailscale.app/Contents/MacOS/Tailscale status
```

### Windows
```cmd
# Check Tailscale IP
tailscale ip

# Test connection to device
tailscale ping 100.x.x.x

# View all devices
tailscale status
```

### Linux
```bash
# Check Tailscale IP
tailscale ip

# Test connection to device
tailscale ping 100.x.x.x

# View all devices
tailscale status
```

---

*Last updated: January 2026*