FROM ros:humble

ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    lxde-core lxterminal tightvncserver \
    tigervnc-standalone-server \
    tigervnc-common \
    x11-xserver-utils \
    net-tools curl wget git nano sudo \
    mesa-utils \
    xfce4 \
    xterm \
    firefox \
    novnc websockify \
    ros-humble-desktop-full && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget https://sourceforge.net/projects/virtualgl/files/2.6.5/virtualgl_2.6.5_amd64.deb/download -O /tmp/virtualgl.deb && \
    apt-get update && \
    apt-get install -y /tmp/virtualgl.deb && \
    rm /tmp/virtualgl.deb

# Setup noVNC and Websockify
RUN mkdir -p /opt/novnc/utils/websockify && \
    ln -s /usr/share/novnc /opt/novnc && \
    ln -s /usr/share/novnc/utils/websockify /opt/novnc/utils/websockify

# Create user
RUN useradd -m -s /bin/bash rosuser && \
    echo "rosuser:ros" | chpasswd && \
    adduser rosuser sudo

USER rosuser
WORKDIR /home/rosuser

# Create VNC password file (optional)
RUN mkdir ~/.vnc && \
    echo "rosubuntu" | vncpasswd -f > ~/.vnc/passwd && \
    chmod 600 ~/.vnc/passwd

COPY --chown=rosuser:rosuser startup.sh /home/rosuser/startup.sh
RUN chmod +x /home/rosuser/startup.sh

EXPOSE 5901 6080

CMD ["/home/rosuser/startup.sh"]
