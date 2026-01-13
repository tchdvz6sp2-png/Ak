# Ak - iOS Aplikace pro Analýzu Nahrávek

## Požadavky pro iPhone 12

### Systémové požadavky:
- **iPhone 12** s iOS 15.0 nebo novějším
- **macOS** s Xcode 14.0+ (pro build)
- **Apple Developer Account** (pro instalaci na reálné zařízení)

### Minimální verze iOS:
- iPhone 12 podporuje iOS 14.1 - 17.x
- Aplikace vyžaduje minimálně iOS 15.0

## Příprava projektu

### 1. Instalace Xcode
```bash
# Stáhněte Xcode z App Store nebo:
# https://developer.apple.com/xcode/
```

### 2. Konfigurace Apple Developer Account
1. Otevřete Xcode
2. Preferences → Accounts
3. Přidejte svůj Apple ID
4. Vyberte Team (Personal Team nebo Developer Team)

### 3. Nastavení Bundle Identifier
V souboru projektu změňte:
```
PRODUCT_BUNDLE_IDENTIFIER = com.yourcompany.ak
```
na váš unikátní identifikátor, např.:
```
PRODUCT_BUNDLE_IDENTIFIER = com.vasejmeno.ak
```

## Spuštění na iPhone 12

### Varianta A: iPhone 12 Simulátor

```bash
# Udělte oprávnění build skriptům
chmod +x build.sh run_on_iphone12.sh

# Spusťte na simulátoru
./run_on_iphone12.sh
```

### Varianta B: Reálný iPhone 12

1. **Připojte iPhone přes USB kabel**

2. **Otevřete projekt v Xcode:**
   ```bash
   open Ak.xcodeproj
   ```

3. **Důvěřujte počítači na iPhone:**
   - Na iPhone se objeví dialog "Trust This Computer?"
   - Stiskněte "Trust"

4. **Vyberte zařízení:**
   - V Xcode v horní liště vyberte "Any iOS Device" → váš iPhone 12

5. **Nastavte Signing:**
   - V Xcode: Target "Ak" → Signing & Capabilities
   - Vyberte váš Team
   - Zaškrtněte "Automatically manage signing"

6. **Spusťte aplikaci:**
   - Stiskněte **⌘R** nebo klikněte na ▶️ Run button
   - První build může trvat 1-2 minuty

7. **Důvěřujte vývojáři na iPhone:**
   - Nastavení → Obecné → VPN a správa zařízení
   - Vyberte váš vývojářský certifikát
   - Klikněte "Důvěřovat"

### Varianta C: Build pomocí příkazové řádky

```bash
# Pro simulátor
xcodebuild \
  -project Ak.xcodeproj \
  -scheme Ak \
  -configuration Debug \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 12,OS=latest' \
  clean build

# Pro reálné zařízení (vyžaduje připojený iPhone)
xcodebuild \
  -project Ak.xcodeproj \
  -scheme Ak \
  -configuration Debug \
  -sdk iphoneos \
  -destination 'name=iPhone' \
  clean build
```

## Oprávnění

Aplikace vyžaduje následující oprávnění:

### Mikrofon
```
NSMicrophoneUsageDescription: 
"Aplikace Ak potřebuje přístup k mikrofonu pro nahrávání výslechů."
```

### Rozpoznávání řeči
```
NSSpeechRecognitionUsageDescription:
"Aplikace Ak používá rozpoznávání řeči pro transkripci nahrávek."
```

## Testování funkcí na iPhone 12

### 1. Dashboard
- ✅ Zobrazení seznamu případů
- ✅ Vytvoření nového případu
- ✅ Navigace do detailu případu

### 2. Analýza
- ✅ Zahájení nové nahrávky
- ⚠️  Audio capture vyžaduje implementaci AVFoundation
- ⚠️  Transkripce vyžaduje implementaci Speech API

### 3. Profily
- ✅ Zobrazení seznamu mluvčích
- ✅ Detail mluvčího s metrikami

### 4. Nesrovnalosti
- ✅ Seznam detekovaných nesrovnalostí
- ✅ Filtrace podle typu

### 5. Nastavení
- ✅ Offline režim
- ✅ Správa úložiště

## Známé limitace (MVP verze)

### Mock implementace:
- **AudioCaptureService** - používá mock URL, vyžaduje AVFoundation
- **TranscriptionService** - vrací ukázková data, vyžaduje Speech/OpenAI API
- **AnalysisService** - vrací mock data, vyžaduje GPT-4o API
- **RecordingStore** - JSON ukládání do Documents

### Pro produkci je třeba:
1. Implementovat `AVAudioRecorder` v `AudioCaptureService`
2. Napojit Speech Framework nebo WhisperAPI pro transkripci
3. Implementovat OpenAI GPT-4o pro analýzu nesrovnalostí
4. Migrovat na Core Data pro trvalé ukládání

## Troubleshooting

### "Failed to code sign"
- Nastavte správný Team v Signing & Capabilities
- Změňte Bundle Identifier na unikátní

### "iPhone is busy"
- Počkejte na dokončení přípravy iPhone v Xcode
- Zkuste odpojit a znovu připojit USB kabel

### "Untrusted Developer"
- Jděte do Nastavení → Obecné → VPN a správa zařízení
- Důvěřujte vývojářskému certifikátu

### "Build Failed"
- Zkontrolujte, že máte Xcode 14.0+
- Aktualizujte iPhone na iOS 15.0+
- Spusťte: `xcodebuild clean build`

## Podpora

iPhone 12 specifikace:
- **Procesor:** A14 Bionic chip
- **RAM:** 4GB
- **Displej:** 6.1" Super Retina XDR (2532×1170)
- **iOS:** 14.1 - 17.x (podporováno)

Doporučená verze iOS pro tuto aplikaci: **iOS 15.0+**

## Licence

Tento projekt je MVP demonstrace. Pro produkční použití je třeba implementovat reálné služby a zabezpečení.
