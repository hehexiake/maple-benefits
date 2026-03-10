#!/bin/bash
# build.sh — Inject JSON data into index.html BENEFITS array
# Run this after editing any file in data/
#
# Usage:
#   ./build.sh            — inject JSON into index.html
#   ./build.sh --dry-run  — preview only, no file write
#   ./build.sh --check    — verify index.html matches JSON (exit 1 if drift)

set -e

FEDERAL="data/federal.json"
BC="data/provinces/BC.json"
HTML="index.html"
export BUILD_MODE="build"   # build | dry-run | check
[[ "$1" == "--dry-run" ]] && BUILD_MODE="dry-run"
[[ "$1" == "--check"   ]] && BUILD_MODE="check"

echo "🍁 maple-benefits build (mode: $BUILD_MODE)"
echo ""

# ── Preflight ─────────────────────────────────────────────────────────────────
[ ! -f "$HTML"    ] && echo "❌ index.html not found" && exit 1
[ ! -f "$FEDERAL" ] && echo "❌ data/federal.json not found" && exit 1
[ ! -f "$BC"      ] && echo "❌ data/provinces/BC.json not found" && exit 1

echo "  Validating JSON..."
python3 -c "import json; json.load(open('$FEDERAL'))" && echo "  ✅ federal.json valid"
python3 -c "import json; json.load(open('$BC'))"      && echo "  ✅ BC.json valid"
echo ""

# ── Generate + inject ─────────────────────────────────────────────────────────
python3 << 'PYEOF'
import json, re, sys, os, shutil

REQUIRED = ['id','name','en','cat','scope','dataAsOf','max','url',
            'desc','desc_en','conditions','conditions_en']

def js_str(s):
    return "'" + str(s).replace("\\", "\\\\").replace("'", "\\'") + "'"

def js_str_array(arr):
    return "[" + ",".join(js_str(x) for x in arr) + "]"

federal = json.load(open('data/federal.json'))
bc      = json.load(open('data/provinces/BC.json'))
all_benefits = federal['benefits'] + bc['benefits']

# Validate required fields
errors = []
for b in all_benefits:
    for f in REQUIRED:
        if f not in b:
            errors.append(f"  {b['id']}: missing '{f}'")
if errors:
    print("❌ Missing required fields:\n" + "\n".join(errors))
    sys.exit(1)

# Build new BENEFITS block
lines = []
for b in all_benefits:
    parts = [
        f"id:{js_str(b['id'])}",
        f"name:{js_str(b['name'])}",
        f"en:{js_str(b['en'])}",
        f"cat:{js_str(b['cat'])}",
        f"scope:{js_str(b['scope'])}",
        f"dataAsOf:{js_str(b['dataAsOf'])}",
        f"max:{js_str(b['max'])}",
        f"url:{js_str(b['url'])}",
        f"desc:{js_str(b['desc'])}",
        f"desc_en:{js_str(b['desc_en'])}",
        f"conditions:{js_str_array(b['conditions'])}",
        f"conditions_en:{js_str_array(b['conditions_en'])}",
    ]
    lines.append("{" + ",".join(parts) + "}")

new_block = "const BENEFITS=[\n" + ",\n".join(lines) + "\n];"

html = open('index.html', encoding='utf-8').read()
pattern = r'const BENEFITS=\[.*?\];'
if not re.search(pattern, html, re.DOTALL):
    print("❌ Cannot find BENEFITS array in index.html")
    sys.exit(1)

new_html = re.sub(pattern, new_block, html, flags=re.DOTALL)

mode = os.environ.get('BUILD_MODE', 'build')
n_fed = len([b for b in all_benefits if b['scope'] == 'federal'])
n_prov = len([b for b in all_benefits if b['scope'] == 'provincial'])

if mode == 'dry-run':
    print(f"  [dry-run] Would inject {len(all_benefits)} benefits ({n_fed} federal + {n_prov} provincial)")
    print(f"  [dry-run] BENEFITS block size: {len(new_block):,} chars")
    print(f"  [dry-run] index.html unchanged")

elif mode == 'check':
    current_block = re.search(pattern, html, re.DOTALL).group(0)
    if current_block.strip() == new_block.strip():
        print(f"  ✅ index.html is in sync with JSON ({len(all_benefits)} benefits)")
    else:
        print("  ❌ DRIFT DETECTED — index.html BENEFITS differs from JSON")
        print("     Run ./build.sh to resync")
        sys.exit(1)

else:  # build
    shutil.copy('index.html', 'index.html.bak')
    open('index.html', 'w', encoding='utf-8').write(new_html)
    print(f"  ✅ Injected {len(all_benefits)} benefits ({n_fed} federal + {n_prov} provincial)")
    print(f"  ✅ index.html.bak saved")
PYEOF

STATUS=$?
[ $STATUS -ne 0 ] && echo "❌ Build failed (exit $STATUS)" && exit $STATUS

if   [[ "$BUILD_MODE" == "dry-run" ]]; then echo ""
     echo "✅ Dry run complete — index.html not modified"
elif [[ "$BUILD_MODE" == "check"   ]]; then echo ""
     echo "✅ Check complete"
else echo ""
     echo "✅ Build complete — index.html updated from JSON"
     echo "   Next: git diff index.html  to review, then commit"
fi
