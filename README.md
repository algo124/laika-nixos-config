# NixOS Configuration for Laika

My personal NixOS configuration and dotfiles for my laptop named Laika. It uses Hyprland + Noctalia with a focus on general purpose laptop usage: office tasks, browsing, chatting, and programming. It also makes use of flakes as well as Home Manager and Hjem.

flake.nix calls
- config.nix
- hardware-config.nix
- home.nix (for Home Manager)
- hjem.nix (for Hjem)
- noctalia.nix

home.nix calls
- dots/alacritty.nix
- dots/cliphist.nix
- dots/fish.nix
- dots/git.nix
- dots/gtk.nix
- dots/librewolf.nix
- dots/mpd.nix
- dots/mpdscribble.nix

hjem.nix calls
- dots/fastfetch.jsonc
- dots/hyprland.lua
- dots/hyprpaper.conf
- dots/element.json

# Extra Things Necessary to Configure
- Syncthing folders
- Thunar connect to terminal command
 - Edit -> Configure custom actions -> Open Terminal Here -> change command to `alacritty`
- College wifi (download shell script to connect)
- Plugin installers for music production
- Catppuccin-GTK-Theme install
