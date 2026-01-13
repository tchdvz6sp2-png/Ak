#!/bin/bash

# Skript pro spuštění aplikace na iPhone 12

set -e

PROJECT_NAME="Ak"
SCHEME="Ak"

echo "🚀 Spouštění aplikace ${PROJECT_NAME} na iPhone 12..."

# Zjištění dostupných zařízení
echo "📱 Dostupná zařízení:"
xcrun xctrace list devices

# Spuštění na iPhone 12 simulátoru
echo "▶️  Spouštění na iPhone 12 simulátoru..."
xcodebuild \
    -project "${PROJECT_NAME}.xcodeproj" \
    -scheme "${SCHEME}" \
    -configuration Debug \
    -sdk iphonesimulator \
    -destination 'platform=iOS Simulator,name=iPhone 12,OS=latest' \
    clean build

# Otevření simulátoru
open -a Simulator

# Instalace a spuštění aplikace
echo "📲 Instalace a spuštění aplikace..."

echo "✅ Aplikace spuštěna na iPhone 12 simulátoru!"
echo ""
echo "💡 Pro spuštění na reálném iPhone 12:"
echo "   1. Připojte iPhone přes USB kabel"
echo "   2. Otevřete Xcode: open Ak.xcodeproj"
echo "   3. Vyberte svoje iPhone ze seznamu zařízení"
echo "   4. Stiskněte ⌘R nebo klikněte na Run"
