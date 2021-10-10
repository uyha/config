[
  (self: super: {
    clang = super.lib.setPrio 15 super.clang_12;
    gcc = super.gcc10;
    python = super.python39;
    neovim = super.neovim.overrideAttrs (oldAttrs: rec {
      version = "0.5.1";
    });
  })
]
