#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <path/to/file.erl>"
  exit 1
fi

INPUT="$1"
FILEPATH="${INPUT%/}"
FILENAME="${FILEPATH##*/}"

echo "Path: $PATH"
echo "Filepath: $FILEPATH"
echo "Filename: $FILENAME"

echo "Running: 'infer --debug -- erlc $FILEPATH'"
./.local/bin/infer --debug -- erlc "$FILEPATH"

echo "Opening results in Firefox..."
firefox infer-out/captured/$FILENAME.*.html
