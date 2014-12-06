function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function _bat_charge -d "Displays the current battery levels."
  set -l script "$HOME/.oh-my-fish/themes/eris/utils.py" 2>/dev/null
  set -l color

  switch (eval $script "color")
    case white
      set outc (set_color -o white)
    case red
      set outc (set_color -o red)
    case yellow
      set outc (set_color -o yellow)
    case '*'
      set outc (set_color -o green)
  end

  set -l bat (eval $script "draw")
  echo $outc$bat
end

function _line -d "Fills the screen with a horizontal line."
  set -l script "$HOME/.oh-my-fish/themes/eris/utils.py" 2>/dev/null

  set -l stripped (echo $argv | tr -cd '[:print:]' | sed -E 's/\[[0-9]+m|\(B\[m//g')
  set -l npre (echo -n $stripped | wc -m)

  eval $script line $COLUMNS $npre
end

function eris -d "Changes prompt mode. Current modes: regular, light."
  if [ "$argv" = "light" ]
    set -U _eris light
  else if [ "$argv" = "regular" ]
    set -U _eris regular
  else
    echo "$_eris"
  end
end

function _host -d "Displays hostname and machine if on SSH."
  set -l white  (set_color white)
  set -l yellow (set_color yellow)
  set -l normal (set_color normal)

  set -l user     $white(whoami)$normal

  if test -n "$SSH_CONNECTION"
    set -l hostname $yellow(hostname)$normal
    echo "$user@$hostname"
  else
    echo "$user"
  end
end

function _job_char -d "Display the number of background and stopped jobs."
  set -l njobs (jobs | wc -l)

  if [ $njobs -ne 0 ]
    set -l jobchar (echo $njobs | sed 's/ //g')
    echo "$jobchar "
  end
end

function _arrow
  set -l red   (set_color -o red)
  set -l white (set_color -o white)
  if [ (_git_branch_name) ]
    set git_char "± "
  else if [ (eris) = regular ]
    set git_char "○ "
  end

  if test $RETVAL -ne 0
    set ret_char $red$git_char$white
  else
    set ret_char $git_char
  end

  set -l job_char (_job_char)

  echo "$ret_char$job_char\$ "
end

function _first_line -d "Displays the first line of the prompt."
  set -l normal (set_color normal)
  set -l white  (set_color white)

  if test -G .
    set fish_color_cwd green
  else
    set fish_color_cwd yellow
  end

  set -l cwd (set_color $fish_color_cwd)(prompt_pwd)$normal

  set -l host (_host)
  set -l who "$host in $cwd"

  switch (eris)
    case regular
      set -l line (_line $who)
      set -l battery (_bat_charge)
      echo "╭─$who $line$battery$white─╮"
    case light
      set -l arrow (_arrow)
      echo "$who $arrow"
  end
end

function fish_prompt
  set -g RETVAL $status
  set -l white (set_color white)

  if test -z (eris)
    eris regular
  end

  _first_line

  if [ (eris) = regular ]
    set -l arrow (_arrow)
    echo "$white╰─($arrow"
  end
end

function fish_right_prompt
  set -l magenta (set_color magenta)
  set -l white   (set_color -o white)
  set -l green   (set_color -o green)
  set -l normal  (set_color normal)

  if [ (_git_branch_name) ]
    if [ (_is_git_dirty) ]
      set dirty $green"!"$normal
    end

    set git_branch $magenta(_git_branch_name)
    set git_info '['$git_branch$dirty']'

    switch (eris)
      case regular
        echo "$white○─$git_info─╯ "
      case light
        echo $white$git_info
    end
  else
    if [ (eris) = regular ]
      echo $white "○──╯ "
    end
  end
end
