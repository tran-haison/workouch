#!/bin/bash

set -euo pipefail

# Resolve repo root based on this script's location
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "[1/3] Running clean build..."
cd "$ROOT_DIR"
bash ./scripts/clean_build.sh

echo "[2/3] Deploying Android (Internal Testing)..."
cd "$ROOT_DIR/android"
fastlane deploy_internal

echo "[3/3] Deploying iOS (TestFlight)..."
cd "$ROOT_DIR/ios"
fastlane deploy_testflight

echo "✅ Done."


