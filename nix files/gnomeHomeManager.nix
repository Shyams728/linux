# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # To clean up old generationions showing up
  #boot.cleanTmpDir = true;
  
  # Enable Home Manager
  # nix.package = pkgs.nixFlakes;
  # home.packages = [ pkgs.home-manager ];
  #home.homeManager.enable = true;


  # Enable the Deepin Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.gdm.enable = false;
  #services.xserver.desktopManager.deepin.enable = false;  # Disable Deepin
  services.xserver.desktopManager.gnome.enable = true;   # Enable Gnome

  # Configure keymap in X11
  #services.xserver.keyboardLayout = "us";
  
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

 

  # Enable CUPS to print documents.
  services.printing.enable = true;
  
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.shyamsundar = {
    isNormalUser = true;
    description = "shyamsundar";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      vscode
      python311
      python311Packages.pip
      python311Packages.autopep8
      git
      vlc
      zoom-us
      zip
      microsoft-edge
      gh
      google-chrome
    ];
  };
  

  		

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "shyamsundar";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services.flatpak.enable =true;

  # SQL services
  #services.postgresql.enable = true;
  #services.postgresql.package = pkgs.postgresql_15;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    lf
    oh-my-zsh
    gnome.gnome-tweaks
    gnome.gnome-themes-extra
    gnome.gnome-bluetooth
    gnome.adwaita-icon-theme
    gnomeExtensions.dashbar
    gnomeExtensions.space-bar
    gnomeExtensions.dash-to-dock
    gnomeExtensions.dash-to-panel
    gnomeExtensions.compact-top-bar 
    gnomeExtensions.blur-my-shell
    gnomeExtensions.window-title-is-back
    gnomeExtensions.vitals
    gnomeExtensions.vertical-workspaces
    gnomeExtensions.transparent-top-bar-adjustable-transparency

  ];

  
    programs.zsh.ohMyZsh = {
      enable = true;
      plugins = [ "git" "python" "man" ];
      theme = "agnoster";
    };
  

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?


  home-manager.users.shyamsundar = { pkgs, ... }:{
    home.stateVersion = "23.11";
    home.packages = with pkgs;[
      htop
    ];
  };









}
