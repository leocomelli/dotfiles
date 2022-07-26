#!/usr/bin/env bash

source ./install/macos.bash
source ./install/brew.bash
source ./install/fish.bash

fish -c "source ./install/sync.fish"
fish -c "source ./install/nvim.fish"
fish -c "source ./install/tmux.fish"
