import (builtins.fetchTarball {    
    name = "nixos-unstable-2019-10-26";    
    url = https://releases.nixos.org/nixos/19.09/nixos-19.09.2070.b9cb3b2fb2f/nixexprs.tar.xz;
    # Hash obtained using `nix-prefetch-url --unpack <url>`
    sha256 = "1i2q29wfcrdk62a6vr1g7b8bw4clb8lgq4cwwar67f775ffjlp9z";
}){
    # config.allowBroken = true; # to experiment with packages marked as broken!
  }
