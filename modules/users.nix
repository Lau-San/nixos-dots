{ config, pkgs, ... }:
{
	
	# User
	users.users.laura = {
	  isNormalUser = true;
	  description = "laura";
	  extraGroups = [ "networkmanager" "wheel" ];
	  shell = pkgs.fish;
	};
}
