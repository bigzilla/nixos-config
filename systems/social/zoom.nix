{ config, pkgs, ... }:

{
	environment.systemPackages = [ pkgs.zoom-us ];
}
