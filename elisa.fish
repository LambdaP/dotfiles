function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function _bat_charge
  set -l home (echo $HOME)
  set -l fill "$home/bin/batcharge_fish.py" 2>/dev/null
  set -l color_script "$home/bin/batval.py" 2>/dev/null

  if eval $color_script 4
    set outc (set_color -o red)
  else if eval $color_script 6
    set outc (set_color -o yellow)
  else
    set outc (set_color -o green)
  end
  set -l bat (eval $fill)
  echo $outc$bat
end

function _host
  set -l white    (set_color -o white)
  set -l yellow   (set_color -o yellow)
  set -l normal   (set_color -o normal)
  set -l user (whoami)
  set -l hostname (hostname)
  if test -n "$SSH_CONNECTION"
    echo "$white$user$normal@$yellow$hostname$normal"
  else
    echo "$white$user$normal"
  end
end

function fish_prompt
  set -l white   (set_color -o white)
  set -l gray    (set_color -o black)
  set -l green   (set_color -o green)
  set -l red     (set_color -o red)
  set -l yellow  (set_color -o yellow)
  set -l normal   (set_color -o normal)

  set -l cwd (set_color $fish_color_cwd)(prompt_pwd)$normal
  set -l battery (_bat_charge)

  set -l host (_host)
  set -l pre (echo "╭─$host in $cwd")

  set -l home (echo $HOME)
  set -l script "$home/bin/line.py" 2>/dev/null

  set -l npre (echo "$host in $cwd" | tr -cd '[:print:]' | sed -E 's/\[[0-9]+m|\(B\[m//g' | wc -m)
  set -l col (echo $COLUMNS)
  set -l line (eval $script $col $npre)

  set -l first_line (echo "$pre $line$battery")

  if [ (_git_branch_name) ]
    set git_char '±'
  else
    set git_char '○'
  end

  set fish_greeting (command ddate)

  echo $first_line
  echo "$white╰─($git_char \$ "
end

function fish_right_prompt
  set -l magenta (set_color -o magenta)
  set -l white   (set_color -o white)
  set -l green   (set_color -o green)
  if [ (_git_branch_name) ]
    if [ (_is_git_dirty) ]
      set dirty $green"!"
    end
    set git_branch $magenta(_git_branch_name)
  echo $white '['$git_branch$dirty$white"] "
  end
end
