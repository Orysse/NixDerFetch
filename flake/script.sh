#!/bin/sh

nix profile install nixpkgs#home-manager
rm /home/abel.chartier/.local/state/nix/profiles/home-manager*
rm /home/abel.chartier/.local/state/home-manager/gcroots/current-home
home-manager switch --flake ~/afs/flake
