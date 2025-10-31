#!/bin/bash

# Clean Flutter project
flutter clean

# Clean pub cache
yes | flutter pub cache clean

# Clean iOS build
cd ios
rm -rf Podfile.lock
rm -rf Pods

# Get pub packages
flutter pub get

# Reinstall pods
pod deintegrate
pod install --repo-update

cd ../

# Run build_runner
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs 