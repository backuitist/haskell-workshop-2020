#!/bin/bash

# add all-hies to 
nix-shell \
	--arg withHie true \
	--option extra-binary-caches "${S3_URL} https://all-hies.cachix.org" \
	--option trusted-public-keys "${NIX_PUBLIC_KEY} all-hies.cachix.org-1:JjrzAOEUsD9ZMt8fdFbzo3jNAyEWlPAwdVuHw4RD43k= cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="

