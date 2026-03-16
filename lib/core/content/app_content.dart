import 'dart:convert';

import 'package:flutter/services.dart';

/// Service untuk memuat dan menyediakan konten dinamis dari JSON.
/// Semua teks/caption di app dimuat dari assets/content/app_content.json
/// sehingga bisa diedit tanpa rebuild code.
class AppContent {
  AppContent._();

  static Map<String, dynamic> _data = {};
  static bool _isLoaded = false;

  /// Memuat konten dari JSON file. Dipanggil sekali di main().
  static Future<void> load() async {
    if (_isLoaded) return;
    final jsonString =
        await rootBundle.loadString('assets/content/app_content.json');
    _data = json.decode(jsonString) as Map<String, dynamic>;
    _isLoaded = true;
  }

  /// Mengambil value dari nested key menggunakan dot notation.
  /// Contoh: `AppContent.get('home.greeting')` → "Halo"
  static String get(String key, {String fallback = ''}) {
    final keys = key.split('.');
    dynamic current = _data;
    for (final k in keys) {
      if (current is Map<String, dynamic> && current.containsKey(k)) {
        current = current[k];
      } else {
        return fallback;
      }
    }
    return current?.toString() ?? fallback;
  }

  /// Mengambil section sebagai Map.
  /// Contoh: `AppContent.section('home')` → {greeting: "Halo", ...}
  static Map<String, dynamic> section(String key) {
    if (_data.containsKey(key) && _data[key] is Map<String, dynamic>) {
      return _data[key] as Map<String, dynamic>;
    }
    return {};
  }

  // === Shortcut accessors per section ===

  // App
  static String get appName => get('app.name', fallback: 'YayVIP Donatur');
  static String get appTagline => get('app.tagline');
  static String get appDescription => get('app.description');
  static String get orgName => get('app.org_name');
  static String get orgShort => get('app.org_short');
  static String get website => get('app.website');
  static String get email => get('app.email');
  static String get address => get('app.address');

  // Auth
  static String get loginTitle => get('auth.login_title');
  static String get loginSubtitle => get('auth.login_subtitle');
  static String get registerTitle => get('auth.register_title');
  static String get emailLabel => get('auth.email_label');
  static String get passwordLabel => get('auth.password_label');
  static String get forgotPassword => get('auth.forgot_password');
  static String get dontHaveAccount => get('auth.dont_have_account');
  static String get alreadyHaveAccount => get('auth.already_have_account');
  static String get emailRequired => get('auth.email_required');
  static String get emailInvalid => get('auth.email_invalid');
  static String get passwordRequired => get('auth.password_required');
  static String get passwordMinLength => get('auth.password_min_length');

  // Navigation
  static String get navHome => get('navigation.home');
  static String get navUpdate => get('navigation.update');
  static String get navDonasi => get('navigation.donasi');
  static String get navLaporan => get('navigation.laporan');
  static String get navProfile => get('navigation.profile');

  // Home
  static String get homeGreeting => get('home.greeting');
  static String get homeGreetingSuffix => get('home.greeting_suffix');
  static String get totalDonasiLabel => get('home.total_donasi_label');
  static String get donasiSekarang => get('home.donasi_sekarang');
  static String get dampakDonasiTitle => get('home.dampak_donasi_title');
  static String get statDanaTerkumpul => get('home.stat_dana_terkumpul');
  static String get statAnakDibantu => get('home.stat_anak_dibantu');
  static String get statAnakBekerja => get('home.stat_anak_bekerja');
  static String get statDonaturAktif => get('home.stat_donatur_aktif');
  static String get beritaTerbaru => get('home.berita_terbaru');
  static String get lihatSemua => get('home.lihat_semua');

  // Donation
  static String get donationPageTitle => get('donation.page_title');
  static String get donationInfoTitle => get('donation.info_title');
  static String get donationInfoDesc => get('donation.info_description');
  static String get pilihNominal => get('donation.pilih_nominal');
  static String get nominalLain => get('donation.nominal_lain');
  static String get masukkanNominal => get('donation.masukkan_nominal');
  static String get metodePembayaran => get('donation.metode_pembayaran');
  static String get scanQR => get('donation.scan_qr');
  static String get scanQRSubtitle => get('donation.scan_qr_subtitle');
  static String get transferBank => get('donation.transfer_bank');
  static String get transferBankSubtitle =>
      get('donation.transfer_bank_subtitle');
  static String get konfirmasiDonasi => get('donation.konfirmasi_donasi');
  static String get qrTitle => get('donation.qr_title');
  static String get simpanScreenshot => get('donation.simpan_screenshot');
  static String get screenshotBerhasil => get('donation.screenshot_berhasil');

  // News
  static String get newsPageTitle => get('news.page_title');
  static String get bagikan => get('news.bagikan');
  static String get bacaSelengkapnya => get('news.baca_selengkapnya');

  // Profile
  static String get profilePageTitle => get('profile.page_title');
  static String get editProfile => get('profile.edit_profile');
  static String get riwayatDonasi => get('profile.riwayat_donasi');
  static String get laporanKeuangan => get('profile.laporan_keuangan');
  static String get pengaturan => get('profile.pengaturan');
  static String get tentangKami => get('profile.tentang_kami');
  static String get keluar => get('profile.keluar');
  static String get statTotalDonasi => get('profile.stat_total_donasi');
  static String get statFrekuensi => get('profile.stat_frekuensi');
  static String get statSejak => get('profile.stat_sejak');

  // Laporan
  static String get laporanPageTitle => get('laporan.page_title');
  static String get segeraHadir => get('laporan.segera_hadir');

  // Common
  static String get loading => get('common.loading');
  static String get retry => get('common.retry');
  static String get cancel => get('common.cancel');

  // Settings
  static String get settingsPageTitle => get('settings.page_title');
  static String get notifikasi => get('settings.notifikasi');
  static String get notifikasiDesc => get('settings.notifikasi_desc');
  static String get bahasa => get('settings.bahasa');
  static String get bahasaValue => get('settings.bahasa_value');
  static String get tema => get('settings.tema');
  static String get temaValue => get('settings.tema_value');
  static String get keamanan => get('settings.keamanan');
  static String get ubahPassword => get('settings.ubah_password');
  static String get biometrik => get('settings.biometrik');
  static String get biometrikDesc => get('settings.biometrik_desc');
  static String get hapusCache => get('settings.hapus_cache');
  static String get hapusCacheDesc => get('settings.hapus_cache_desc');
  static String get versiApp => get('settings.versi_app');

  // About
  static String get aboutPageTitle => get('about.page_title');
  static String get visiTitle => get('about.visi_title');
  static String get misiTitle => get('about.misi_title');
  static String get kontakTitle => get('about.kontak_title');
  static String get ikutiKami => get('about.ikuti_kami');
  static String get strukturTitle => get('about.struktur_title');

  // App info
  static String get visi => get('app.visi');

  // Errors
  static String get errorGeneral => get('errors.general');
  static String get errorNetwork => get('errors.network');
  static String get errorServer => get('errors.server');
  static String get errorUnauthorized => get('errors.unauthorized');
}
