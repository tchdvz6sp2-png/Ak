# Ak

MVP návrh nativní iOS aplikace pro analýzu nahrávek a detekci nesrovnalostí. Projekt obsahuje SwiftUI kostru s ukázkovými view modely a službami, připravenou na napojení na AVFoundation, Speech a AI API.

## Struktura
- `AkApp/Views` – obrazovky Dashboard, Analýza, Profily, Nesrovnalosti, Nastavení.
- `AkApp/ViewModels` – stav a data pro jednotlivé obrazovky.
- `AkApp/Services` – protokoly a mock implementace pro transkripci, analýzu a ukládání.
- `AkApp/Models` – datové modely pro případy, nahrávky, mluvčí a nesrovnalosti.

## Další kroky
1. Přidejte Xcode projekt a připojte složku `AkApp`.
2. Nahraďte mock služby reálnými implementacemi (AVFoundation, Whisper/AssemblyAI, GPT-4o).
3. Napojte trvalé ukládání dat (Core Data / SQLite).
