{ config, lib, pkgs, ... }:

{
  programs.bash.initExtra = ''
    if command -v tmux &> /dev/null; then
       if [ -z "$TMUX" ]; then
            tmux attach -t main || tmux new -s main
          fi
          fi
              '';
}
