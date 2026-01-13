#!/bin/bash

# Build skript pro Ak aplikaci
# Kompiluje projekt pro iPhone simulátor a reálné zařízení

set -e

PROJECT_NAME="Ak"
SCHEME="Ak"
CONFIGURATION="Debug"

echo "🔨 Kompilace projektu ${PROJECT_NAME}..."

# Pro simulátor (x86_64/arm64)
echo "📱 Build pro iOS simulátor..."
xcodebuild \
    -project "${PROJECT_NAME}.xcodeproj" \
    -scheme "${SCHEME}" \
    -configuration "${CONFIGURATION}" \
    -sdk iphonesimulator \
    -destination 'platform=iOS Simulator,name=iPhone 12,OS=latest' \
    clean build

# Pro reálné zařízení (arm64)
echo "📱 Build pro iPhone zařízení..."
xcodebuild \
    -project "${PROJECT_NAME}.xcodeproj" \
    -scheme "${SCHEME}" \
    -configuration "${CONFIGURATION}" \
    -sdk iphoneos \
    -destination 'generic/platform=iOS' \
    clean build

echo "✅ Build dokončen úspěšně!"
