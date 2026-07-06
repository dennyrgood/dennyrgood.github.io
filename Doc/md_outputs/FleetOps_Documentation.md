**FLEET OPS**

Tactical Command Dashboard

Technical Documentation & Maintenance Guide

Version 6 \| March 7, 2026

1\. Overview

Fleet Ops (index.html) is a single-file, browser-based network topology
dashboard. It fetches real-time status data from a remote JSON API and
renders an interactive force-directed graph using D3.js v7. The
dashboard displays every monitored host and its services as a live node
map, color-coded by health status.

The page is fully self-contained --- no build step or local server is
required. Open index.html in any modern browser and it will begin
polling automatically.

Key Capabilities

- Live force-directed graph of hosts and their services

- Auto-refreshes every 30 seconds via API polling

- Color-coded link and node states: green = up, red = down, grey = muted
  (host is down)

- Hover tooltips with latency, IP, port, and public endpoint status

- Draggable nodes with viewport bounding constraints

- Zoom and pan (0.5x to 2x)

- Backup API endpoint selectable via ?bkp URL parameter

2\. Architecture

External Dependencies

  --------------------- -------------------------------------------------
  **Dependency**        Purpose

  **D3.js v7 (CDN)**    Force simulation, SVG rendering, zoom/drag

  **Share Tech Mono     Monospace UI font
  (Google Fonts)**      
  --------------------- -------------------------------------------------

Node Hierarchy

The graph is built from three node types arranged in a tree:

  --------------------- -------------------------------------------------
  **Node Type**         Description

  **root**              Single central hub node (FLEET_HUB). Fixed to the
                        center of the canvas. Shows aggregate fleet
                        summary on hover.

  **host**              Each monitored machine. Connected to FLEET_HUB by
                        a thick backbone link.

  **service**           Individual services running on a host. Connected
                        to their parent host by thin sub-links.
  --------------------- -------------------------------------------------

Link Types

  --------------------- -------------------------------------------------
  **CSS Class**         Description

  **.link.backbone**    Thick link (12px) between FLEET_HUB and a host.
                        Glows green when up, red when down.

  **.link.sub**         Thin link (2px) between a host and a service.

  **.link.host-down**   Grey dashed sub-link applied when the parent host
                        is already down, to avoid false alarms.

  **.link.up / .down /  Status classes applied dynamically from API data.
  .unknown**            
  --------------------- -------------------------------------------------

3\. API Data Contract

The dashboard fetches JSON from the endpoint defined by API_URL. The
expected shape is:

> {
>
> \"meta\": {
>
> \"checker_host\": \"my-server\",
>
> \"timestamp_utc\": \"2025-01-01T12:00:00Z\"
>
> },
>
> \"summary\": {
>
> \"machines_total\": 5, \"machines_up\": 4, \"machines_down\": 1,
>
> \"services_total\": 20, \"services_up\": 18, \"services_down\": 2,
>
> \"public_endpoints_total\": 10, \"public_endpoints_up\": 9,
> \"public_endpoints_down\": 1
>
> },
>
> \"machines\": \[
>
> {
>
> \"machine\": {
>
> \"tailscale_name\": \"my-host\",
>
> \"display_name\": \"My Host\",
>
> \"tailscale_ip\": \"100.x.x.x\",
>
> \"primary_role\": \"web server\"
>
> },
>
> \"host\": { \"status\": \"up\", \"response_time_ms\": 12 },
>
> \"services\": \[
>
> {
>
> \"name\": \"nginx\",
>
> \"port\": 80,
>
> \"priority\": \"P\",
>
> \"tailscale_check\": { \"status\": \"up\", \"response_time_ms\": 5,
> \"detail\": \"\" },
>
> \"public_check\": { \"url\": \"https://example.com\", \"status\":
> \"up\", \"response_time_ms\": 120 }
>
> }
>
> \]
>
> }
>
> \]
>
> }

