function tfws
  set SELECTED (terraform workspace list | fzf)
  set SELECTED (string sub --start=3 $SELECTED)
  
  echo $SELECTED

  if ! test -n "$SELECTED"
    echo "you must choose a workspace"
    return
  end
  
  terraform workspace select $SELECTED
end
