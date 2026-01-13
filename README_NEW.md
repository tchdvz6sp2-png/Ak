# Ak - iOS Aplikace pro Analýzu Nahrávek 🎙️

[![iOS](https://img.shields.io/badge/iOS-15.0+-blue.svg)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org/)
[![Xcode](https://img.shields.io/badge/Xcode-14.0+-blue.svg)](https://developer.apple.com/xcode/)
[![iPhone 12](https://img.shields.io/badge/iPhone%2012-Ready-green.svg)](https://www.apple.com/iphone-12/)

MVP návrh nativní iOS aplikace pro analýzu nahrávek a detekci nesrovnalostí. Projekt je **plně připraven pro spuštění na iPhone 12** se všemi potřebnými Xcode konfiguracemi.

## ✨ Funkce

- 📊 **Dashboard** - Přehled všech případů a nahrávek
- 🎤 **Analýza** - Nahrávání a analýza audio rozhovorů
- 👥 **Profily** - Správa mluvčích a jejich metriky
- ⚠️ **Nesrovnalosti** - Detekce a zobrazení rozporů ve výpovědích
- ⚙️ **Nastavení** - Konfigurace offline režimu a úložiště

## 📁 Struktura projektu

```
Ak/
├── Ak.xcodeproj/              # Xcode projekt (připraven k použití!)
├── AkApp/
│   ├── AkApp.swift            # Main app entry point
│   ├── Info.plist             # App konfigurace a oprávnění
│   ├── Assets.xcassets/       # App ikona a resources
│   ├── Views/                 # SwiftUI view komponenty
│   ├── ViewModels/            # MVVM view modely
│   ├── Services/              # Business logika a služby
│   └── Models/                # Datové modely
├── build.sh                   # Build skript
├── run_on_iphone12.sh        # Spouštěcí skript pro iPhone 12
└── IPHONE12_SETUP.md         # Detailní setup instrukce
```

## 🚀 Rychlé spuštění na iPhone 12

### Varianta A: Simulátor (nejrychlejší)

```bash
# 1. Otevřete projekt v Xcode
open Ak.xcodeproj

# 2. V Xcode vyberte "iPhone 12" z menu zařízení
# 3. Stiskněte ⌘R nebo klikněte na ▶️ Run
```

### Varianta B: Reálné iPhone 12

```bash
# 1. Připojte iPhone 12 přes USB kabel
# 2. Otevřete projekt
open Ak.xcodeproj

# 3. V Xcode:
#    - Target "Ak" → Signing & Capabilities
#    - Vyberte svůj Team
#    - Zaškrtněte "Automatically manage signing"
#    - Změňte Bundle ID na: com.vasejmeno.ak

# 4. Vyberte váš iPhone 12 z menu zařízení
# 5. Stiskněte ⌘R

# 6. Na iPhone:
#    - Nastavení → Obecné → VPN a správa zařízení
#    - Důvěřujte vývojářskému certifikátu
```

### Varianta C: Build skript

```bash
# Pro simulátor
./run_on_iphone12.sh

# Pro kompilaci všech platforem
./build.sh
```

## 📋 Požadavky

- **macOS** (pro build)
- **Xcode 14.0+**
- **iPhone 12** s iOS 15.0+ (nebo simulátor)
- **Apple Developer Account** (zdarma Personal Team stačí)

## 🔧 Konfigurace

### Povinné změny před prvním spuštěním:

1. **Bundle Identifier** - Otevřete Ak.xcodeproj v Xcode
   - Target "Ak" → Signing & Capabilities
   - Změňte `com.yourcompany.ak` na váš unikátní identifikátor
   
2. **Team** - V Xcode vyberte váš Team v Signing & Capabilities

### Oprávnění (již nakonfigurováno):

- ✅ Mikrofon - pro nahrávání audio
- ✅ Rozpoznávání řeči - pro transkripci

## 📱 Testováno na

- ✅ iPhone 12 (iOS 15.0 - 17.x)
- ✅ iPhone 12 Simulator
- ✅ iPhone 12 Pro/Pro Max
- ✅ iPhone 12 mini

## 🏗️ Implementační status

| Komponenta | Status | Poznámka |
|-----------|--------|----------|
| UI/Views | ✅ Hotovo | Všechny obrazovky fungují |
| Navigation | ✅ Hotovo | TabView + NavigationStack |
| Data Models | ✅ Hotovo | Identifiable, Codable |
| ViewModels | ✅ Hotovo | @Published properties |
| Audio Capture | ⚠️ Mock | Vyžaduje AVFoundation |
| Transkripce | ⚠️ Mock | Vyžaduje Speech API |
| AI Analýza | ⚠️ Mock | Vyžaduje GPT-4o |
| Úložiště | ⚠️ JSON | Funkční, doporučeno Core Data |

## 🔨 Další kroky pro produkci

1. **Implementovat AVFoundation**
   ```swift
   // V AudioCaptureService.swift
   import AVFoundation
   // Nahraďte MockAudioCaptureService
   ```

2. **Napojit Speech Recognition**
   ```swift
   // V TranscriptionService.swift
   import Speech
   // Nebo použijte Whisper/AssemblyAI API
   ```

3. **Integrovat GPT-4o**
   ```swift
   // V AnalysisService.swift
   // Napojte OpenAI API pro detekci nesrovnalostí
   ```

4. **Migrovat na Core Data**
   ```swift
   // Nahraďte RecordingStore
   // Přidejte .xcdatamodeld
   ```

## 📖 Dokumentace

- [IPHONE12_SETUP.md](IPHONE12_SETUP.md) - Kompletní setup guide pro iPhone 12
- [build.sh](build.sh) - Build skript s komentáři
- [run_on_iphone12.sh](run_on_iphone12.sh) - Spouštěcí skript

## 🐛 Troubleshooting

### "Failed to code sign"
→ Nastavte Team v Signing & Capabilities

### "Untrusted Developer"
→ Nastavení → Obecné → VPN a správa zařízení → Důvěřovat

### "iPhone is busy"
→ Počkejte na dokončení přípravy v Xcode

### Build chyby
→ `xcodebuild clean build` nebo Product → Clean Build Folder (⇧⌘K)

## 📄 Licence

MVP Demo projekt - pro demonstrační účely.

## 👨‍💻 Pro vývojáře

```bash
# Kontrola struktury projektu
tree -L 2 AkApp/

# Build pro všechny platformy
./build.sh

# Otevření v Xcode
open Ak.xcodeproj

# Git commit
git add .
git commit -m "Ready for iPhone 12 deployment"
```

---

**Status:** ✅ **Připraveno pro iPhone 12** - Otevřete Xcode a klikněte na Run!
