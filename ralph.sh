#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <iterations>"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

for ((i=1; i<=$1; i++)); do
  echo "=== Iteration $i ==="

  # Put this before claude below to get the other account
  CLAUDE_CONFIG_DIR=~/.claude-personal claude-personal claude --dangerously-skip-permissions --permission-mode bypassPermissions -p "\
  You are in the directory: $SCRIPT_DIR \
  1. Pick one .txt file from the 'todo' folder. Move it to 'inprogress' immediately (use mv). \
  2. Read the file. It contains instructions to write a single HTML file to a specific path. Follow those instructions exactly - write the HTML file to the path specified in the task file. \
  3. After writing the HTML file, move the task file from 'inprogress' to 'done'. \
  ONLY WORK ON A SINGLE TASK. Do not modify any files other than the one HTML file you are creating. \
  If todo is empty, output COMPLETE and stop."

  # Pause between iterations to allow chance to cancel smoothly.
  echo "Pausing for 5 seconds..."
  sleep 5

  # Check if todo is empty
  if [ -z "$(ls -A todo 2>/dev/null | grep -v .DS_Store)" ]; then
    echo "All tasks complete after $i iterations."
    exit 0
  fi
done
