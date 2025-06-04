#!/bin/bash

# Start VNC server
vncserver :1 -geometry 1280x800 -depth 24

# Wait a bit to ensure VNC server is ready
sleep 2

tigervncserver -xstartup /usr/bin/lxsession

# Start noVNC
/opt/novnc/novnc/utils/launch.sh --vnc localhost:5901 --listen 6080

# Start a persistent bash session
exec /bin/bash