Field Reference

  ------------------------------------ ----------------------------------------------
  **Field**                            Notes

  **meta.checker_host**                Displayed in the header as SOURCE_NODE.

  **meta.timestamp_utc**               ISO 8601 UTC string. Used to compute the live
                                       data-age counter.

  **summary.\***                       Aggregate counts shown in the FLEET_HUB
                                       tooltip.

  **machine.tailscale_name**           Used as the unique node ID --- must be stable
                                       and unique.

  **machine.display_name**             Label rendered on the graph node.

  **host.status**                      \"up\", \"down\", or \"unknown\". Controls
                                       link and node color.

  **service.priority**                 Optional flag (e.g., \"P\"). Shown in node
                                       label and tooltip badge.

  **service.tailscale_check.detail**   Short error message shown in the tooltip when
                                       down.

  **public_check**                     Optional. If absent, tooltip shows \"TAILSCALE
                                       ONLY\".
  ------------------------------------ ----------------------------------------------

4\. How It Works --- Code Walkthrough

Startup & Polling

On load, refreshFleet() is called immediately, then scheduled to run
every 30 seconds via setInterval. Each call fetches the API, updates the
header metadata, and calls drawNetwork(data).

A separate 1-second interval reads lastTimestamp to update the \"Xs
ago\" data-age counter without triggering a full re-render.

drawNetwork(data)

This function tears down and rebuilds the entire SVG on every refresh.
The steps are:

- Clear #graph-container and create a fresh \<svg\>.

- Attach D3 zoom behavior (0.5x to 2x scale).

- Build the nodes array starting with the fixed FLEET_HUB root node.

- Iterate over data.machines: push a host node and a backbone link per
  machine.

- Iterate over each machine\'s services: push a service node and a
  sub-link. If the host is down, the sub-link class is set to
  \"host-down\" instead of the service status.

- Initialize d3.forceSimulation with link, charge, center, and collide
  forces.

- Render link \<path\> elements and node \<g\> elements (circle +
  invisible hit target + text label).

- On each simulation tick, clamp node positions to the viewport and
  recompute curved link paths.

Curved Links

Links are rendered as SVG arc paths using the formula:

> M{sx},{sy}A{dr},{dr} 0 0,1 {tx},{ty}

where dr = 1.5 \* Euclidean distance. This creates a consistent outward
curve on all edges.

Tooltip Behavior

Tooltips use a 300ms delayed hide (scheduleHideTooltip) so hovering
between a node and its tooltip does not flash. Smart positioning clamps
the tooltip within the viewport. Content branches on node type: root
shows fleet summary, host shows IP and ping, service shows port,
latency, and public endpoint.

5\. Maintenance Guide

Changing the API Endpoint

The endpoint is set near the top of the \<script\> block:

> const API_URL = params.has(\'bkp\')
>
> ? \'https://fleet-bkp.ldmathes.cc/api/status\'
>
> : \'https://fleet.ldmathes.cc/api/status\';

Replace the two URLs with your own. The primary URL is used by default;
the backup URL is used when the page is loaded with ?bkp in the query
string (e.g., index.html?bkp).

Changing the Refresh Interval

Find the last line of the script:

> setInterval(refreshFleet, 30000); // 30s Refresh

Change 30000 to your desired interval in milliseconds (e.g., 60000 for 1
minute).

Adding a New Status State

Status values come directly from the API. To add a new state (e.g.,
\"degraded\"):

- Return \"degraded\" from the API in the relevant status fields.

- Add a CSS rule in the \<style\> block, e.g., .link.degraded { stroke:
  #f2a93b; }

- Add a color case in the showTooltip function\'s statusColor variable.

Adjusting Force Layout

The simulation forces are configured inside drawNetwork():

  --------------------- -------------------------------------------------
  **Parameter**         What to change

  **forceLink distance  Change 220 to increase/decrease spread between
  (backbone)**          hub and hosts.

  **forceLink distance  Change 80 to adjust service node spacing around
  (sub)**               hosts.

  **forceManyBody       Change -2000 for more negative = more repulsion
  strength**            (nodes spread further apart).

  **forceCollide        Change 100 to prevent overlap. Increase if labels
  radius**              collide.
  --------------------- -------------------------------------------------

Adding Fields to Tooltips

Tooltip content is built in the showTooltip() function. Each node type
has its own branch (root / host / service). To surface a new field from
the API, add it to the node object in the drawNetwork() forEach loop,
then append it to the content string in the relevant tooltip branch.

Example --- adding an \"os\" field to host nodes:

- In the machines.forEach loop, add os: m.machine.os to the host node
  object.

> if (d.os) content += \`\<br\>OS: \<span
> style=\'color:var(\--text-main)\'\>\${d.os}\</span\>\`;

Theming & Colors

All colors are defined as CSS custom properties in :root at the top of
the \<style\> block:

  --------------------- -------------------------------------------------
  **Variable**          Default / Purpose

  **\--bg-color**       #04060b --- Dark background

  **\--text-main**      #a9b7c6 --- Body text

  **\--neon-green**     #39ff14 --- \"Up\" status color

  **\--neon-red**       #7a1515 --- \"Down\" status color

  **\--node-blue**      #6b93cf --- Healthy node fill

  **\--grid**           rgba(57,255,20,0.03) --- Background grid lines
  --------------------- -------------------------------------------------

6\. Troubleshooting

  ------------------- ---------------------------------------------------
  **Symptom**         Likely Cause & Fix

  **Red \"Sync        API fetch failed. Check CORS headers on the server,
  Error\" in          verify the URL is reachable from the browser, and
  top-right corner**  inspect the browser console for details.

  **Graph is empty /  API returned unexpected JSON shape. Open DevTools
  blank canvas**      \> Network to inspect the raw response and confirm
                      it matches the schema in Section 3.

  **Nodes overlap or  Force parameters may need tuning. Increase
  fly off-screen**    forceCollide radius or reduce forceManyBody
                      strength. The bounding box clamps nodes to the
                      viewport but does not prevent overlap.

  **Data age counter  meta.timestamp_utc is missing or not a valid ISO
  stuck at 0s ago**   date string. Verify the API is returning this
                      field.

  **Backup endpoint   Ensure the URL contains ?bkp (not &bkp). Only the
  not loading**       first query parameter works without an existing ?.
                      Use index.html?bkp=1 to be safe.

  **Tooltip appears   This is handled automatically by the
  off-screen**        smart-positioning code. If it persists, check that
                      the browser viewport is not being constrained by an
                      iframe or transform.
  ------------------- ---------------------------------------------------
