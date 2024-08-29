{ config, pkgs, ... }:

#let
#  localPkgs = import ./packages/default.nix { pkgs = pkgs; };
#in
{ imports = [
	<home-manager/nixos>
	./packages.nix
	./hardware-configuration.nix 
];

### TIMEZONE ###
time.timeZone = "Europe/Lisbon";
i18n.defaultLocale = "en_US.UTF-8";
i18n.extraLocaleSettings = { LC_ADDRESS = "pt_PT.UTF-8"; LC_IDENTIFICATION = "pt_PT.UTF-8"; LC_MEASUREMENT = "pt_PT.UTF-8"; LC_MONETARY = "pt_PT.UTF-8"; LC_NAME = "pt_PT.UTF-8"; LC_NUMERIC = "pt_PT.UTF-8"; LC_PAPER = "pt_PT.UTF-8"; LC_TELEPHONE = "pt_PT.UTF-8"; LC_TIME = "pt_PT.UTF-8";
};

### KEYMAP ###
console.keyMap = "pt-latin1";

### GRUB ###
boot.loader = {
	efi = { canTouchEfiVariables = true; };
	grub = {
		efiSupport = true;
		device = "nodev";
	};
};

### NETWORK MANAGER ###
networking = { 
	hostName = "nixos"; 
	networkmanager.enable = true;
};

### NIX ###
nix = {
	package = pkgs.nix;
	#settings.experimental-features = [ "nix-command" "flakes" ];
};

# ENABLE UNFREE PACKAGES
nixpkgs.config.allowUnfree = true;

### USER: raw ###
users.users.raw = {
	isNormalUser = true;
	extraGroups = [ "networkmanager" "wheel" "audio" ];
	packages = with pkgs; [
		yt-dlp
		mpv
		lf
		git
	];
};

home-manager.useGlobalPkgs = true;
#home-manager.users.raw = { pkgs, ... }: {
#	imports = [ ./home.nix ];
	#home = { stateVersion = "23.11"; };
#};

### XORG ###
services.xserver = {
	enable = true;
	autorun = false;
	xkb.layout = "pt";
	videoDrivers = ["nvidia"];
	displayManager.startx.enable = true;
	
	#windowManager.dwm.package = pkgs.dwm.overrideAttrs (old: {
	#	src = ./packages/dwm ;
	#	buildInputs = with pkgs; [ xorg.libX11.dev xorg.libXinerama xorg.libXft gnumake yajl ];
	#});
};

### HYPRLND ###
programs.hyprland = {
  enable = true;
  xwayland.enable = true;
};

environment.sessionVariables = {
	WLR_NO_HARDWARE_CURSORS = "1";
	NIXOS_OZONE_WL = "1";
};

### NVIDIA ###
hardware = {
	opengl.enable = true;
	nvidia = {
		modesetting.enable = true;
		powerManagement.enable = false;
		nvidiaSettings = true;
		package = config.boot.kernelPackages.nvidiaPackages.stable;
	};
};

### FONTS ###
fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  liberation_ttf
  (nerdfonts.override { fonts = [ "Mononoki" "Hack" ]; })
];

### PIPEWIRE ###
security.rtkit.enable = true;
sound.enable = false;

services.pipewire = {
	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
	jack.enable = true;
};

### PICOM ###
services.picom = {
	enable = true;
	backend = "glx";
	vSync = true;
};

### MPD ###
services.mpd = {
	enable = true;
	user = "raw";
	musicDirectory = "/home/raw/rsrc/msc";
	extraConfig = ''
	audio_output {
		type "pipewire"
		name "PipeWire Sound Server"

	}
	audio_output {
		type                    "fifo"
		name                    "FIFO"
		path                    "/tmp/mpd.fifo"
		format                  "44100:16:2"
	}
	'';
};
systemd.services.mpd.environment = { XDG_RUNTIME_DIR = "/run/user/1000"; };

### GPG and OpenSSH ###
programs.mtr.enable = true;
programs.gnupg.agent = {
	enable = true;
	enableSSHSupport = true;
};

services.openssh.enable = true;

#networking.firewall.enable = false;



  # This value determines the NixOS release from which the default settings for stateful data, like file locations and database versions on your system were taken. It‘s perfectly fine and recommended to leave this value at the # release version of the first install of this system. Before changing this value read the documentation for this option (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    # sidekick
  system.stateVersion = "24.05"; # Did you read the comment?
}
