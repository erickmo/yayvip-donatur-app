# YayVIP Donatur App

Aplikasi mobile & web (PWA) untuk donatur **Yayasan Vernon Indonesia Pintar (VIP)**.

> *Empower Tomorrow's Leaders — Your Support Unlocks Equal Futures for Indonesia's Youth*

## Fitur

- **Splash Screen** — Animasi logo VIP
- **Login** — Autentikasi email & password
- **Dashboard** — Statistik dampak donasi (dana terkumpul, anak dibantu, anak bekerja, donatur aktif)
- **Donasi** — Pilih nominal, QR Code, tombol screenshot
- **Update Terbaru** — Feed berita/blog dari yayasan
- **Laporan Keuangan** — Saldo, alokasi dana, transaksi terakhir
- **Riwayat Donasi** — Histori donasi user dengan status
- **Profil** — Info donatur, pengaturan, logout
- **Bottom Nav Bar** — Tombol donasi merah besar di tengah (FAB-style)
- **Konten Dinamis** — Semua teks bisa diedit via JSON tanpa ubah code

## Tech Stack

| Layer | Tech |
|---|---|
| Framework | Flutter 3.41.4 |
| Platform | Android + iOS + Web PWA |
| State Management | BLoC / Cubit |
| Navigation | go_router |
| DI | get_it |
| Network | Dio |
| QR Code | qr_flutter + mobile_scanner |
| Content | JSON-based (`assets/content/app_content.json`) |

## Getting Started

```bash
# Install dependencies
make get

# Run di Chrome
make run-web

# Run di device/emulator
make run

# Analyze
make analyze

# Test
make test
```

## Konfigurasi Environment

Base URL API diset via `--dart-define`, bukan hardcode:

```bash
# Development
make run-dev

# Staging
make run-staging

# Production
make run-prod
```

## Edit Konten / Teks

Semua caption & teks di app disimpan di satu file JSON:

```
assets/content/app_content.json
```

Edit file tersebut lalu hot restart — tidak perlu ubah source code Dart.

## Project Structure

```
lib/
├── core/
│   ├── constants/      # colors, dimensions, constants
│   ├── content/        # JSON-based dynamic content service
│   ├── di/             # dependency injection (get_it)
│   ├── errors/         # failure classes
│   ├── network/        # Dio API client, network info
│   ├── router/         # go_router config
│   ├── theme/          # Material 3 theme
│   └── utils/          # logger, either extension
├── features/
│   ├── auth/           # login
│   ├── donation/       # donasi + QR code
│   ├── home/           # dashboard + stats + news cards
│   ├── laporan/        # laporan keuangan
│   ├── news/           # update terbaru (blog feed)
│   ├── profile/        # profil donatur
│   ├── riwayat/        # riwayat donasi
│   ├── shell/          # main shell + bottom nav bar
│   └── splash/         # splash screen
└── main.dart
```

## Dokumentasi

- [PRD (Product Requirements)](docs/requirements/prd-yayvip-donatur.md)

## Tentang Yayasan

**Yayasan Vernon Indonesia Pintar** memberdayakan generasi muda Indonesia melalui akses setara terhadap pendidikan berkualitas, pelatihan vokasi, dan peluang karier yang relevan.

- Web: yayasan.vip
- Email: vernonindonesiapintar@gmail.com
- Alamat: Jalan Letjen Sutoyo 102
