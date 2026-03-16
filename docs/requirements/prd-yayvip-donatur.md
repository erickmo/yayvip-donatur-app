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
| Login / Register | High | Done (UI) |
| Dashboard / Home | High | Done (UI) |
| Donasi via QR Code | High | Done (UI) |
| Update Terbaru (Blog) | High | Done (UI) |
| Profil Donatur | Medium | Done (UI) |
| Laporan Keuangan | High | Placeholder |
| Riwayat Donasi | Medium | Belum mulai |
| Notifikasi | Low | Belum mulai |
| Konten Dinamis (JSON) | High | Done |

---

## 3. User Journey Utama

### Journey 1: Donasi via QR Code
1. User login ke aplikasi
2. User tap "Donasi Sekarang" di dashboard atau tombol Donasi (center bottom nav)
3. User pilih nominal donasi (preset atau custom)
4. User pilih metode: QR Code atau Transfer Bank
5. User tap "Konfirmasi Donasi"
6. Bottom sheet muncul dengan QR Code + tombol Screenshot
7. User scan QR atau simpan screenshot untuk transfer

### Journey 2: Melihat Dampak & Laporan
1. User buka dashboard
2. User melihat 4 stat cards: dana terkumpul, anak dibantu, anak bekerja, donatur aktif
3. User buka tab Laporan untuk detail keuangan

### Journey 3: Membaca Update Yayasan
1. User tap tab "Update" di bottom nav
2. User melihat feed berita dengan gambar, kategori, dan tanggal
3. User tap artikel untuk detail

---

## 4. Screen & Navigation

| Screen | Route | Deskripsi | Auth | Status |
|---|---|---|---|---|
| LoginPage | /login | Form login email & password | No | Done |
| MainShell | /home | Shell dengan bottom nav bar | Yes | Done |
| HomePage | tab 0 | Dashboard, stats, berita | Yes | Done |
| NewsPage | tab 1 | Feed update/blog terbaru | Yes | Done |
| DonationPage | tab 2 | Pilih nominal, QR, screenshot | Yes | Done |
| LaporanPage | tab 3 | Laporan keuangan | Yes | Placeholder |
| ProfilePage | tab 4 | Profil, menu, riwayat | Yes | Done |

### Bottom Navigation Bar
```
[Beranda] [Update] [DONASI*] [Laporan] [Profil]
                     ^
          Tombol bulat merah besar (FAB-style)
```

---

## 5. Sistem Konten Dinamis

Semua teks/caption di aplikasi dimuat dari file JSON (`assets/content/app_content.json`), bukan hardcode di source code.

**Cara edit teks:** Edit file `assets/content/app_content.json` lalu rebuild/hot restart.

**Struktur JSON:**
- `app` — nama, tagline, deskripsi, info organisasi
- `auth` — label login, register, validasi
- `navigation` — label bottom nav
- `home` — greeting, statistik, berita
- `donation` — nominal, QR, metode pembayaran
- `news` — judul halaman
- `profile` — menu items
- `laporan` — placeholder text
- `common` — tombol umum
- `errors` — pesan error
- `empty_states` — pesan kosong

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
- **Logo:** VIP (V hitam, I merah, P hitam)
- **Tagline:** "Empower Tomorrow's Leaders"
- **Subtitle:** "Your Support Unlocks Equal Futures for Indonesia's Youth"
- **PWA Theme Color:** #E53935

---

## 8. Out of Scope (v1.0)
- Payment gateway integration (fase berikutnya)
- Multi-bahasa (hanya Bahasa Indonesia di v1)
- Admin panel (terpisah)
- Push notification (fase 2)

---

## 9. Open Questions
- [ ] Backend API stack dan endpoint structure?
- [ ] Payment gateway yang akan digunakan?
- [ ] Apakah QR Code di-generate dari app atau dari backend?
- [ ] Autentikasi: email/password, Google Sign-In, atau keduanya?
- [ ] File favicon/logo VIP yang final?

---
*Terakhir diupdate: 2026-03-16*
