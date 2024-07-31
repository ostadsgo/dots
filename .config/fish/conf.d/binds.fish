# A function to open a file with Neovim
#
function fzf-open-with-nvim
  set -g red (set_color red)
  set fd_command "fd . ~ --type f --exclude .git --exclude node_modules --exclude __pycache__"

  set the_file (eval $fd_command | fzf)
  if test -n "$the_file"
    nvim $the_file
  else
    echo $red "No file has been selected."
  end
  commandline -f repaint
end

function fish_user_key_bindings
  fzf_key_bindings
  bind -M insert \cr fzf-history-widget
  bind -M insert \cf fzf-file-widget
  bind -M insert \cn fzf-cd-widget
  bind -M insert \co fzf-open-with-nvim

  # -----------------
  #   VI KEY BINDINGS
  # -----------------
  set -g fish_key_bindings fish_vi_key_bindings

  # vi remap
  bind -M insert -m default jk cancel repaint-mode

  # search history
  bind -M insert \e\k up-or-search
  bind -M insert \e\j down-or-search
  bind -M default \e\k up-or-search
  bind -M default \e\j down-or-search

  # alt + backspace
  bind -M insert \e\x7f backward-kill-word
  bind -M default \e\x7f backward-kill-word
  bind -M insert \c\x7f backward-kill-word
  bind -M default \c\x7f backward-kill-word

  # Alt + l : accept ...
  bind -M insert \e\l forward-word
  bind -M insert \e\h backward-word
  bind -M insert \e\; accept-autosuggestion
  bind -M default \e\l forward-word
  bind -M default \e\h backward-word
  bind -M default \e\; accept-autosuggestion

  # looks like no diff with up/down-or search
  bind -M insert \cj history-search-forward
  bind -M insert \ck history-search-backward

  # other applications 
  bind -M insert \cg lazygit

end
