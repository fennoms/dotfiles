#!/bin/bash

FILENAME="screenshot-$(date +%Y-%m-%d-%H-%M-%S).png"
FILEPATH="$HOME/Pictures/screenshots/$FILENAME"

mkdir -p "$HOME/Pictures/screenshots"

scrot -s "$FILEPATH"
