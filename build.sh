#!/bin/bash
# build.sh — Inject JSON data into index.html
# Run this after editing any file in data/
#
# Usage: ./build.sh
# Output: index.html (updated BENEFITS array)

set -e

FEDERAL="data/federal.json"
BC="data/provinces/BC.json"
HTML="index.html"

if [ ! -f "$HTML" ]; then
  echo "❌ index.html not found. Place it in the repo root first."
  exit 1
fi

echo "🍁 maple-benefits build script"
echo "  Validating JSON..."

# Validate JSON syntax
python3 -c "import json; json.load(open('$FEDERAL'))" && echo "  ✅ federal.json valid"
python3 -c "import json; json.load(open('$BC'))" && echo "  ✅ BC.json valid"

echo ""
echo "  ℹ️  Data JSON files validated."
echo "  To update index.html with new data, edit the BENEFITS array directly in index.html"
echo "  (Full build injection not yet implemented — see docs/add-province.md)"
echo ""
echo "  Current data files:"
echo "    federal.json  — $(python3 -c "import json; d=json.load(open('$FEDERAL')); print(len(d['benefits']), 'federal benefits')")"
echo "    BC.json       — $(python3 -c "import json; d=json.load(open('$BC')); print(len(d['benefits']), 'BC benefits')")"
echo ""
echo "✅ Done."
