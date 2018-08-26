#!/bin/bash

sudo apt-get update -qq

# Build Deps
sudo apt-get install -qq libgtk-3-0 libgtk-3-dev

# Utils
sudo apt-get install -qq clang-format-3.8