#!/usr/bin/env bash
# Fetch reference documents declared in references/sources.yaml.
# Saves binaries to not_in_repo/ and verifies SHA256 hashes where available.
#
# Usage: ./scripts/fetch-references.sh
#
# Requires python3 with PyYAML available (or just standard library — this script
# uses a small inline YAML parser to avoid hard dependencies).

set -euo pipefail

SOURCE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCES_FILE="$SOURCE/references/sources.yaml"
TARGET_DIR="$SOURCE/not_in_repo"

mkdir -p "$TARGET_DIR"

python3 - "$SOURCES_FILE" "$TARGET_DIR" <<'PY'
import sys, os, urllib.request, hashlib, re

sources_file, target_dir = sys.argv[1], sys.argv[2]

# Minimal YAML reader — assumes the simple structure of sources.yaml.
# Reads top-level "sources:" list of dicts. Falls back to PyYAML if available.
try:
    import yaml
    with open(sources_file) as f:
        data = yaml.safe_load(f)
except ImportError:
    print("PyYAML not available; please `pip install pyyaml` or invoke the script in an env that has it.")
    sys.exit(2)

sources = data.get("sources", [])
print(f"Loaded {len(sources)} source entries.")

for src in sources:
    sid = src.get("id", "<unknown>")
    binary_path = src.get("binary_path")
    expected_hash = src.get("sha256")
    download_urls = []
    if "download_url" in src:
        download_urls.append(src["download_url"])
    if "download_urls" in src:
        download_urls.extend(src["download_urls"])
    if "url" in src and src["url"] not in download_urls:
        download_urls.append(src["url"])

    if not binary_path or binary_path == "null":
        print(f"  [{sid}] no binary_path, skipping")
        continue

    # Resolve target path (relative to repo root)
    if binary_path.startswith("not_in_repo/"):
        local_file = os.path.join(target_dir, binary_path[len("not_in_repo/"):])
    else:
        local_file = os.path.join(target_dir, os.path.basename(binary_path))

    os.makedirs(os.path.dirname(local_file) or ".", exist_ok=True)

    # If file exists and hash matches, skip
    if os.path.exists(local_file):
        with open(local_file, "rb") as f:
            actual = hashlib.sha256(f.read()).hexdigest()
        if expected_hash and expected_hash != "null" and actual == expected_hash:
            print(f"  [{sid}] already present, hash OK ({actual[:12]}...)")
            continue
        elif expected_hash and expected_hash != "null":
            print(f"  [{sid}] hash mismatch — expected {expected_hash[:12]}... got {actual[:12]}...")
        else:
            print(f"  [{sid}] already present (no hash to verify)")
            continue

    # Try each URL until one works
    for url in download_urls:
        try:
            print(f"  [{sid}] fetching {url}")
            req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
            with urllib.request.urlopen(req, timeout=120) as resp:
                ct = resp.headers.get("Content-Type", "")
                data_bytes = resp.read()
                if "pdf" not in ct.lower() and len(data_bytes) < 1000:
                    print(f"    not a PDF or too small ({len(data_bytes)} bytes, type {ct}) — try next URL")
                    continue
                with open(local_file, "wb") as out:
                    out.write(data_bytes)
                actual = hashlib.sha256(data_bytes).hexdigest()
                if expected_hash and expected_hash != "null" and actual != expected_hash:
                    print(f"    HASH MISMATCH — expected {expected_hash} got {actual}")
                else:
                    print(f"    saved {local_file} ({len(data_bytes)} bytes, sha256 {actual[:12]}...)")
                break
        except Exception as e:
            print(f"    error: {e}")
            continue
    else:
        print(f"  [{sid}] all URLs failed")

print("Done.")
PY
