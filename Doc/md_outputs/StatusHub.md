\"This is a planning handoff document for a project we were designing.
Please read it and confirm you understand the current state. No code yet
--- we are still in the planning phase and will explicitly say when we
are ready to code.\"

Fleet Status Dashboard --- Planning Handoff

Project Summary A web-based status dashboard showing real-time health of
a 6-machine fleet. Two independent checker services run on Amsterdam and
ChatWorkhorse, writing JSON status files to a shared OneDrive directory.
Two independent Fleet API Flask apps serve that data publicly. A static
GitHub Pages frontend at
[www.ldmathes.cc/status](http://www.ldmathes.cc/status) polls the
primary API; a backup frontend at
[www.ldmathes.cc/status-bkp](http://www.ldmathes.cc/status-bkp) polls
the backup API. System is modular --- new check types, machines,
services, and reporters can be added by configuration or by dropping in
a new module without touching existing code.

System Outline

Amsterdam (amsterdamdesktop)

- Checker Service --- Python process, Task Scheduler, no ports

- Fleet API --- Flask app, Task Scheduler, port 5010

- Existing Flask services (5000, 5001, 5005, 8080)

- cloudflared tunnel process

ChatWorkhorse (chatworkhorse)

- Checker Service --- Python process, Task Scheduler, no ports (backup
  instance)

- Fleet API --- Flask app, Task Scheduler, port 5010 (backup instance)

- cloudflared tunnel process

OneDrive (shared, synced)

- server_status\_\*.json --- written by Checker, read by Fleet API

- checker\_\*.log --- written by Checker

- No health checking of OneDrive itself --- separate existing process
  handles that

Cloudflare

- fleet.ldmathes.cc → Amsterdam port 5010

- fleet-bkp.ldmathes.cc → ChatWorkhorse port 5010

- All existing tunnels unchanged

- No Load Balancer --- failover is manual navigation

GitHub Pages ([www.ldmathes.cc](http://www.ldmathes.cc) repo)

- /status --- primary frontend, polls fleet.ldmathes.cc/api/status

- /status-bkp --- backup frontend, polls
  fleet-bkp.ldmathes.cc/api/status

User\'s Browser

- Normal: visits [www.ldmathes.cc/status](http://www.ldmathes.cc/status)

- If Amsterdam down: manually navigates to
  [www.ldmathes.cc/status-bkp](http://www.ldmathes.cc/status-bkp)

Setup Tasks Required Before Coding Is Complete

Cloudflare Tunnel --- Amsterdam

- Add new tunnel entry: fleet.ldmathes.cc → localhost:5010

- Verify Zero Trust Access policy covers fleet.ldmathes.cc

- CORS on Fleet API restricted to
  [www.ldmathes.cc](http://www.ldmathes.cc) only

Cloudflare Tunnel --- ChatWorkhorse

- Add new tunnel entry: fleet-bkp.ldmathes.cc → localhost:5010

- Verify Zero Trust Access policy covers fleet-bkp.ldmathes.cc

- CORS on Fleet API restricted to
  [www.ldmathes.cc](http://www.ldmathes.cc) only

Task Scheduler --- Amsterdam

- New entry: Checker Service --- runs checker.py on startup, restarts on
  failure

- New entry: Fleet API --- runs fleet_api.py on startup, restarts on
  failure

Task Scheduler --- ChatWorkhorse

- New entry: Checker Service --- runs checker.py on startup, restarts on
  failure

- New entry: Fleet API --- runs fleet_api.py on startup, restarts on
  failure

GitHub Pages

- Create /status subdirectory in
  [www.ldmathes.cc](http://www.ldmathes.cc) repo

- Create /status-bkp subdirectory in
  [www.ldmathes.cc](http://www.ldmathes.cc) repo

- /status/index.html polls fleet.ldmathes.cc/api/status

- /status-bkp/index.html polls fleet-bkp.ldmathes.cc/api/status

OneDrive

- Confirm OneDrive sync path accessible from both Amsterdam and
  ChatWorkhorse

- Confirm write permissions for both checker instances

- Confirm path is consistent on both machines (may differ if user
  profiles differ)

The Fleet Name Tailscale Name IP Primary Role ImageBeast imagebeast
100.107.247.38 ComfyUI Primary ChatWorkhorse chatworkhorse
100.124.162.73 Ollama Primary TravelBeast travelbeast 100.73.82.42
Mobile/Travel Amsterdam amsterdamdesktop 100.125.37.114 Flask /
OpenWebUI Primary MacBook Air Prime denniss-macbook-air 100.72.187.19
Ollama B99 MacBook Air 2 denniss-2nd-macbook-air 100.84.152.110 Ollama
B99

Service Priority Codes

- P --- Primary. Intended host for this service under normal conditions.

- B2 --- Real backup. Legitimate second option, expected to work
  reliably.

- B5 --- Capable but not preferred. Works but not optimized for this
  role.

- B9 --- Last resort on this network. Technically possible but not
  recommended.

- B99 --- Theoretical only. Present on the tailnet but not a meaningful
  fallback in practice. The numbers are intentional gaps communicating
  \"how serious is this as a backup.\" A B2 is a real failover option. A
  B99 is essentially just \"this machine has the software installed.\"

Service Inventory Machine Service Port Priority Checks ImageBeast
ComfyUI 8188 P Tailscale + Cloudflare ImageBeast Ollama 11434 B2
Tailscale only ImageBeast OpenWebUI 8080 B2 Tailscale only ChatWorkhorse
ComfyUI 8188 B2 Tailscale + Cloudflare ChatWorkhorse Ollama 11434 P
Tailscale + Cloudflare ChatWorkhorse OpenWebUI 8080 P Tailscale +
Cloudflare TravelBeast ComfyUI 8188 B5 Tailscale only TravelBeast Ollama
11434 B5 Tailscale only Amsterdam ComfyUI 8188 B9 Tailscale + Cloudflare
Amsterdam Ollama 11434 B9 Tailscale + Cloudflare Amsterdam Flask/API
5000 P Tailscale + Cloudflare Amsterdam Flask/API-Edit 5001 P
Tailscale + Cloudflare Amsterdam Flask/Weather 5005 P Tailscale +
Cloudflare Amsterdam OpenWebUI 8080 P Tailscale + Cloudflare Amsterdam
Fleet API 5010 P Tailscale + Cloudflare MacBook Air Prime Ollama 11434
B99 Tailscale only MacBook Air 2 Ollama 11434 B99 Tailscale only

Note: Cloudflare tunnel not installed on TravelBeast or MacBooks ---
Tailscale checks only for those machines.

Cloudflare Public Endpoints Machine Public URL Service Check Behavior
ImageBeast image.ldmathes.cc ComfyUI Any HTTP response = pass
ChatWorkhorse clip.ldmathes.cc ComfyUI Any HTTP response = pass
ChatWorkhorse chat.ldmathes.cc OpenWebUI Any HTTP response = pass
ChatWorkhorse ollama.ldmathes.cc Ollama Any HTTP response = pass
Amsterdam api.ldmathes.cc Flask API (5000) Any HTTP response = pass
Amsterdam api-edit.ldmathes.cc Flask API-Edit (5001) Any HTTP response =
pass Amsterdam weatherproxy.ldmathes.cc Flask Weather (5005) Any HTTP
response = pass Amsterdam chat.ldmathes.cc OpenWebUI (8080) Any HTTP
response = pass Amsterdam fleet.ldmathes.cc Fleet API (5010) Any HTTP
response = pass ChatWorkhorse fleet-bkp.ldmathes.cc Fleet API (5010) Any
HTTP response = pass

Note: weather.ldmathes.cc points to a GitHub Pages static site --- not a
backend service, excluded from checks. weatherproxy specifically returns
error JSON on bare GET --- this is a passing result.

Three-Layer Check Architecture

- Layer 1 --- Host reachability: TCP connect to Tailscale MagicDNS short
  hostname. If down, all services on that machine marked unknown without
  further checks.

- Layer 2 --- Service health: HTTP GET to service-specific health
  endpoint via Tailscale. Valid response of any kind = passing. Timeouts
  and connection failures = failing.

- Layer 3 --- Public endpoint: HTTPS GET to Cloudflare URL over normal
  internet (not Tailscale). Any HTTP response including Zero Trust auth
  redirects (302/401) = passing. Timeouts, DNS failures, 5xx = failing.
  Only applies to machines with Cloudflare tunnel installed.

Layer 2 Health Endpoints by Service Type Service Endpoint Detail
Captured Ollama GET /api/tags + GET /api/ps Model count + active model
in VRAM ComfyUI GET /system_stats + GET /queue GPU name, VRAM
used/total, queue depth OpenWebUI GET /health \"healthy\" only Flask
services GET / HTTP status code only TCP only n/a \"port open\" only

ComfyUI API limitation: no endpoint exists to identify which specific
model is loaded in VRAM. VRAM usage numbers are available but model name
is not.

Detail String Formats Service Example Detail (passing) Example Detail
(failing) Ollama \"12 models available · llama3:8b active in VRAM\"
\"Connection timeout\" Ollama (idle) \"12 models available · none
active\" ComfyUI \"VRAM: 18.2GB / 32GB · GPU: RTX 5090 · Queue: 2
running, 5 pending\" \"HTTP 502\" ComfyUI (idle) \"VRAM: 4.1GB / 32GB ·
GPU: RTX 5090 · Queue: idle\" OpenWebUI \"healthy\" \"Connection
timeout\" Flask \"HTTP 200\" \"DNS resolution failed\" Flask (error)
\"HTTP 400 --- service alive\" TCP \"port open\" \"Connection refused\"

Note: VRAM values from /system_stats are in bytes --- checker converts
to GB. If rich data call succeeds but stats unavailable, detail reads
\"port open --- stats unavailable\" and status remains up.

Modular Architecture Four layers with clean boundaries.

Config --- defines what exists (machines, services, ports, check types,
public endpoints). Adding a new machine or service means editing config
only, no code changes.

Checkers --- one module per check type (TCP connect, HTTP GET, Ollama
API, ComfyUI API, OpenWebUI health, Flask alive). Standard interface:
takes a config entry, returns a standard result object. Adding a new
check type means adding one new checker module, nothing else changes.

Engine --- orchestrates polling loop, calls checkers, assembles state,
passes to reporters. Knows nothing about specific machines or services
--- driven entirely by config.

Reporters --- one module per output type (JSON file writer, log writer,
Flask API server). Standard interface: receives completed state object,
does something with it. Adding a new reporter later means adding one new
reporter module, nothing else changes.

Standard Result Contract Every check regardless of type returns:

- machine --- display name

- service --- display name

- check_type --- tailscale_tcp / tailscale_http / public_http

- status --- up / down / unknown

- response_time_ms

- timestamp_utc

- detail --- null when clean, populated string when not

Three-Part Architecture

Part 1 --- Checker Service (Task Scheduler, no web component):

- Runs background polling loop every 30 seconds

- Calls checker modules for all machines and services per config

- Assembles standard result objects into master state

- Passes state to all reporter modules

- Reporters write one JSON file per machine + one master JSON file to
  OneDrive directory

- Reporters write append-only log file per checker instance to OneDrive
  directory

- Runs silently, no ports, no web server

- Launched by Task Scheduler on Amsterdam and ChatWorkhorse
  independently

Part 2 --- Fleet API Service (Task Scheduler, separate process):

- New dedicated Flask app on port 5010

- On request reads current master JSON file from OneDrive directory

- Serves it at /api/status

- CORS restricted to [www.ldmathes.cc](http://www.ldmathes.cc) only

- Does no checking itself --- purely a file reader and HTTP responder

- Stateless --- if restarted reads whatever JSON file is currently on
  disk

- Runs on Amsterdam (fleet.ldmathes.cc) and ChatWorkhorse
  (fleet-bkp.ldmathes.cc) independently

Part 3 --- GitHub Pages Frontend:

- Static HTML/JS in /status and /status-bkp subdirectories of
  [www.ldmathes.cc](http://www.ldmathes.cc) repo

- /status polls fleet.ldmathes.cc/api/status

- /status-bkp polls fleet-bkp.ldmathes.cc/api/status

- Always reachable even if both checker instances are down

- Shows clear error/stale state if API unreachable or data timestamp is
  old

- Converts UTC timestamps to local time for display

- Protected by Cloudflare Zero Trust Access

Data Storage

- One JSON file per machine in OneDrive sync directory

- One master JSON file combining all machines --- this is what Fleet API
  serves

- Current state only --- no history retention

- All files written every poll cycle by Checker Service

- Append-only log files in same OneDrive directory

- All timestamps UTC throughout --- frontend converts to local time for
  display only

File/Directory Layout (OneDrive) OneDrive/\_sync_monitor/

- server_status_imagebeast.json

- server_status_chatworkhorse.json

- server_status_travelbeast.json

- server_status_amsterdamdesktop.json

- server_status_denniss-macbook-air.json

- server_status_denniss-2nd-macbook-air.json

- server_status_all.json

- checker_amsterdam.log

- checker_chatworkhorse.log

Polling & Timing

- Checker Service loop every 30 seconds

- Frontend polls Fleet API every 30 seconds

- Tailscale TCP check timeout: 500ms

- Tailscale HTTP check timeout: 2 seconds

- Public endpoint check timeout: 5 seconds

- Host check (Layer 1) runs first --- skip Layer 2 and 3 if host
  unreachable

- All timestamps UTC at write time

Per-Machine JSON Schema Written to OneDrive as
server_status\_{machinename}.json after every poll cycle.

{ \"machine\": { \"display_name\": \"ImageBeast\", \"tailscale_name\":
\"imagebeast\", \"tailscale_ip\": \"100.107.247.38\", \"primary_role\":
\"ComfyUI Primary\" }, \"poll\": { \"timestamp_utc\":
\"2026-03-04T14:32:00Z\", \"poll_duration_ms\": 842, \"checker_host\":
\"amsterdamdesktop\" }, \"host\": { \"status\": \"up\",
\"response_time_ms\": 12 }, \"services\": \[ { \"name\": \"ComfyUI\",
\"port\": 8188, \"priority\": \"P\", \"tailscale_check\": { \"status\":
\"up\", \"response_time_ms\": 45, \"detail\": \"VRAM: 18.2GB / 32GB ·
GPU: RTX 5090 · Queue: idle\" }, \"public_check\": { \"url\":
\"<https://image.ldmathes.cc>\", \"status\": \"up\", \"http_code\": 302,
\"response_time_ms\": 210, \"detail\": \"Zero Trust redirect\" } }, {
\"name\": \"Ollama\", \"port\": 11434, \"priority\": \"B2\",
\"tailscale_check\": { \"status\": \"up\", \"response_time_ms\": 38,
\"detail\": \"12 models available · llama3:8b active in VRAM\" },
\"public_check\": null }, { \"name\": \"OpenWebUI\", \"port\": 8080,
\"priority\": \"B2\", \"tailscale_check\": { \"status\": \"up\",
\"response_time_ms\": 22, \"detail\": \"healthy\" }, \"public_check\":
null } \] }

Master JSON Schema Written to server_status_all.json and served at
/api/status by Fleet API.

{ \"meta\": { \"timestamp_utc\": \"2026-03-04T14:32:00Z\",
\"checker_host\": \"amsterdamdesktop\", \"poll_interval_seconds\": 30,
\"fleet_version\": \"1.0\" }, \"summary\": { \"machines_total\": 6,
\"machines_up\": 5, \"machines_down\": 0, \"machines_unknown\": 1,
\"services_total\": 16, \"services_up\": 14, \"services_down\": 1,
\"services_unknown\": 1, \"public_endpoints_total\": 8,
\"public_endpoints_up\": 7, \"public_endpoints_down\": 1 },
\"machines\": \[ { \"\...per-machine object as above\...\" } \] }

Notes on master schema:

- machines array contains full per-machine objects inline --- frontend
  fetches one URL only

- summary block pre-calculated by engine --- frontend does no math

- machines_unknown counts machines whose host check failed --- services
  not attempted

- services_unknown counts services on unreachable hosts --- distinct
  from confirmed down

- fleet_version allows frontend to detect schema changes gracefully

- checker_host identifies which instance is currently serving ---
  visible during failover

Dashboard UI

- Mobile-first, iPhone 15 Pro Max primary target

- Global health summary bar at top (e.g. \"14/16 services healthy · 7/8
  public endpoints reachable\")

- One card per machine: name, role, Tailscale host status, service rows
  with dual indicators (Tailscale \| Public where applicable), response
  times, detail strings, last checked timestamp

- MacBook Air Prime and MacBook Air 2 visually lighter treatment ---
  present but clearly secondary

- All offline machines show last seen timestamp regardless of priority

- Clear visual indicator when API itself is unreachable (frontend up,
  backend down, data stale)

- Auto-refreshes every 30 seconds

- UTC timestamps converted to user local time for display

Tech Stack

- Checker Service: Python, stdlib only, no external dependencies

- Fleet API: Python, Flask, stdlib only, no SQLite, no external
  dependencies beyond Flask

- Data: JSON files and plain text logs written to OneDrive sync
  directory

- Frontend: Static HTML/JS in /status and /status-bkp subdirectories of
  [www.ldmathes.cc](http://www.ldmathes.cc) GitHub Pages repo

- CORS: Fleet API restricted to
  [www.ldmathes.cc](http://www.ldmathes.cc) only

- Hosting: Windows Task Scheduler on Amsterdam and ChatWorkhorse

- Tunnel: cloudflared already installed on Amsterdam, ChatWorkhorse,
  ImageBeast

APPENDIX A --- Ollama API Reference

Health check: GET /api/tags --- lists installed models. Valid JSON =
passing. Provides model count. Active model: GET /api/ps --- models
currently loaded in VRAM. Base URL:
http://{tailscale-shortname}:11434/api/tags

APPENDIX B --- ComfyUI API Reference

Health check: GET /system_stats --- GPU name, VRAM total, VRAM free in
bytes (convert to GB). Queue depth: GET /queue --- queue_running and
queue_pending array lengths = job counts. Base URL:
http://{tailscale-shortname}:8188/system_stats Limitation: No API
endpoint exists to identify which model is loaded in VRAM. This is a
ComfyUI API limitation.

APPENDIX C --- OpenWebUI API Reference

Health check: GET /health --- returns {\"status\": true}. Any 200 =
passing. Base URL: http://{tailscale-shortname}:8080/health

APPENDIX D --- Amsterdam Flask Services

Existing services on amsterdamdesktop via Cloudflare Tunnel:

- api.ldmathes.cc → localhost:5000

- api-edit.ldmathes.cc → localhost:5001

- weatherproxy.ldmathes.cc → localhost:5005 --- GET / returns error JSON
  (passing)

- chat.ldmathes.cc → localhost:8080 (OpenWebUI)

- fleet.ldmathes.cc → localhost:5010 (this project --- new)

APPENDIX E --- ChatWorkhorse Flask Services

- fleet-bkp.ldmathes.cc → localhost:5010 (this project --- new)

Older Versions

\"This is a planning handoff document for a project we were designing.
Please read it and confirm you understand the current state. No code yet
--- we are still in the planning phase and will explicitly say when we
are ready to code.\"

Fleet Status Dashboard --- Planning Handoff

Project Summary

A web-based status dashboard showing real-time health of a 6-machine
fleet. Flask backend runs on Amsterdam as a Task Scheduler service,
checks all machines and services, and writes status JSON files to a
shared OneDrive directory. A static GitHub Pages frontend served at
status.ldmathes.cc polls the Flask JSON API and renders the dashboard.
Frontend is always reachable even if Amsterdam is down --- it just shows
stale or error state. System is designed to be modular --- new check
types, machines, services, and reporters can be added later by
configuration or by dropping in a new module, without touching existing
code.

Host Machine

Amsterdam (Acer Aspire TC-885) --- Windows 11, Flask app launched via
Task Scheduler.

The Fleet

Name Tailscale Name IP Primary Role

ImageBeast imagebeast 100.107.247.38 ComfyUI Primary

ChatWorkhorse chatworkhorse 100.124.162.73 Ollama Primary

TravelBeast travelbeast 100.73.82.42 Mobile/Travel

Amsterdam amsterdamdesktop 100.125.37.114 Flask / OpenWebUI Primary

MacBook Air Prime denniss-macbook-air 100.72.187.19 Ollama B99

MacBook Air 2 denniss-2nd-macbook-air 100.84.152.110 Ollama B99

Service Priority Codes

P --- Primary. Intended host for this service under normal conditions.

B2 --- Real backup. Legitimate second option, expected to work reliably.

B5 --- Capable but not preferred. Works but not optimized for this role.

B9 --- Last resort on this network. Technically possible but not
recommended.

B99 --- Theoretical only. Present on the tailnet but not a meaningful
fallback in practice.

The numbers are intentional gaps communicating \"how serious is this as
a backup.\" A B2 is a real failover option. A B99 is essentially just
\"this machine has the software installed.\"

Service Inventory

Machine Service Port Priority Checks

ImageBeast ComfyUI 8188 P Tailscale + Cloudflare

ImageBeast Ollama 11434 B2 Tailscale only

ImageBeast OpenWebUI 8080 B2 Tailscale only

ChatWorkhorse ComfyUI 8188 B2 Tailscale + Cloudflare

ChatWorkhorse Ollama 11434 P Tailscale + Cloudflare

ChatWorkhorse OpenWebUI 8080 P Tailscale + Cloudflare

TravelBeast ComfyUI 8188 B5 Tailscale only

TravelBeast Ollama 11434 B5 Tailscale only

Amsterdam ComfyUI 8188 B9 Tailscale + Cloudflare

Amsterdam Ollama 11434 B9 Tailscale + Cloudflare

Amsterdam Flask/API 5000 P Tailscale + Cloudflare

Amsterdam Flask/API-Edit 5001 P Tailscale + Cloudflare

Amsterdam Flask/Weather 5005 P Tailscale + Cloudflare

Amsterdam Flask/Chat 8080 P Tailscale + Cloudflare

Amsterdam OpenWebUI 3000 P Tailscale + Cloudflare

MacBook Air Prime Ollama 11434\* B99 Tailscale only

MacBook Air 2 Ollama 11434\* B99 Tailscale only

\*MacBook Air Ollama port assumed default 11434 --- unconfirmed.

Note: Cloudflare tunnel not installed on TravelBeast or MacBooks ---
Tailscale checks only for those machines.

Cloudflare Public Endpoints

Machine Public URL Service Check Behavior

ImageBeast image.ldmathes.cc ComfyUI Any HTTP response = pass

ChatWorkhorse clip.ldmathes.cc ComfyUI Any HTTP response = pass

ChatWorkhorse chat.ldmathes.cc OpenWebUI Any HTTP response = pass

ChatWorkhorse (ollama endpoint TBD) Ollama Any HTTP response = pass

Amsterdam api.ldmathes.cc Flask API (5000) Any HTTP response = pass

Amsterdam api-edit.ldmathes.cc Flask API-Edit (5001) Any HTTP response =
pass

Amsterdam weatherproxy.ldmathes.cc Flask Weather (5005) Any HTTP
response = pass

Amsterdam (openwebui endpoint TBD) OpenWebUI Any HTTP response = pass

Note: weather.ldmathes.cc points to a GitHub Pages static site --- not a
backend service, excluded from checks. clip.ldmathes.cc confirmed mapped
to ChatWorkhorse ComfyUI (8188).

Three-Layer Check Architecture

Layer 1 --- Host reachability: TCP connect to MagicDNS short hostname
via Tailscale. If down, all services on that machine marked unknown
without further checks.

Layer 2 --- Service health: HTTP GET to service-specific health endpoint
via Tailscale. See health endpoint table below. Valid response of any
kind = passing. Timeouts and connection failures = failing.

Layer 3 --- Public endpoint: HTTPS GET to Cloudflare URL over normal
internet (not Tailscale). Any HTTP response including Zero Trust auth
redirects (302/401) = passing. Timeouts, DNS failures, 5xx = failing.
Only applies to machines with Cloudflare tunnel installed.

Layer 2 Health Endpoints by Service Type

Service Health Endpoint Expected Response Notes

Ollama GET /api/tags JSON model list Valid JSON = pass

ComfyUI GET /system_stats JSON stats object Valid JSON = pass

OpenWebUI GET /health {\"status\": true} Any 200 = pass

Flask services GET / Any HTTP response Error JSON fine, timeout = fail

weatherproxy specifically returns error JSON on bare GET --- this is a
passing result.

Modular Architecture

The system is built in four layers with clean boundaries so new check
types, machines, services, and reporters can be added later without
touching existing code.

Config --- defines what exists (machines, services, ports, check types,
public endpoints). Adding a new machine or service means editing config
only.

Checkers --- one module per check type (TCP connect, HTTP GET, Ollama
API, ComfyUI API, OpenWebUI health, Flask alive). Standard interface:
takes a config entry, returns a standard result object. Adding a new
check type means adding one new checker module, nothing else changes.

Engine --- orchestrates polling loop, calls checkers, assembles state,
passes to reporters. Knows nothing about specific machines or services
--- driven entirely by config.

Reporters --- one module per output type (JSON file writer, log writer,
Flask API server). Standard interface: receives completed state object,
does something with it. Adding a new reporter (e.g. a future OneDrive
health subsystem integration) means adding one new reporter module,
nothing else changes.

Standard Result Contract

Every check regardless of type returns the same structure:

machine (display name)

service (display name)

check_type (tailscale_tcp / tailscale_http / public_http)

status (up / down / unknown)

response_time_ms

timestamp_utc

detail (optional human-readable message, e.g. error text or HTTP status
code)

Two-Part Architecture

Part 1 --- Flask backend on Amsterdam (Task Scheduler):

Runs background polling loop every 30 seconds

Calls checker modules for all machines and services per config

Assembles standard result objects into master state

Passes state to all reporter modules

Reporters write: one JSON file per machine + one master JSON file to
OneDrive directory

Reporters write: append-only log file per checker instance to OneDrive
directory

Serves master JSON at status.ldmathes.cc/api/status via Cloudflare
Tunnel

All timestamps UTC

Part 2 --- GitHub Pages frontend (static site at status.ldmathes.cc):

Polls status.ldmathes.cc/api/status every 30 seconds

Renders dashboard from JSON response

Always reachable even if Amsterdam is down

Shows clear error/stale state if API unreachable or data timestamp is
old

Converts UTC timestamps to local time for display

Protected by Cloudflare Zero Trust Access

Redundancy

Amsterdam is the primary checker host. ChatWorkhorse runs an identical
Flask checker instance as backup. Cloudflare Load Balancer with health
checks handles automatic failover between the two origins. Each instance
runs independently --- no replication, no coordination. If Amsterdam is
down, ChatWorkhorse\'s checker correctly shows Amsterdam as offline and
serves that state to the frontend.

Data Storage

One JSON file per machine in OneDrive sync directory

One master JSON file combining all machines --- this is what the API
serves

Current state only --- no history retention

All files written every poll cycle

OneDrive sync latency acceptable --- files are for backup/forensics, not
real-time reads

Append-only log files in same OneDrive directory

File/Directory Layout (OneDrive)

OneDrive/\_sync_monitor/

server_status_imagebeast.json

server_status_chatworkhorse.json

server_status_travelbeast.json

server_status_amsterdamdesktop.json

server_status_denniss-macbook-air.json

server_status_denniss-2nd-macbook-air.json

server_status_all.json

checker_amsterdam.log

checker_chatworkhorse.log

Polling & Timing

Background loop every 30 seconds

Frontend polls Flask JSON API every 30 seconds

Tailscale TCP check timeout: 500ms

Tailscale HTTP check timeout: 2 seconds

Public endpoint check timeout: 5 seconds

Host check (Layer 1) runs first --- skip Layer 2 and 3 if host
unreachable

All timestamps UTC at write time

Dashboard UI

Mobile-first, iPhone 15 Pro Max primary target

Global health summary bar at top (e.g. \"14/16 services healthy · 7/8
public endpoints reachable\")

One card per machine: name, role, Tailscale status, service rows with
dual indicators (Tailscale \| Public where applicable), response times,
last checked timestamp

MacBook Air Prime and MacBook Air 2 visually lighter treatment ---
present but clearly secondary

All offline machines show last seen timestamp regardless of priority

Clear visual indicator when API itself is unreachable

Auto-refreshes every 30 seconds

UTC timestamps converted to user local time for display

Tech Stack

Backend: Python, Flask --- stdlib only, no SQLite, no external
dependencies beyond Flask

Data: JSON files and plain text logs written to OneDrive sync directory

Frontend: Static HTML/JS --- GitHub Pages, served at status.ldmathes.cc
via Cloudflare DNS

Hosting: Windows Task Scheduler on Amsterdam (primary) and ChatWorkhorse
(backup)

Tunnel: cloudflared already installed on Amsterdam, ChatWorkhorse,
ImageBeast

Open Items (must resolve before coding)

Confirm ChatWorkhorse Ollama public Cloudflare endpoint if one exists.

Confirm Amsterdam OpenWebUI public Cloudflare endpoint if one exists.

Confirm MacBook Air Ollama port (assumed 11434).

Create GitHub Pages repo and confirm it resolves at status.ldmathes.cc.

Confirm Flask service health check approach --- bare GET to / is current
assumption.

Next Step

Continue planning: finalize the JSON status file schema and the API
response schema. No code until all open items are resolved.

APPENDIX A --- Ollama API Reference

Health check: GET /api/tags --- lists installed models. Valid JSON =
passing.

Also useful: GET /api/ps --- models currently loaded in VRAM.

Also useful: GET /api/version --- lightest possible check.

Base URL: http://{tailscale-shortname}:11434/api/tags

APPENDIX B --- ComfyUI API Reference

Health check: GET /system_stats --- version, system info, VRAM usage.
Recommended.

Also useful: GET /queue --- pending and running jobs.

Base URL: http://{tailscale-shortname}:8188/system_stats

Note: WebSockets and POST endpoints exist for workflow execution --- not
relevant to health checking.

APPENDIX C --- OpenWebUI API Reference

Health check: GET /health --- returns {\"status\": true}.

Base URL: http://{tailscale-shortname}:8080/health

Same endpoint applies on all machines running OpenWebUI.

APPENDIX D --- Amsterdam Flask Services

All running on amsterdamdesktop via Cloudflare Tunnel:

weatherproxy.ldmathes.cc → localhost:5005 --- health check: GET /
returns error JSON (passing)

api.ldmathes.cc → localhost:5000 --- health check: GET / any response =
passing

api-edit.ldmathes.cc → localhost:5001 --- health check: GET / any
response = passing

chat.ldmathes.cc → localhost:8080 --- health check: GET / any response =
passing

TODO before next chat session:

Cloudflare

Confirm ChatWorkhorse Ollama public endpoint if one exists

Confirm Amsterdam OpenWebUI public endpoint if one exists

Services

Confirm MacBook Air Ollama port

Infrastructure

Create GitHub Pages repo, confirm resolves at status.ldmathes.cc

Older versions:

\"This is a planning handoff document for a project we were designing.
Please read it and confirm you understand the current state. No code yet
--- we are still in the planning phase and will explicitly say when we
are ready to code.\"

Fleet Status Dashboard --- Planning Handoff

Project Summary

A web-based status dashboard showing real-time health of a 6-machine
fleet. Flask backend runs on Amsterdam as a Task Scheduler service,
checks all machines and services, and writes one JSON status file per
machine to a shared OneDrive directory. A static GitHub Pages frontend
served at status.ldmathes.cc polls the Flask JSON API and renders the
dashboard. Frontend is always reachable even if Amsterdam is down --- it
just shows stale or error state.

Host Machine

Amsterdam (Acer Aspire TC-885) --- Windows 11, Flask app launched via
Task Scheduler.

The Fleet

Name Tailscale Name IP Primary Role

ImageBeast imagebeast 100.107.247.38 ComfyUI Primary

ChatWorkhorse chatworkhorse 100.124.162.73 Ollama Primary

TravelBeast travelbeast 100.73.82.42 Mobile/Travel

Amsterdam amsterdamdesktop 100.125.37.114 Flask / OpenWebUI Primary

MacBook Air Prime denniss-macbook-air 100.72.187.19 Ollama B99

MacBook Air 2 denniss-2nd-macbook-air 100.84.152.110 Ollama B99

Service Priority Codes

P --- Primary. Intended host for this service under normal conditions.

B2 --- Real backup. Legitimate second option, expected to work reliably.

B5 --- Capable but not preferred. Works but not optimized for this role.

B9 --- Last resort on this network. Technically possible but not
recommended.

B99 --- Theoretical only. Present on the tailnet but not a meaningful
fallback in practice. The numbers are intentional gaps communicating
\"how serious is this as a backup.\" A B2 is a real failover option. A
B99 is essentially just \"this machine has the software installed.\"

Service Inventory

Machine Service Port Priority Checks

ImageBeast ComfyUI 8188 P Tailscale + Cloudflare

ImageBeast Ollama 11434 B2 Tailscale only

ChatWorkhorse ComfyUI 8188 B2 Tailscale + Cloudflare

ChatWorkhorse Ollama 11434 P Tailscale + Cloudflare

ChatWorkhorse OpenWebUI 3000 B2 Tailscale + Cloudflare

TravelBeast ComfyUI 8188 B5 Tailscale only

TravelBeast Ollama 11434 B5 Tailscale only

Amsterdam ComfyUI 8188 B9 Tailscale + Cloudflare

Amsterdam Ollama 11434 B9 Tailscale + Cloudflare

Amsterdam Flask/API 5000 P Tailscale + Cloudflare

Amsterdam Flask/API-Edit 5001 P Tailscale + Cloudflare

Amsterdam Flask/Weather 5005 P Tailscale + Cloudflare

Amsterdam Flask/Chat 8080 P Tailscale + Cloudflare

Amsterdam OpenWebUI 3000 P Tailscale + Cloudflare (confirm port)

MacBook Air Prime Ollama TBD B99 Tailscale only

MacBook Air 2 Ollama TBD B99 Tailscale only

Note: MacBook Air port for Ollama assumed 11434 (default) but
unconfirmed. Cloudflare tunnel not installed on TravelBeast or MacBooks
--- Tailscale checks only for those machines.

Cloudflare Public Endpoints

Machine Public URL Service

ImageBeast image.ldmathes.cc ComfyUI

ChatWorkhorse chat.ldmathes.cc OpenWebUI

ChatWorkhorse (ollama endpoint TBD) Ollama

Amsterdam api.ldmathes.cc Flask API (port 5000)

Amsterdam api-edit.ldmathes.cc Flask API-Edit (port 5001)

Amsterdam weatherproxy.ldmathes.cc Flask Weather (port 5005)

Amsterdam chat.ldmathes.cc Flask Chat (port 8080)

Amsterdam (openwebui endpoint TBD) OpenWebUI

Note: clip.ldmathes.cc and weather.ldmathes.cc mapping to
machine/service still unconfirmed. Full Cloudflare domain inventory
remains an open item.

Networking

All machines on Tailscale private mesh. MagicDNS short hostnames used in
checker config (imagebeast, chatworkhorse, travelbeast,
amsterdamdesktop, denniss-macbook-air, denniss-2nd-macbook-air).

Cloudflare Tunnel (cloudflared) already installed and running on
Amsterdam, ChatWorkhorse, and ImageBeast.

TravelBeast and MacBooks have no Cloudflare tunnel --- Tailscale checks
only.

Frontend served at status.ldmathes.cc via Cloudflare DNS pointed at
GitHub Pages.

No CORS configuration needed --- frontend and API both under ldmathes.cc
domain.

Three-Layer Check Architecture

Layer 1 --- Host reachability: TCP connect to MagicDNS short hostname
via Tailscale. If down, all services on that machine marked unknown
without further checks.

Layer 2 --- Service health: HTTP GET to service health endpoint via
Tailscale. Ollama uses /api/tags. ComfyUI uses /system_stats. OpenWebUI
health endpoint TBD. Flask services use TCP port connect (or a /health
endpoint if one exists). Valid response = passing.

Layer 3 --- Public endpoint: HTTPS GET to Cloudflare URL over normal
internet (not Tailscale). Any HTTP response including Zero Trust auth
redirects (302/401) = passing. Timeouts, DNS failures, 5xx = failing.
Only applies to machines with Cloudflare tunnel installed.

Two-Part Architecture

Part 1 --- Flask backend on Amsterdam (Task Scheduler):

Runs background polling loop every 30 seconds

Checks all machines and services via Tailscale MagicDNS

Checks all Cloudflare public endpoints via normal internet

Writes one JSON status file per machine to OneDrive sync directory

Also writes a master JSON file (all machines combined) that the frontend
polls

Writes timestamped log entries to OneDrive sync directory

Serves master JSON at status.ldmathes.cc/api/status via Cloudflare
Tunnel

All timestamps in UTC throughout --- frontend converts to local time for
display

Part 2 --- GitHub Pages frontend (static site at status.ldmathes.cc):

Polls status.ldmathes.cc/api/status every 30 seconds

Renders dashboard from JSON response

Always reachable even if Amsterdam is down

Shows clear error/stale state if API is unreachable or timestamp is old

Converts UTC timestamps to local time for display

Protected by Cloudflare Zero Trust Access

Redundancy

Amsterdam is the primary checker host. A second machine (ChatWorkhorse
recommended --- it is the most stable always-on machine after Amsterdam)
runs an identical Flask checker instance as backup. Cloudflare Load
Balancer with health checks handles automatic failover between the two
origins. Each machine runs its checker independently --- no replication,
no coordination. If Amsterdam is down, ChatWorkhorse\'s version of the
data serves the frontend, which will correctly show Amsterdam as
offline.

Data Storage

One JSON file per machine in OneDrive sync directory (e.g.
server_status_imagebeast.json)

One master JSON file combining all machines (server_status_all.json) ---
this is what the API serves

Current state only --- no history retention

All files written every poll cycle

OneDrive sync latency acceptable --- files are for logging/forensics,
not real-time reads

Log files also written to OneDrive directory --- one log file per
checker instance, append-only

File/Directory Layout (OneDrive)

OneDrive/\_sync_monitor/

server_status_imagebeast.json

server_status_chatworkhorse.json

server_status_travelbeast.json

server_status_amsterdamdesktop.json

server_status_denniss-macbook-air.json

server_status_denniss-2nd-macbook-air.json

server_status_all.json

checker_amsterdam.log

checker_chatworkhorse.log

Polling & Timing

Background loop every 30 seconds.

Frontend polls Flask JSON API every 30 seconds.

Tailscale check timeout: \~500ms.

Public endpoint timeout: \~3-5 seconds.

Host check runs first --- skip service checks if host unreachable.

All timestamps UTC at write time.

Dashboard UI

Mobile-first, iPhone 15 Pro Max primary target.

Global health summary bar at top.

One card per machine: name, role, overall status, service rows with dual
indicators (Tailscale \| Public where applicable), response times, last
checked timestamp.

MacBook Air Prime and MacBook Air 2 visually lighter treatment ---
present but clearly secondary.

All offline machines show last seen timestamp (same treatment regardless
of priority).

Clear visual indicator when API itself is unreachable (frontend up,
backend down, data stale).

Auto-refreshes every 30 seconds.

UTC timestamps converted to user local time in frontend display.

Tech Stack

Backend: Python, Flask --- stdlib only where possible, no SQLite, no
ORM.

Data: JSON files, plain text logs --- all written to OneDrive sync
directory.

Frontend: Static HTML/JS --- GitHub Pages, served at status.ldmathes.cc
via Cloudflare DNS.

Hosting: Windows Task Scheduler on Amsterdam (primary) and ChatWorkhorse
(backup).

Tunnel: cloudflared already installed on Amsterdam, ChatWorkhorse,
ImageBeast.

Logging: Append-only log files in OneDrive directory --- delayed sync
acceptable.

Open Items (must resolve before coding)

Complete Cloudflare domain → machine → service mapping
(clip.ldmathes.cc, weather.ldmathes.cc, and any others unconfirmed).

Confirm OpenWebUI health check endpoint (assumed port 3000, no health
URL confirmed).

Confirm MacBook Air Ollama port (assumed 11434 default).

Confirm ChatWorkhorse Ollama public Cloudflare endpoint if one exists.

Confirm Amsterdam OpenWebUI public Cloudflare endpoint if one exists.

Create GitHub Pages repo and confirm it resolves at status.ldmathes.cc.

Decide Flask health check approach for Amsterdam\'s own Flask services
(TCP connect vs /health endpoint).

Next Step

Continue planning: complete the Cloudflare domain inventory, finalize
the JSON status file schema, then finalize the API response schema. No
code until all open items are resolved.

APPENDIX A --- Ollama API Reference

Health check: GET /api/tags --- lists installed models. Valid JSON
response = Ollama fully up.

Also useful: GET /api/ps --- models currently loaded in VRAM.

Also useful: GET /api/version --- lightest possible check.

Base URL pattern: http://{tailscale-shortname}:11434/api/tags

APPENDIX B --- ComfyUI API Reference

Health check: GET /system_stats --- returns version, system info, VRAM
usage. Recommended.

Also useful: GET /queue --- pending and running jobs.

Base URL pattern: http://{tailscale-shortname}:8188/system_stats

Note: ComfyUI uses WebSockets for real-time updates and POST for
workflow execution --- not relevant to health checking.

APPENDIX C --- Amsterdam Flask Services

All running on amsterdamdesktop via Cloudflare Tunnel:

weatherproxy.ldmathes.cc → localhost:5005

api.ldmathes.cc → localhost:5000

api-edit.ldmathes.cc → localhost:5001

chat.ldmathes.cc → localhost:8080

TODO before next chat session:

Cloudflare

Map clip.ldmathes.cc and weather.ldmathes.cc to machine and service.

Identify any other subdomains not yet listed.

Confirm ChatWorkhorse and Amsterdam OpenWebUI public endpoints if they
exist.

Services

Confirm OpenWebUI health check endpoint and port.

Confirm MacBook Air Ollama port.

Confirm whether Amsterdam Flask services have /health endpoints or need
TCP connect checks.

Infrastructure

Create GitHub Pages repo, confirm it resolves correctly at
status.ldmathes.cc.

Confirm ChatWorkhorse is acceptable as backup checker host.

OLD VERSIONS:

\"This is a planning handoff document for a project we were designing.
Please read it and confirm you understand the current state. No code yet
--- we are still in the planning phase and will explicitly say when we
are ready to code.\"

\--plex servers?

\--plex sync'ng

\--onedrive alive?

(See TODO at end)

\"This is a planning handoff document for a project we were designing.
Please read it and confirm you understand the current state. No code yet
--- we are still in the planning phase and will explicitly say when we
are ready to code.\"

Fleet Status Dashboard --- Planning Handoff

Project Summary A web-based status dashboard hosted on Amsterdam showing
real-time health of a 4-machine PC fleet, accessible via a Cloudflare
subdomain (e.g., status.ldmathes.cc), protected by Cloudflare Zero Trust
Access.

Host Machine Amsterdam (Acer Aspire TC-885) --- Windows 11, Flask app
launched via Task Scheduler.

The Fleet Name Tailscale Short Name Role Amsterdam amsterdamdesktop
Primary workstation, dashboard host Ollama Server ollamaserver 24/7 LLM
hosting ImageBeast imagebeast Primary ComfyUI / generative AI
TravelBeast travelbeast Portable/travel, frequently offline

Networking

- All machines on Tailscale private mesh. Short MagicDNS hostnames used
  throughout --- no raw IPs, no full ts.net names.

- Public services exposed via Cloudflare Tunnels + Zero Trust Access.

- Dashboard served via Cloudflare Tunnel on a custom subdomain.

Three-Layer Check Architecture

- Layer 1 --- Host reachability: TCP connect to Tailscale short
  hostname. If down, all services on that machine marked unknown without
  further checks.

- Layer 2 --- Service availability: TCP port connect via Tailscale.
  Confirms process is running and listening.

- Layer 3 --- Public endpoint: HTTPS GET to Cloudflare URL over normal
  internet (not Tailscale). Tests full chain. Any HTTP response
  including Zero Trust auth redirects (302/401) = passing. Only
  timeouts, DNS failures, 5xx = failing.

Service Port Map (incomplete --- needs verification) Machine Service
Port Amsterdam Ollama (backup) 11434 Amsterdam OpenWebUI 3000
(unconfirmed) Amsterdam Flask servers TBD Ollama Server Ollama 11434
Ollama Server ComfyUI (backup) 8188 ImageBeast ComfyUI 8188 ImageBeast
Ollama (planned) 11434 TravelBeast ComfyUI 8188 TravelBeast Ollama 11434

Cloudflare Public Endpoints (INCOMPLETE --- primary open item) Known
domains: clip.ldmathes.cc, image.ldmathes.cc, chat.ldmathes.cc,
weather.ldmathes.cc. Full mapping of domain → machine → service not yet
done. Must be completed before config schema is finalized.

TravelBeast Special Handling Frequently offline by design. Displays as
\"AWAY\" (grey/neutral) not \"OFFLINE\" (red/alarming). Needs a toggle
mechanism (manual config edit or simple admin endpoint --- not yet
decided). Must show \"last seen\" timestamp from historical data.

Data Storage

- Current state: JSON file on disk, written every poll cycle, survives
  restarts.

- History: SQLite, 7-day rolling retention.

- Both written on every poll cycle.

Polling & Timing

- Background loop every 30 seconds.

- Frontend polls Flask JSON API every 30 seconds. No WebSockets.

- Tailscale check timeout: \~500ms.

- Public endpoint timeout: \~3--5 seconds.

- Host check runs first; skip service checks if host unreachable.

Redundancy Amsterdam + one backup machine (ImageBeast or Ollama Server,
not yet chosen) both run independent full checker instances. Each
maintains its own state --- no replication. Cloudflare Load Balancer
handles automatic failover between the two origins.

Dashboard UI

- Mobile-first, iPhone 15 Pro Max primary target.

- Global health summary bar at top.

- One card per machine: name, role, overall status, service rows with
  dual indicators (Tailscale \| Public), response times, last checked.

- TravelBeast card visually distinct.

- Offline machines show \"last seen\" timestamp.

- Auto-refreshes every 30 seconds.

Tech Stack

- Backend: Python, Flask, SQLite.

- Frontend: Single HTML file, vanilla JS, mobile-responsive CSS.

- Hosting: Windows Task Scheduler on Amsterdam and backup machine.

- Public access: Cloudflare Tunnel → Zero Trust Access →
  status.ldmathes.cc.

Open Items (must resolve before coding)

1.  Complete Cloudflare domain → machine → service mapping.

2.  Confirm all service ports (especially OpenWebUI and Flask servers on
    Amsterdam).

3.  Choose backup host for redundancy (ImageBeast vs Ollama Server).

4.  Confirm Tailscale admin short names match intended names above.

5.  Decide TravelBeast \"Away\" toggle mechanism.

Next Step Continue planning: complete the Cloudflare domain inventory,
then finalize the config file schema. No code until all open items are
resolved.

APPENDIX A --- Ollama API Reference

Relevant to Layer 2/3 health checks. Rather than a plain TCP port check
on 11434, the checker can optionally hit these GET endpoints for a
richer health signal.

Useful GET endpoints (work directly in a browser or via requests
library):

- GET /api/tags --- lists all installed models. A valid JSON response
  means Ollama is fully up.

- GET /api/ps --- lists models currently loaded in VRAM. Useful for
  showing active model status.

- GET /api/version --- returns Ollama version. Lightest possible health
  check.

Base URL pattern: http://{tailscale-hostname}:11434/api/tags

POST endpoints exist for generate, chat, pull, delete, embeddings etc.
--- not relevant to health checking but available if the dashboard ever
expands to model management features.

Note: /api/tags is the recommended health check endpoint for this
project --- it confirms the process is up AND the model library is
accessible, which is more meaningful than a bare TCP connect.

APPENDIX B --- ComfyUI API Reference

Relevant to Layer 2/3 health checks for ComfyUI instances on ImageBeast,
Ollama Server (backup), and TravelBeast.

Unlike Ollama, ComfyUI\'s default page
([[http://hostname:8188]{.underline}](http://hostname:8188)) is a full
interactive GUI, not just a status message. This means a GET to the root
is itself a reasonable health signal.

Recommended health check endpoints (GET, usable in browser or requests
library):

- GET /system_stats --- returns version, system info, VRAM usage. Best
  single health check endpoint --- confirms ComfyUI is up and GPU is
  visible.

- GET /queue --- shows pending and running jobs. Useful for showing
  whether a generation is actively in progress.

- GET /history --- shows completed tasks. Less useful for health
  checking, more useful for future dashboard expansion.

Base URL pattern: http://{tailscale-hostname}:8188/system_stats

Note: ComfyUI relies heavily on WebSockets for real-time generation
updates and POST requests for workflow execution. These are not relevant
to health checking but worth knowing if the dashboard ever expands to
queue monitoring. /system_stats is the recommended health check endpoint
for this project.

TODO before next chat session:

Tailscale

- Verify short MagicDNS names for all 4 machines in the Tailscale admin
  console

- Confirm MagicDNS is enabled in Tailscale admin settings

Service Verification (per machine)

- Confirm every service actually running and its port

- Specifically: OpenWebUI port on Amsterdam (assumed 3000), all Flask
  server ports

- Note planned-but-not-running services (e.g. Ollama on ImageBeast)

Cloudflare

- Map every existing subdomain to its machine and service

- Note any subdomains planned but not yet active

Redundancy Decision

- Choose backup dashboard host: ImageBeast vs Ollama Server (Ollama
  Server recommended)

TravelBeast

- Decide \"Away\" toggle mechanism (manual config edit recommended as
  simplest)

PREVIOUS VERSION(s)

**Fleet Status Dashboard --- Planning Handoff**

**Project Summary**

A web-based status dashboard hosted on Amsterdam showing real-time
health of a 4-machine PC fleet, accessible via a Cloudflare subdomain
(e.g., status.ldmathes.cc), protected by Cloudflare Zero Trust Access.

**Host Machine**

Amsterdam (Acer Aspire TC-885) --- Windows 11, Flask app launched via
Task Scheduler.

**The Fleet**

  ------------------------------------------------------------
  **Name**      **Tailscale Short  **Role**
                Name**             
  ------------- ------------------ ---------------------------
  Amsterdam     amsterdamdesktop   Primary workstation,
                                   dashboard host

  Ollama Server ollamaserver       24/7 LLM hosting

  ImageBeast    imagebeast         Primary ComfyUI /
                                   generative AI

  TravelBeast   travelbeast        Portable/travel, frequently
                                   offline
  ------------------------------------------------------------

**Networking**

- All machines on Tailscale private mesh. Short MagicDNS hostnames used
  throughout --- no raw IPs, no full ts.net names.

- Public services exposed via Cloudflare Tunnels + Zero Trust Access.

- Dashboard served via Cloudflare Tunnel on a custom subdomain.

**Three-Layer Check Architecture**

- **Layer 1 --- Host reachability:** TCP connect to Tailscale short
  hostname. If down, all services on that machine marked unknown without
  further checks.

- **Layer 2 --- Service availability:** TCP port connect via Tailscale.
  Confirms process is running and listening.

- **Layer 3 --- Public endpoint:** HTTPS GET to Cloudflare URL over
  normal internet (not Tailscale). Tests full chain. Any HTTP response
  including Zero Trust auth redirects (302/401) = passing. Only
  timeouts, DNS failures, 5xx = failing.

**Service Port Map (incomplete --- needs verification)**

  --------------------------------------------
  **Machine**   **Service**    **Port**
  ------------- -------------- ---------------
  Amsterdam     Ollama         11434
                (backup)       

  Amsterdam     OpenWebUI      3000
                               (unconfirmed)

  Amsterdam     Flask servers  TBD

  Ollama Server Ollama         11434

  Ollama Server ComfyUI        8188
                (backup)       

  ImageBeast    ComfyUI        8188

  ImageBeast    Ollama         11434
                (planned)      

  TravelBeast   ComfyUI        8188

  TravelBeast   Ollama         11434
  --------------------------------------------

**Cloudflare Public Endpoints (INCOMPLETE --- primary open item)**

Known domains: clip.ldmathes.cc, image.ldmathes.cc, chat.ldmathes.cc,
weather.ldmathes.cc. Full mapping of domain → machine → service not yet
done. Must be completed before config schema is finalized.

**TravelBeast Special Handling**

Frequently offline by design. Displays as \"AWAY\" (grey/neutral) not
\"OFFLINE\" (red/alarming). Needs a toggle mechanism (manual config edit
or simple admin endpoint --- not yet decided). Must show \"last seen\"
timestamp from historical data.

**Data Storage**

- Current state: JSON file on disk, written every poll cycle, survives
  restarts.

- History: SQLite, 7-day rolling retention.

- Both written on every poll cycle.

**Polling & Timing**

- Background loop every 30 seconds.

- Frontend polls Flask JSON API every 30 seconds. No WebSockets.

- Tailscale check timeout: \~500ms.

- Public endpoint timeout: \~3--5 seconds.

- Host check runs first; skip service checks if host unreachable.

**Redundancy**

Amsterdam + one backup machine (ImageBeast or Ollama Server, not yet
chosen) both run independent full checker instances. Each maintains its
own state --- no replication. Cloudflare Load Balancer handles automatic
failover between the two origins.

**Dashboard UI**

- Mobile-first, iPhone 15 Pro Max primary target.

- Global health summary bar at top.

- One card per machine: name, role, overall status, service rows with
  dual indicators (Tailscale \| Public), response times, last checked.

- TravelBeast card visually distinct.

- Offline machines show \"last seen\" timestamp.

- Auto-refreshes every 30 seconds.

**Tech Stack**

- Backend: Python, Flask, SQLite.

- Frontend: Single HTML file, vanilla JS, mobile-responsive CSS.

- Hosting: Windows Task Scheduler on Amsterdam and backup machine.

- Public access: Cloudflare Tunnel → Zero Trust Access →
  status.ldmathes.cc.

**Open Items (must resolve before coding)**

1.  Complete Cloudflare domain → machine → service mapping.

2.  Confirm all service ports (especially OpenWebUI and Flask servers on
    Amsterdam).

3.  Choose backup host for redundancy (ImageBeast vs Ollama Server).

4.  Confirm Tailscale admin short names match intended names above.

5.  Decide TravelBeast \"Away\" toggle mechanism.

**Next Step**

Continue planning: complete the Cloudflare domain inventory, then
finalize the config file schema. No code until all open items are
resolved.\
\
\
TODO before pasting the above:

**Tailscale**

- Verify short MagicDNS names for all 4 machines in the Tailscale admin
  console (confirm they match amsterdamdesktop, ollamaserver,
  imagebeast, travelbeast or note what they actually are)

- Confirm MagicDNS is enabled in Tailscale admin settings

**Service Verification (per machine)**

- Confirm every service that\'s actually running right now and its port

- Specifically: OpenWebUI port on Amsterdam (assumed 3000), all Flask
  server ports on Amsterdam

- Note which services are \"planned but not yet running\" vs live (e.g.
  Ollama on ImageBeast)

**Cloudflare**

- Map every existing subdomain to its machine and service --- clip,
  image, chat, weather, and any others you have

- Note any subdomains that are planned but not yet active

**Redundancy Decision**

- Decide whether ImageBeast or Ollama Server is the backup dashboard
  host (Ollama Server is probably the better choice since ImageBeast is
  your most valuable machine and you may not always want it on)

**TravelBeast**

- Decide on the \"Away\" toggle mechanism before config design --- a
  manual edit to a config file is simplest and probably fine given how
  infrequently you travel

\--plex servers?

\--plex sync'ng

\--onedrive alive?
