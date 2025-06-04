# 🐳 ROS2env_with_GUI: ROS2 + Gazebo + GUI in Browser via noVNC

A ready-to-run Docker image for working with **ROS2 Humble**, **Gazebo**, and GUI-based tools like **RViz** — all accessible remotely via your **web browser** using **TurboVNC + noVNC + VirtualGL**.

No setup required on host — just pull the image and you're good to go.

---

## 🚀 Features

- ✅ ROS2 Humble (Ubuntu 22.04)
- ✅ GUI access in browser via noVNC
- ✅ Lightweight XFCE desktop environment
- ✅ TurboVNC + VirtualGL for GPU-accelerated apps (e.g. `vglrun gazebo`)
- ✅ Dockerfile included for customization

---

## 🐳 Option 1 :  Quick Start (via Docker Hub)

1. Pul the docker Image:
`docker pull shubham4413/ros2-vnc:latest`

2.  Run the conatiner:
`docker run -it -p 6080:6080 -p 5901:5901 --gpus all ros2-vnc`

3. Open the browser with this link: http://localhost:6080/vnc.html

4. Connect to NoVNC with password: `rosubuntu`

5. Start RViz or Gazebo inside: (bash)
  ```
  vglrun gazebo
  vglrun rviz2
  ```
## 🐳 Option 2 : Build your custom Docker Image 

I have included the source Dockerfile in this repository. You can clone this repo and make changes in it for example if you want to change the base image from humble to jazzy or kilted.

1. Go to the root of Dockerfile and build the image:
   `docker build -t your-custom-name .`
2.  Run the conatiner:
`docker run -it -p 6080:6080 -p 5901:5901 --gpus all ros2-vnc`

3. Open the browser with this link: http://localhost:6080/vnc.html

4. Connect to NoVNC with password: `rosubuntu`

5. Start RViz or Gazebo inside: (bash)
  ```
  vglrun gazebo
  vglrun rviz2
  ```
