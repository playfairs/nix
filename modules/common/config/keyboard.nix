{
  linux,
  flakeConfig,
  ...
}:
if linux then
  {
    services.xserver.xkb = {
      layout = "us,us";
      options = "grp:alt_shift_toggle,eurosign:e,caps:escape";
      variant = ",workman";
    };
  }
else
  {
    system.keyboard = with flakeConfig; {
      enableKeyMapping = true;
      swapLeftCommandAndLeftAlt = system.keyboard.normalise or false;
      swapLeftCtrlAndFn = system.keyboard.normalise or false;
      remapCapsLockToEscape = system.keyboard.remapCapsToEscape or false;
    };
  }
