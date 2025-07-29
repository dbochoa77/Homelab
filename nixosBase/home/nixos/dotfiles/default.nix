{ inputs, ... }:

{
home.file.".config/nvim" = { 
    source = "${inputs.nvimDotfiles}/nvim";
    recursive = true;
  };
}
