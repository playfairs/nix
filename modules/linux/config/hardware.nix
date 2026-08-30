{
  lib,
  pkgs,
  linux,
  config,
  flakeConfig,
  ...
}:
lib.optionalAttrs linux {
  # Base hardware configuration - graphics is optional based on platform
  hardware = with flakeConfig; lib.mkMerge [
    # Common settings
    {
      amdgpu.opencl.enable = lib.mkForce (builtins.elem "amdgpu" (system.graphics.wanted or [ ]));
      bluetooth = {
        enable = true;
        powerOnBoot = true;
      };
      
      # NVIDIA configuration
      nvidia = {
        open = false;
        modesetting.enable = true;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
      }
      // (lib.optionalAttrs (system.graphics ? nvidia) {
        prime = {
          sync.enable = system.graphics.nvidia.prime.sync.enable or true;
          intelBusId = system.graphics.nvidia.prime.intelBusId or "";
          nvidiaBusId = system.graphics.nvidia.prime.nvidiaBusId or "";
          amdgpuBusId = system.graphics.nvidia.prime.amdgpuBusId or "";
        };
      });
    }
    
    # Graphics config - with enable32Bit only on x86_64
    {
      graphics.enable = true;
    }
    
    # x86_64 specific: enable 32-bit support
    (lib.mkIf pkgs.stdenv.hostPlatform.isx86_64 {
      graphics.enable32Bit = lib.mkForce (system.graphics.enable32Bit or false);
    })
  ];
}
