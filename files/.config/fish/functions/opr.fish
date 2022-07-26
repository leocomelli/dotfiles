function opr
  set CURRENT_BRANCH (git branch --show-current)
  git push origin $CURRENT_BRANCH
  gh pr create --web --fill
end
