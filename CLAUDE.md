# YayVIP Donatur App — Flutter

## Project Overview
Aplikasi mobile & web (PWA) untuk donatur Yayasan Vernon Indonesia Pintar.
Fitur utama: informasi & update yayasan, laporan keuangan, dan donasi via QR Code.

## Stack
- Flutter 3.41.4 + Dart
- State Management: BLoC / Cubit
- Navigation: go_router
- DI: get_it (manual registration)
- Network: Dio
- Platform: Android / iOS / Web PWA

## Architecture
Clean Architecture — `lib/features/[feature]/data|domain|presentation/`

## PRD & Requirements
- PRD Utama: `docs/requirements/prd-yayvip-donatur.md`

## Konten Dinamis
- Semua teks/caption dimuat dari `assets/content/app_content.json`
- Service: `lib/core/content/app_content.dart`
- Edit JSON → rebuild/hot restart → teks berubah
- JANGAN hardcode string baru, tambahkan ke JSON + AppContent accessor

## Active Sprint
- [x] Initial setup & project structure
- [x] Login screen
- [x] Dashboard (stats, berita, card donasi)
- [x] Update terbaru (news feed)
- [x] Donasi (nominal, QR, screenshot)
- [x] Profil donatur
- [x] Bottom nav bar (FAB donasi merah center)
- [x] Konten dinamis JSON
- [x] PWA branding (manifest, index.html)
- [ ] Laporan keuangan (placeholder)
- [ ] Backend API integration
- [ ] Favicon/logo VIP

## Coding Rules
- SEMUA code ditulis oleh AI — tidak ada manual coding
- Ikuti `flutter-coding-standard` skill
- Widget > 50 baris → pecah ke sub-widget
- DILARANG business logic di build()
- DILARANG hardcode string/color/dimension — gunakan AppContent + AppColors + AppDimensions
- Repository return Either<Failure, T>
- Handle semua state: loading/success/error/empty

## Commands
```bash
make get          # flutter pub get
make run          # flutter run
make run-web      # flutter run -d chrome
make gen          # build_runner (code generation)
make test         # flutter test
make analyze      # flutter analyze
make build-apk    # build release APK
make build-web    # build release Web
```

## Project Structure
```
lib/
├── core/
│   ├── constants/     → app_colors, app_constants, app_dimensions, app_strings
│   ├── content/       → app_content (JSON-based dynamic content)
│   ├── di/            → injection (get_it)
│   ├── errors/        → failures
│   ├── network/       → api_client, network_info
│   ├── router/        → app_router (go_router)
│   ├── theme/         → app_theme
│   └── utils/         → either_extension, logger
├── features/
│   ├── auth/          → login
│   ├── home/          → dashboard, stats, news cards
│   ├── news/          → update terbaru (blog feed)
│   ├── donation/      → donasi, QR code, screenshot
│   ├── profile/       → profil donatur
│   └── shell/         → main shell + bottom nav bar
└── main.dart
assets/
├── content/app_content.json  ← EDIT TEKS DI SINI
├── images/
├── icons/
├── logo/                     ← taruh favicon di sini
└── animations/
```

## Forbidden
- JANGAN push langsung ke main/master
- JANGAN hardcode URL atau API key
- JANGAN hardcode string — gunakan AppContent
- BASE_URL diset via --dart-define saat run/build
