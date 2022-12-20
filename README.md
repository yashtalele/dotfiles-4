# Dotfiles
- A collection of my configuration files for Arch Linux.
- My main setup is [Arch Linux](https://wiki.archlinux.org/title/Arch_Linux) running on AMD Ryzen 7 5700U (16-core)
- I primarily use [Hyprland Wayland](https://github.com/hyprwm/Hyprland) as my [Window Manager](https://wiki.archlinux.org/title/window_manager)
<br></br>
![Hyprland](assets/hyprland.png "hyprland")
<br></br>
![Hyprland-1](assets/hyprland1.png "hyprland")
<br></br>
## 📦 setup
### 💾 Installation:
This setup instructions only provided for Arch Linux (and other Arch-based distributions) 
<br></br>
<b>1. We need to deploy yay and git:</b>

```sh
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git /tmp/yay && \
cd yay && makepkg -si
```

<b>2. Install Window Manager Waybar and Hyprland Wayland:</b>

```sh
yay -S hyprland-git waybar-hyprland-git 
```
