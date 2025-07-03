#!/usr/bin/env sh

# cd /home/vlad/.local/src/sandbar
# make

FIFO="$XDG_RUNTIME_DIR/sandbar"
[ -e "$FIFO" ] && rm -f "$FIFO"
mkfifo "$FIFO"

while cat "$FIFO"; do :; done | sandbar \
	-font "Sauce Code Pro NF:19" \
	-active-fg-color "#000000" \
	-active-bg-color "#7AA0FF" \
	-inactive-fg-color "#FFFFFF" \
	-inactive-bg-color "#000000" \
	-urgent-fg-color "#000000" \
	-urgent-bg-color "#f38ba8" \
	-title-fg-color "#FFFFFF" \
	-title-bg-color "#000000" \
  -no-layout \
  -tags 5 1 2 3 4 5 \
  -no-mode \
