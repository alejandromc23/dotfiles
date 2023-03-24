#!/bin/bash

echo
echo "################################################################"
echo "  Installing i3                                               "
echo "################################################################"
echo

if ! command -v i3 >/dev/null 2>&1; then
  sudo apt-get update
  sudo apt-get install i3
fi
