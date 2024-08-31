{ pkgs, config, lib, ... }:

let
devPackages = with pkgs; [
	home-manager
	# Dev
	git
	vim
	neovim
	ripgrep
	fzf
	gcc
	gnumake
	nixd
	lua-language-server
	nodePackages.typescript
	nodePackages.typescript-language-server
	lua5_1
	lua51Packages.luarocks
	lua51Packages.lua-curl
];

utils = with pkgs; [
	zip
	unzip
	curl
	wget
	file
	bat
	mediainfo
	poppler_utils
	xclip
	killall
	brightnessctl
	wmctrl

	keepassxc

	# Audio
	alsa-utils
	audacity
	pavucontrol

	# Virtualization
	virt-manager
	virt-viewer

];

apps = with pkgs; [
	# Browser
	brave
	librewolf

	# Media
	sxiv
	yt-dlp
	mpv
	imagemagick
	ffmpeg-full
	zathura
	lf

	# WM, Terminal, Menus, etc.
	dwm
	dwmblocks
	dmenu
	st
	alacritty
	waybar
	sxhkd
	dunst
	nitrogen
	feh
	libnotify
	];

	in
{
	# Packages
	environment.systemPackages = devPackages ++ apps ++ utils;

	# Overlays
	nixpkgs.overlays = [
	(final: prev: {
		 dwm = prev.dwm.overrideAttrs (old: {
			src = ./packages/dwm ;
			buildInputs = old.buildInputs ++ [ pkgs.yajl ];
		});

		 st = prev.st.overrideAttrs (old: {
			 src = ./packages/st ;
			 buildInputs = old.buildInputs ++ [ pkgs.pkg-config ];
		 });

		 dwmblocks = prev.dwmblocks.overrideAttrs (old: {
			 src = ./packages/dwmblocks ;
			 buildInputs = old.buildInputs ++ [ pkgs.pkg-config pkgs.xorg.libxcb ];
		 });
	}) ];


	programs.steam.enable = true;
	hardware.steam-hardware.enable = true;
	programs.gamemode.enable = true;

}
