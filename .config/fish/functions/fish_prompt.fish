# disable poetry prompt to appear
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
# Left prompt
function fish_prompt
  set -l last_status $status
  set -g cyan (set_color -o cyan)
  set -g red (set_color -o red)
  set -g blue (set_color -o blue)
  set -g green (set_color -o green)
  set -g yellow (set_color -o yellow)
  set -g normal (set_color normal)

  set -l indicator '󰔶'
  set -l normal_indicator '󰔶'
  set -g section '|'
  set -g whitespace ' '

  # make incdictor red if command wasn't run successfuly.
  if test $last_status = 0
    set status_indicator "$green$indicator"
  else
    set status_indicator "$red$indicator"
  end

  # vim noraml indicator color
  if  test $fish_bind_mode = default  
      set status_indicator "$yellow$normal_indicator"
  end
  echo -n -s $status_indicator $whitespace
end


function fish_right_prompt
  # local variables
  set -l cwd $blue(basename (prompt_pwd))
  set -l prompt
  set -l git_info ""
  set -l git_branch_name (_git_branch_name) 
  set -l ahead (_git_ahead)
  set -l is_git_dirty (_is_git_dirty)
  set -l cmd_dur (_cmd_duration)

  # if branch is `master` or `main` make it red
  if [ $git_branch_name ]
    if test $git_branch_name = 'master' || test $git_branch_name = 'main'
      set git_info "$normal$section$red$git_branch_name$normal"
    else
      set git_info "$normal$section$blue$git_branch_name$normal"
    end

    # if their is somthing to commit
    if [ is_git_dirty ]
      set git_info "$git_info$red x"
    end
  end


  set -l env ""
  # if an env activated
  if test "$VIRTUAL_ENV_PROMPT"
    set -x VIRTUAL_ENV_DISABLE_PROMPT 0
    set env $normal \($VIRTUAL_ENV_PROMPT\) $normal$section 
  end
    echo -n -s $env $cwd $git_info $whitespace $ahead $cmd_dur
end


function _cmd_duration
  if [ "$CMD_DURATION" -gt 5000 ]
    set -l seconds (math floor "$CMD_DURATION/1000") 
    set -l minutes (math $seconds / 60)
    set -l rem_second (math $seconds % 60)
    if [ $seconds -lt 60 ]
      echo "$yellow$seconds""s"$normal
    else
      echo $yellow(math floor  $minutes)"m "$rem_second"s"$normal
    end
  end
end

function _git_ahead
  set -l commits (command git rev-list --left-right '@{upstream}...HEAD' 2>/dev/null)
  if [ $status != 0 ]
    return
  end
  set -l behind (count (for arg in $commits; echo $arg; end | grep '^<'))
  set -l ahead  (count (for arg in $commits; echo $arg; end | grep -v '^<'))
  switch "$ahead $behind"
    case ''     # no upstream
    case '0 0'  # equal to upstream
      return
    case '* 0'  # ahead of upstream
      echo "$blue↑$normal_c$ahead$whitespace"
    case '0 *'  # behind upstream
      echo "$red↓$normal_c$behind$whitespace"
    case '*'    # diverged from upstream
      echo "$blue↑$normal$ahead $red↓$normal_c$behind$whitespace"
  end
end

function _git_branch_name
  echo (command git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2>/dev/null)
end


