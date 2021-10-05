[
  (self: super: {
    clang = super.clang_12.overrideAttrs (oldAttrs: rec {
      meta = oldAttrs.meta // { priority = 15; };
    });
  })
]
