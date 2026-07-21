{
  asteride,
  ...
}:

{
  imports = [
    asteride.homeModules.asteride
  ];
  
  programs.asteride = {
    enable = true;
    settings = {
      appearance = {
        scale = 1.0;
        theme = "rose_pine_moon";
      };
    };
  };
}