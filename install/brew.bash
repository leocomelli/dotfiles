#!/usr/bin/env bash

if [[ "$(uname)" != "Darwin" ]]; then
  return
fi

if ! [ -x "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

brew upgrade
brew update

recipes=(
  ansible
  awscli
  bash
  git-extras
  git-crypt
  gnu-getopt
  gnu-sed
  gnupg
  go
  protobuf
  grpc
  hub
  hugo
  jq
  jump
  nmap
  tmux
  tmux-xpanes
  tree
  wget
  bat
  fish
  gh
  kustomize
  tflint
  vault
  neovim
  watch
  asdf
  dive
  exa
  helm
  ipcalc
  kubectx
  findutils
  tmux-mem-cpu-load
  fzf
  libpq
  ripgrep
  the_silver_searcher
  wrk
  shellcheck
)

casks=(
  alacritty
  google-cloud-sdk
  ngrok
  raycast
  rectangle
  slack
  spotify
  stats
  logseq
)

# Given strings containing space-delimited words A and B, "setdiff A B" will
# return all words in A that do not exist in B. Arrays in bash are insane
# (and not in a good way).
# From http://stackoverflow.com/a/1617303/142339
function setdiff() {
  local debug skip a b
  if [[ "$1" == 1 ]]; then debug=1; shift; fi
  if [[ "$1" ]]; then
    local setdiff_new setdiff_cur setdiff_out
    setdiff_new=($1); setdiff_cur=($2)
  fi
  setdiff_out=()
  for a in "${setdiff_new[@]}"; do
    skip=
    for b in "${setdiff_cur[@]}"; do
      [[ "$a" == "$b" ]] && skip=1 && break
    done
    [[ "$skip" ]] || setdiff_out=("${setdiff_out[@]}" "$a")
  done
  [[ "$debug" ]] && for a in setdiff_new setdiff_cur setdiff_out; do
    echo "$a ($(eval echo "\${#$a[*]}")) $(eval echo "\${$a[*]}")" 1>&2
  done
  [[ "$1" ]] && echo "${setdiff_out[@]}"
}

casks=($(setdiff "${casks[*]}" "$(brew cask list 2>/dev/null)"))
if (( ${#casks[@]} > 0)); then
  echo "Installing homebrew casks: ${casks[*]}"
  
  for cask in "${casks[@]}"; do
    brew install --cask $cask
  done
fi

recipes=($(setdiff "${recipes[*]}" "$(brew recipe list 2>/dev/null)"))
if (( ${#recipes[@]} > 0)); then
  echo "Installing homebrew recipes: ${recipes[*]}"
  
  for recipe in "${recipes[@]}"; do
    brew install $recipe
  done
fi

