{ config, pkgs, epkgs, lib, ... }:

{
imports = [
	<home-manager/nixos>
	./packages.nix
	#./modules/git.home.nix
	#./modules/music.home.nix
];

home.packages = with pkgs; [
	htop
];

programs.obs-studio = {
 	enable = true;
 	plugins = [ pkgs.obs-studio-plugins.obs-pipewire-audio-capture ];
 };
 
 services.syncthing = {
 	enable = true;
 	tray = false;
 };
 
 services.unclutter = {
 	enable = true;
 	timeout = 5;
 };
 
 services.gpg-agent = {
 	enable = true;
 };

home.file = {
	".config/nvim".source = ./config/nvim;
".config/zsh".source = ./config/zsh;
".config/dunst".source = ./config/dunst;
".config/lf".source = ./config/lf;
".config/hyprland".source = ./config/hyprland;
".config/waybar".source = ./config/waybar;
};

