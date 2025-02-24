# A function to open a file with Neovim
#
function fzf-open
  set fd_command 'fd  \
                   --exclude .git \
                   --exclude node_modules \
                   --exclude __pycache__ \
                   --exclude "*.pyc" \
                   --exclude .dotnet \
                   --exclude .cache \
                   --exclude .venv \
                   --exclude .cargo \ 
                   '


  set the_file (eval $fd_command | fzf)
  if test -n "$the_file"
    nvim $the_file
  end
  commandline -f repaint
end


function fzf-open-from-home
  set fd_command 'fd . ~ \
                  --hidden \
                  --type f  \
                  --exclude .git  \
                  --exclude node_modules \
                  --exclude __pycache__ \
                  --exclude .cargo \
                  --exclude .npm \
                  --exclude .dotnet \
                  --exclude .cache \
                  '


  set the_file (eval $fd_command | fzf)
  if test -n "$the_file"
    nvim $the_file
  end
  commandline -f repaint
end

function fzf-cd-from-home
  set fd_command "fd . ~ --hidden --type d --exclude .git --exclude node_modules --exclude __pycache__"

  set the_file (eval $fd_command | fzf)
  if test -n "$the_file"
    cd $the_file
  end
  commandline -f repaint
end

function tmux-kill-session
  tmux kill-session -t $(tmux ls | awk -F ':' '{print $1}' | fzf)
end

function fish_user_key_bindings
  fzf_key_bindings
  bind -M insert \cr fzf-history-widget
  bind -M insert \cf fzf-file-widget
  bind -M insert \co fzf-open-from-home
  bind -M insert \cn fzf-cd-from-home
  bind -M insert \e\o fzf-open

  bind -M default \cr fzf-history-widget
  bind -M default \cf fzf-file-widget
  bind -M default \co fzf-open-from-home
  bind -M default \cn fzf-cd-from-home
  bind -M default \e\o fzf-open

  # --------------
  # TMUX
  # --------------


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

  # other applications 
  bind -M insert \cg lazygit

end
