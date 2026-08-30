{
  programs.micro = {
    enable = true;

    settings = {
      autoindent = true;
      autosave = 0;
      autosu = false;

      backup = true;
      basename = false;

      clipboard = "external";

      colorcolumn = 0;
      colorscheme = "default";
      cursorline = true;

      diffgutter = true;

      eofnewline = false;
      fastdirty = true;

      hlsearch = true;
      ignorecase = true;
      incsearch = true;

      keepautoindent = true;
      matchbrace = true;

      mkparents = true;
      mouse = false;

      reload = "prompt";

      ruler = true;
      savecursor = true;
      savehistory = true;
      saveundo = true;

      scrollbar = true;

      smartpaste = true;
      softwrap = false;

      statusline = true;
      statusformatl = "$(filename) $(modified) ($(line),$(col))";
      statusformatr = "$(opt:filetype)";

      syntax = true;

      tabmovement = false;
      tabsize = 4;
      tabstospaces = true;

      truecolor = "auto";
      useprimary = true;
      wordwrap = false;
    };
  };
}
