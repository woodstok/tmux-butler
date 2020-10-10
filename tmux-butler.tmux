#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
tmux bind-key -n M-i run-shell -b "$CURRENT_DIR/tmux-butler"
tmux bind-key -n M-p run-shell -b "$CURRENT_DIR/modes/paths"
tmux bind-key -n M-s run-shell -b "$CURRENT_DIR/modes/snippets"
