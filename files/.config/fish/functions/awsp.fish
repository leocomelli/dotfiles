function awsp
  set SELECTED (aws configure list-profiles | fzf)
  set -gx AWS_PROFILE $SELECTED
end

