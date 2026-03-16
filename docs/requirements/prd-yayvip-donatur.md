# PRD: YayVIP Donatur App

**Versi:** 1.0.0
**Tanggal:** 2026-03-16
**Status:** In Progress
**Stack:** Flutter 3.41.4
**Platform:** Android + iOS + Web PWA
**Author:** AI-Generated
**Reviewer:** Erick Setiawan (Pembina Yayasan)

---

## 1. Overview

### 1.1 Latar Belakang
Yayasan Vernon Indonesia Pintar (YayVIP) membutuhkan aplikasi khusus untuk para donatur agar dapat dengan mudah mendapatkan update informasi yayasan, melihat laporan keuangan secara transparan, dan melakukan donasi dengan cepat melalui QR Code.

### 1.2 Tujuan Produk
- Meningkatkan kemudahan donatur dalam berdonasi via QR Code
- Menyediakan transparansi laporan keuangan yayasan secara real-time
- Memberikan update informasi dan kegiatan yayasan (blog/berita)
- Menampilkan dampak donasi: total dana terkumpul, anak dibantu, anak bekerja

### 1.3 Target Pengguna
| Role | Deskripsi |
|---|---|
| Donatur Aktif | Individu yang rutin berdonasi ke YayVIP |
| Donatur Baru | Orang yang tertarik berdonasi untuk pertama kali |

### 1.4 Organisasi
- **Pembina Yayasan:** Erick Setiawan
- **Pengawas Yayasan:** Chelsy Kartika E
- **Ketua Yayasan:** Agil Mahendra
- **Sekretaris:** Anna WF
- **Bendahara:** Fennie Luigi
- **Website:** yayasan.vip
- **Email:** vernonindonesiapintar@gmail.com
- **Alamat:** Jalan Letjen Sutoyo 102

---

## 2. Fitur Utama

| Fitur | Prioritas | Status |
|---|---|---|
| Splash Screen | High | Done |
| Login / Register | High | Done (UI) |
| Dashboard / Home | High | Done (UI) |
| Donasi via QR Code + Screenshot | High | Done (UI) |
| Update Terbaru (Blog) | High | Done (UI) |
| Laporan Keuangan | High | Done (UI) |
| Riwayat Donasi | Medium | Done (UI) |
| Profil Donatur | Medium | Done (UI) |
| Bottom Nav (FAB Donasi) | High | Done |
| Konten Dinamis (JSON) | High | Done |
| PWA Branding | Medium | Done |
| Notifikasi | Low | Belum mulai |
| Backend API Integration | High | Menunggu API |

---

## 3. User Journey Utama

### Journey 1: Pertama Kali Buka App
1. User membuka app → Splash screen dengan logo VIP (animasi fade + scale)
2. Setelah 2 detik → redirect ke halaman Login
3. User input email & password → masuk ke Dashboard

### Journey 2: Donasi via QR Code
1. User tap "Donasi Sekarang" di dashboard atau tombol Donasi (center bottom nav)
2. User pilih nominal donasi (Rp 10.000 - Rp 500.000 atau custom)
3. User pilih metode: QR Code atau Transfer Bank
4. User tap "Konfirmasi Donasi"
5. Bottom sheet muncul dengan QR Code
6. User tap "Simpan Screenshot" untuk menyimpan gambar QR

### Journey 3: Melihat Laporan Keuangan
1. User tap tab "Laporan" di bottom nav
2. User melihat card saldo (total dana terkumpul, pemasukan, pengeluaran)
3. User filter periode (Semua / Bulan Ini / 3 Bulan / 6 Bulan / 1 Tahun)
4. User melihat alokasi dana (Beasiswa, Magang, Penyaluran Kerja, Operasional) dengan progress bar
5. User melihat transaksi terakhir (pemasukan hijau, pengeluaran merah)

### Journey 4: Melihat Riwayat Donasi Pribadi
1. User buka Profil → tap "Riwayat Donasi"
2. User melihat list semua donasi yang pernah dilakukan
3. Setiap item menampilkan: nominal, tanggal, metode, dan status (Berhasil/Pending/Gagal)

### Journey 5: Membaca Update Yayasan
1. User tap tab "Update" di bottom nav
2. User melihat feed berita dengan gambar, kategori chip, dan tanggal
3. User tap artikel untuk detail

---

## 4. Screen & Navigation

