function tfv
  set SELECTED (terraform workspace show)
  set FILENAME "$SELECTED.tfvars" 

  if test -e $FILENAME
    terraform $argv --var-file $FILENAME
  else
    terraform $argv
  end
end
