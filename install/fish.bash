#!/usr/bin/env bash

sudo sh -c "echo $(which fish) >> /etc/shells"

chsh -s $(which fish)
