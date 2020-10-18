#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
tmux bind-key -n M-i run-shell -b "$CURRENT_DIR/modes/quetty-filter -start word"
tmux bind-key -n M-p run-shell -b "$CURRENT_DIR/modes/quetty-filter -start path"
tmux bind-key -n M-s run-shell -b "$CURRENT_DIR/modes/snippets"