| Screen | Route | Deskripsi | Auth | Status |
|---|---|---|---|---|
| SplashPage | / | Logo VIP animasi → redirect | No | Done |
| LoginPage | /login | Form login email & password | No | Done |
| MainShell | /home | Shell dengan bottom nav bar | Yes | Done |
| HomePage | tab 0 | Dashboard, stats, berita | Yes | Done |
| NewsPage | tab 1 | Feed update/blog terbaru | Yes | Done |
| DonationPage | tab 2 | Pilih nominal, QR, screenshot | Yes | Done |
| LaporanPage | tab 3 | Saldo, alokasi, transaksi | Yes | Done |
| ProfilePage | tab 4 | Profil, menu settings | Yes | Done |
| RiwayatDonasiPage | /riwayat-donasi | List riwayat donasi user | Yes | Done |

### Bottom Navigation Bar
```
[Beranda] [Update] [DONASI*] [Laporan] [Profil]
                     ^
          Tombol bulat merah besar (FAB-style)
          dengan icon heart + label "Donasi"
```

### Flow Navigasi
```
Splash (/) → Login (/login) → MainShell (/home)
                                ├── tab 0: HomePage
                                ├── tab 1: NewsPage
                                ├── tab 2: DonationPage → QR Bottom Sheet
                                ├── tab 3: LaporanPage
                                └── tab 4: ProfilePage → /riwayat-donasi
```

---

## 5. Sistem Konten Dinamis

Semua teks/caption di aplikasi dimuat dari file JSON (`assets/content/app_content.json`), bukan hardcode di source code.

**Cara edit teks:** Edit file `assets/content/app_content.json` lalu rebuild/hot restart.

**Service:** `lib/core/content/app_content.dart` — dot notation accessor (`AppContent.homeGreeting`)

**Struktur JSON:**
- `app` — nama, tagline, deskripsi, info organisasi, kontak
- `auth` — label login, register, validasi form
- `navigation` — label bottom nav (5 tab)
- `home` — greeting, statistik cards, berita section
- `donation` — nominal, QR, metode pembayaran, screenshot
- `news` — judul halaman
- `profile` — menu items (riwayat, laporan, pengaturan, tentang, keluar)
- `laporan` — judul, placeholder
- `common` — tombol umum (loading, retry, cancel, save, dll)
- `errors` — pesan error (network, server, unauthorized, timeout)
- `empty_states` — pesan data kosong

---

## 6. Non-Functional Requirements

| Kategori | Target |
|---|---|
| Load time (cold start) | < 3 detik |
| API response handling | Timeout 30 detik |
| Offline support | Cache berita & laporan (fase 2) |
| Min Android version | Android 6.0 (API 23) |
| Min iOS version | iOS 13.0 |
| Web | PWA support (Chrome, Safari) |
| Test coverage | >= 80% (Cubit & UseCase) |

---

## 7. Branding & Tema

Mengikuti proposal Vernon Indonesia Pintar:
- **Primary Color:** #E53935 (Merah)
- **Primary Dark:** #AB000D
- **Primary Light:** #FF6F60
- **Logo:** VIP (V hitam, I merah, P hitam)
- **Tagline:** "Empower Tomorrow's Leaders"
- **Subtitle:** "Your Support Unlocks Equal Futures for Indonesia's Youth"
- **PWA Theme Color:** #E53935
- **Splash:** Animasi fade + scale logo VIP

---

## 8. Tech Stack & Architecture

| Layer | Tech |
|---|---|
| Framework | Flutter 3.41.4 |
| State Management | BLoC / Cubit (flutter_bloc ^9.1.1) |
| Navigation | go_router ^17.1.0 |
| DI | get_it ^9.2.1 |
| Network | Dio ^5.3.3 |
| QR Code | qr_flutter ^4.1.0, mobile_scanner ^7.2.0 |
| Storage | flutter_secure_storage ^10.0.0, shared_preferences ^2.2.2 |
| Functional | dartz ^0.10.1 (Either) |
| Content | JSON-based (app_content.json) |

**Architecture:** Clean Architecture per feature
```
lib/features/[feature]/
├── data/          → datasources, models, repositories impl
├── domain/        → entities, repository interfaces, usecases
└── presentation/  → bloc/cubit, pages, widgets
```

---

## 9. Out of Scope (v1.0)
- Payment gateway integration (fase berikutnya)
- Multi-bahasa (hanya Bahasa Indonesia di v1)
- Admin panel (terpisah)
- Push notification (fase 2)

---

## 10. Open Questions
- [ ] Backend API stack dan endpoint structure?
- [ ] Payment gateway yang akan digunakan?
- [ ] Apakah QR Code di-generate dari app atau dari backend?
- [ ] Autentikasi: email/password, Google Sign-In, atau keduanya?
- [ ] File favicon/logo VIP yang final?

---
*Terakhir diupdate: 2026-03-16*
