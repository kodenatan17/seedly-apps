// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get backButtonLabel => 'Kembali';

  @override
  String get closeButtonLabel => 'Tutup';

  @override
  String get retryButtonLabel => 'Coba Lagi';

  @override
  String progressFraction(int current, int total) {
    return '$current / $total';
  }

  @override
  String milestoneNumber(int number) {
    return 'Milestone $number';
  }

  @override
  String milestonesCount(int count) {
    return '$count Milestone';
  }

  @override
  String get achievementsTitle => 'Pencapaian';

  @override
  String get gardenMasteryTitle => 'Penguasaan Kebun';

  @override
  String levelLabel(int level) {
    return 'Level $level';
  }

  @override
  String levelShort(int level) {
    return 'Lvl $level';
  }

  @override
  String get gardenMasterySubtitle =>
      'Pantau milestone pertumbuhanmu dan raih lencana seiring rumah kaca digitalmu bersemi.';

  @override
  String get currentMedalLabel => 'MEDALI SAAT INI';

  @override
  String get masterGardenerName => 'Ahli Kebun';

  @override
  String get masterGardenerQuote =>
      '\"Kamu menjadi perawat tanaman yang hebat! Tanamanmu tumbuh subur berkat perawatan yang konsisten.\"';

  @override
  String get milestonesProgressTitle => 'Progres Milestone';

  @override
  String milestonesToNextRank(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count milestone ke peringkat berikutnya',
    );
    return '$_temp0';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% selesai';
  }

  @override
  String get nextUnlockLabel => 'BUKA BERIKUTNYA';

  @override
  String get unlockedMedalsTitle => 'Medali Terbuka';

  @override
  String earnedCount(int count) {
    return '$count diraih';
  }

  @override
  String get milestoneProgressTitle => 'Progres Milestone';

  @override
  String get medalJourneyLabel => 'Perjalanan Medali';

  @override
  String get medalJourneyDescription =>
      'Naikkan peringkatmu, buka rahasia langka, dan rawat taman digitalmu yang rimbun!';

  @override
  String tierValue(int tier) {
    return 'Tier $tier';
  }

  @override
  String get currentRankLabel => 'Peringkat Saat Ini';

  @override
  String get milestonesLabel => 'Milestone';

  @override
  String leftValue(int count) {
    return '$count Lagi';
  }

  @override
  String get toNextTierLabel => 'Ke Tier Berikutnya';

  @override
  String tierCompleted(int tier) {
    return 'Tier $tier • Selesai';
  }

  @override
  String get currentActiveTierLabel => 'TIER AKTIF SAAT INI';

  @override
  String rankLabel(int rank) {
    return 'Peringkat $rank';
  }

  @override
  String get milestoneProgressLabel => 'Progres Milestone';

  @override
  String milestonesFraction(int current, int total) {
    return '$current / $total Milestone';
  }

  @override
  String get nextMilestoneTargetLabel => 'Target Milestone Berikutnya';

  @override
  String lockedMilestones(int count) {
    return 'Terkunci • $count Milestone';
  }

  @override
  String legendaryTier(int count) {
    return 'TIER LEGENDARIS • $count MILESTONE';
  }

  @override
  String get keepRootsGrowingTitle => 'Terus Tumbuhkan Akarmu!';

  @override
  String keepRootsGrowingDescription(String nextTier) {
    return 'Selesaikan misi berkebun harian hari ini untuk meraih poin milestone lebih cepat menuju $nextTier.';
  }

  @override
  String get viewTodaysMissions => 'Lihat Misi Hari Ini';

  @override
  String get tierSeedlingName => 'Benih';

  @override
  String get tierSeedlingDescription =>
      'Setiap pohon besar bermula dari mimpi kecil di dalam tanah. Kamu telah menanam akar pertamamu!';

  @override
  String get tierSproutName => 'Tunas';

  @override
  String get tierSproutDescription =>
      'Daun hijau pertama menembus tanah! Kamu mulai mengenal ritme sinar matahari dan air setiap hari.';

  @override
  String get tierGrowerName => 'Penumbuh';

  @override
  String get tierGrowerDescription =>
      'Batang menebal dan cabang mulai menjulur. Perawatan yang konsisten mengubah tunas kecil menjadi batang yang tangguh.';

  @override
  String get tierNurturerName => 'Perawat';

  @override
  String get tierNurturerDescription =>
      'Kamu tahu kapan tanaman haus bahkan sebelum mereka meminta. Empatimu menghadirkan vitalitas yang cerah di kebun.';

  @override
  String get tierGardenerName => 'Tukang Kebun';

  @override
  String get tierGardenerDescription =>
      'Kamu mengelola kesehatan tanah, jadwal pemangkasan, dan bunga yang ceria dengan keahlian yang matang!';

  @override
  String get tierPlantKeeperName => 'Penjaga Tanaman';

  @override
  String get tierPlantKeeperDescription =>
      'Jaga spesies botani langka dan buka peningkatan rumah kaca legendaris.';

  @override
  String get plantKeeperUnlockDescription =>
      'Buka benih eksotis dan bonus pupuk!';

  @override
  String get tierGardenKeeperName => 'Penjaga Kebun';

  @override
  String get tierGardenKeeperDescription =>
      'Kuasai penanaman pendamping yang kompleks dan seimbangkan iklim mikro musiman.';

  @override
  String get tierGardenMasterName => 'Master Kebun';

  @override
  String get tierGardenMasterDescription =>
      'Rancang lanskap ekosistem menakjubkan yang ramai dengan satwa penyerbuk.';

  @override
  String get tierGreenThumbName => 'Tangan Hijau';

  @override
  String get tierGreenThumbDescription =>
      'Sentuhan legendaris yang membuat benih tidur pun langsung bersemi dengan riang.';

  @override
  String get tierBloomMasterName => 'Master Mekar';

  @override
  String get tierBloomMasterDescription =>
      'Puncak tertinggi dalam merawat taman. Tamanmu menjadi negeri ajaib musim semi yang abadi!';

  @override
  String get newAchievementsTitle => 'Pencapaian Baru';

  @override
  String get achievementUnlockedBadge => 'Pencapaian Terbuka';

  @override
  String get newMedalUnlockedTitle => '🎉 Medali Baru Terbuka!';

  @override
  String get plantKeeperSupremeName => 'Penjaga Tanaman Agung';

  @override
  String unlockedMedalMessage(String petName) {
    return 'Kerja hebat! $petName dan taman digitalmu semakin subur.';
  }

  @override
  String get milestonesCompletedLabel => 'Milestone selesai';

  @override
  String get unlockedPerkLabel => 'Bonus Terbuka';

  @override
  String get goldenPotPerk => 'Skin Pot Emas Spesial & Bonus +100 XP!';

  @override
  String get claimRewardAndContinue => 'Klaim Hadiah & Lanjutkan';

  @override
  String get viewInMedalJourney => 'Lihat di Perjalanan Medali';

  @override
  String welcomeGreeting(String name) {
    return 'Selamat datang, $name! 🌱';
  }

  @override
  String get gardenWaitingTitle => 'Kebunmu sudah menanti.';

  @override
  String get gardenWaitingDescription =>
      'Hubungkan Seedly Smart Pot fisik atau mulai menumbuhkan benih digital pertamamu hari ini!';

  @override
  String get addFirstPlantButton => 'Tambah Tanaman Pertamaku';

  @override
  String get scanSmartPotButton => 'Pindai Kode QR Smart Pot';

  @override
  String get zeroStressTitle => 'Tanpa stres, 100% menyenangkan!';

  @override
  String get zeroStressDescription =>
      'Kami akan memandumu langkah demi langkah dengan tips penyiraman yang lembut.';

  @override
  String get readyBadgeLabel => 'Siap!';

  @override
  String get navHome => 'Beranda';

  @override
  String get navGarden => 'Kebun';

  @override
  String get navMissions => 'Misi';

  @override
  String get navChat => 'Obrolan';

  @override
  String get navProfile => 'Profil';

  @override
  String get gardenHasPlantsTitle => 'Kebunmu sedang bertumbuh!';

  @override
  String gardenHasPlantsDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tanaman di seluruh wadahmu.',
    );
    return '$_temp0';
  }

  @override
  String get viewMyPlantsButton => 'Lihat Tanamanku';

  @override
  String get addNewSeedTitle => 'Tambah Benih Baru';

  @override
  String get addSeedQuestion =>
      'Bagaimana kamu ingin memperkenalkan tanaman barumu ke kebun?';

  @override
  String get scanQrMethodTitle => 'Pindai QR';

  @override
  String get scanQrMethodDescription =>
      'Cara tercepat jika kamu punya starter kit Seedly.';

  @override
  String get enterCodeMethodTitle => 'Masukkan Kode SEEDLY';

  @override
  String get enterCodeMethodDescription =>
      'Ketik kode 6 digit pada kemasan benihmu.';

  @override
  String get browseCatalogueMethodTitle => 'Jelajahi Katalog';

  @override
  String get browseCatalogueMethodDescription =>
      'Menambahkan tanaman yang kamu beli di tempat lain?';

  @override
  String get scanQrCodeTitle => 'Pindai Kode QR';

  @override
  String get scanSeedCodeHeadline => 'Pindai kode benih SEEDLY-mu 🌱';

  @override
  String get scanSeedCodeDescription => 'Arahkan kode QR ke dalam bingkai.';

  @override
  String get tapToScanHint => 'Ketuk untuk memindai QR Tanaman';

  @override
  String get enterCodeManuallyButton => 'Masukkan Kode Manual';

  @override
  String get cameraPermissionDenied =>
      'Akses kamera diperlukan untuk memindai kode QR.';

  @override
  String get addPlantTitle => 'Tambah Tanaman';

  @override
  String get enterSeedlyCodeHeadline => 'Masukkan Kode SEEDLY';

  @override
  String get enterSeedlyCodeDescription =>
      'Temukan kode 10 digit di bagian bawah sensor kit atau pada buku petunjuk.';

  @override
  String get seedCodeHint => 'XXXXX-XXXXX';

  @override
  String get continueButton => 'Lanjutkan';

  @override
  String get whereFindCodeLink => 'Di mana saya menemukan kode saya?';

  @override
  String get invalidSeedCodeError =>
      'Masukkan kode 10 digit persis seperti yang tertera.';

  @override
  String get seedCatalogueTitle => 'Katalog Benih';

  @override
  String get seedCatalogueDescription =>
      'Pilih benih untuk memulai perjalanannya. Setiap tanaman dilengkapi rutinitas perawatan yang disesuaikan agar tumbuh subur di lingkungan Seedly-mu.';

  @override
  String get addSeedButton => 'Tambah Benih';

  @override
  String get inactiveSpeciesBadge => 'Segera hadir';

  @override
  String get expectedJourneyTitle => 'Perjalanan yang Diharapkan';

  @override
  String whereWillYouGrow(String name) {
    return 'Di mana kamu akan menumbuhkan $name?';
  }

  @override
  String get confirmPlantingButton => 'Konfirmasi Penanaman';

  @override
  String get containerReadyStatus => 'SIAP';

  @override
  String get containerFullStatus => 'Kebun penuh';

  @override
  String smartPotLabel(String letter) {
    return 'Smart Pot $letter';
  }

  @override
  String get directPlantSubtitle => 'Tanam Langsung';

  @override
  String kitKeywordSubtitle(String kitName) {
    return 'Kit $kitName';
  }

  @override
  String adventureSuffixTitle(String speciesName) {
    return 'Petualangan $speciesName';
  }

  @override
  String plantJoinedTitle(String name) {
    return '$name telah bergabung ke kebunmu! 🌱';
  }

  @override
  String get growthJourneyBeginsToday =>
      'Perjalanan pertumbuhanmu dimulai hari ini.';

  @override
  String daySproutingLabel(int day) {
    return 'Hari $day: Bertunas';
  }

  @override
  String get firstQuestUnlockedTitle => 'Misi Pertama Terbuka!';

  @override
  String get firstQuestUnlockedDescription =>
      'Ambil foto tanaman barumu untuk memulai linimasanya.';

  @override
  String get goToMyGardenButton => 'Lihat Kebunku';

  @override
  String get authWelcomeBackTitle => 'Selamat datang kembali 🌱';

  @override
  String get authWelcomeBackSubtitle =>
      'Masuk untuk melihat bagaimana Tommy dan kebunmu tumbuh hari ini!';

  @override
  String get authEmailLabel => 'Alamat Email';

  @override
  String get authPasswordLabel => 'Kata Sandi';

  @override
  String get authEmailHint => 'alex.grower@example.com';

  @override
  String get authPasswordHint => 'GardenSecret123';

  @override
  String get authMinCharsHint => 'min 8 karakter';

  @override
  String get authRememberMe => 'Ingat saya';

  @override
  String get authForgotPasswordLink => 'Lupa kata sandi?';

  @override
  String get authLogInButton => 'Masuk';

  @override
  String get authOrDivider => 'atau';

  @override
  String get authSignInWithGoogle => 'Masuk dengan Google';

  @override
  String get authNewToSeedly => 'Baru di Seedly?';

  @override
  String get authCreateAnAccountLink => 'Buat akun';

  @override
  String get authRegisterTitle => 'Buat akun SEEDLY kamu 🌱';

  @override
  String get authRegisterSubtitle =>
      'Simpan tanamanmu, pantau telemetri real-time, dan kumpulkan medali kebun bersama.';

  @override
  String get authRegisterEmailHint => 'nurul.gardener@gmail.com';

  @override
  String get authConfirmPasswordLabel => 'Konfirmasi Kata Sandi';

  @override
  String get authWeakPasswordLabel => 'Kata sandi lemah';

  @override
  String get authMediumPasswordLabel => 'Kata sandi sedang';

  @override
  String get authStrongPasswordLabel => 'Kata sandi kuat';

  @override
  String authPasswordLevelLabel(int level, String tier) {
    return 'Lvl. $level $tier';
  }

  @override
  String get authPasswordTierSeed => 'Bibit';

  @override
  String get authPasswordTierSprout => 'Tunas';

  @override
  String get authPasswordTierBloom => 'Bunga';

  @override
  String get authTermsAgreement =>
      'Saya setuju dengan Ketentuan Keluarga Seedly dan Kebijakan Privasi Keselamatan Anak';

  @override
  String get authCreateAccountButton => 'Buat Akun';

  @override
  String get authEmailRequiredError => 'Email wajib diisi';

  @override
  String get authPasswordMinLengthError => 'Gunakan minimal 8 karakter';

  @override
  String get authPasswordMismatchError => 'Kata sandi tidak sama';

  @override
  String get authOrRegisterWith => 'atau daftar dengan';

  @override
  String get authContinueWithGoogle => 'Lanjutkan dengan Google';

  @override
  String get authPrivacyNote =>
      'Kami hanya menggunakan akunmu untuk menyimpan pasangan smart container, streak perawatan, dan sertifikat botanimu.';

  @override
  String get authAlreadyHaveAccount => 'Sudah punya akun?';

  @override
  String get authLogInLink => 'Masuk';

  @override
  String authStepProgress(int current, int total) {
    return 'Langkah $current dari $total';
  }

  @override
  String get authCheckEmailTitle => 'Periksa emailmu 📩';

  @override
  String get authCheckEmailSubtitle =>
      'Kami mengirim tautan konfirmasi ajaib ke:';

  @override
  String get authCheckEmailHint =>
      'Ketuk tautan di inbox-mu untuk menumbuhkan akunmu!';

  @override
  String get authQuickStepsTitle => '3 langkah cepat bertunas';

  @override
  String get authEasyPeasyBadge => 'GAMPANG BANGET';

  @override
  String get authOpenEmailAppTitle => 'Buka aplikasi email';

  @override
  String get authOpenEmailAppDescription => 'Cari pesan dari Seedly Garden';

  @override
  String get authVerifyAccountTitle => 'Ketuk \'Verifikasi akun Seedly-ku\'';

  @override
  String get authVerifyAccountDescription =>
      'Cari tombol hijau besar di dalamnya';

  @override
  String get authReturnToPlantTitle => 'Kembali ke sini untuk mulai menanam';

  @override
  String get authReturnToPlantDescription => 'Petak bibit nyamanmu sudah siap';

  @override
  String get authOpenMailAppButton => 'Buka Aplikasi Email';

  @override
  String authResendLinkCountdown(int seconds) {
    return 'Kirim ulang tautan (${seconds}s)';
  }

  @override
  String get authResendLinkButton => 'Kirim ulang tautan';

  @override
  String get authChangeEmailLink => 'Salah alamat email? Ganti email';

  @override
  String get authSpamNote =>
      'Tidak menemukan emailnya? Jangan lupa cek folder spam atau promosi. Kadang bibit kecil bersembunyi di sudut sunyi!';

  @override
  String get authResetPasswordTitle => 'Atur Ulang Kata Sandi 🔑';

  @override
  String get authResetPasswordSubtitle =>
      'Masukkan email terdaftarmu dan kami akan mengirim instruksi aman untuk mengatur ulang akses kebunmu.';

  @override
  String get authAccountEmailLabel => 'Email Akunmu';

  @override
  String get authAccountEmailBadge => 'Orang Dewasa atau Wali';

  @override
  String get authAccountEmailHint => 'hello@familygarden.com';

  @override
  String get authSendResetLinkButton => 'Kirim Tautan Atur Ulang';

  @override
  String get authEncryptedKidSafe => 'Terenkripsi & Aman untuk Anak';

  @override
  String get authNeedHandTitle => 'Butuh bantuan sekarang?';

  @override
  String authNeedHandDescription(String email) {
    return 'Hubungi pemandu keluarga kami kapan saja di $email';
  }

  @override
  String get authSupportEmail => 'support@seedly.app';

  @override
  String get authBackToLogIn => 'Kembali ke Masuk';

  @override
  String get authOnboardingHeroTitle => 'Belajar, Berkarya & Bertunas 🌿';

  @override
  String get authOnboardingHeroDescription =>
      'Selesaikan misi botani yang seru, tanya apa saja ke Seedly AI, dan buka 10 medali progresif saat rumah kaca nyatamu tumbuh subur.';

  @override
  String get authGardenMasterBadge => 'Master Kebun';

  @override
  String get authBotanyQuickChecksTitle => 'Cek Cepat Botani';

  @override
  String get authBotanyQuickChecksDescription =>
      'Misi mikro 60 detik setiap hari';

  @override
  String get authXpBadge => '+10 XP';

  @override
  String get authMedalJourneyTitle => 'Perjalanan 10 Medali';

  @override
  String get authMedalJourneySubtitle => 'Dari Bibit sampai Master Bertunas';

  @override
  String authMedalJourneyFraction(int current, int total) {
    return '$current / $total';
  }

  @override
  String get authPlantCompanionTitle => 'Pendamping Tanaman Cerdas';

  @override
  String get authPlantCompanionDescription => 'Obrolan botani ramah anak 24/7';

  @override
  String get authGetStartedButton => 'Mulai';

  @override
  String get accountDetailTitle => 'Detail Akun';

  @override
  String get accountDetailMemberSince => 'Member Sejak: Maret 2023';

  @override
  String get accountDetailLevelBadge => 'Level 4 Botanis';

  @override
  String get accountDetailStreakBadge => '12 Hari Beruntun';

  @override
  String get accountDetailPersonalInfoTitle => 'Informasi Pribadi';

  @override
  String get accountDetailDisplayNameLabel => 'Nama Tampilan';

  @override
  String get accountDetailDisplayNameHint => 'Sam D.';

  @override
  String get accountDetailEmailLabel => 'Alamat Email';

  @override
  String get accountDetailEmailHint => 'sam.gardener@example.com';

  @override
  String get accountDetailUpdateButton => 'Perbarui Profil';

  @override
  String get accountDetailPotsTitle => 'Pot Pintar Terhubung';

  @override
  String get accountDetailAddNewLink => '+ Tambah Baru';

  @override
  String get accountDetailPotAName => 'Pot Pintar A';

  @override
  String get accountDetailPotASpecies => 'Monstera Deliciosa';

  @override
  String get accountDetailPotASoil => '• Tanah: 68% • Ideal';

  @override
  String get accountDetailPotBName => 'Pot Pintar B';

  @override
  String get accountDetailPotBSpecies => 'Fiddle Leaf Fig';

  @override
  String get accountDetailPotBSoil => '• Suhu: 24°C • Stabil';

  @override
  String get accountDetailFooterNote =>
      'Tanamanmu tumbuh subur berkat perawatanmu!';

  @override
  String get helpSupportBanner => 'Kami siap bantu, tunas kecil!';

  @override
  String get helpSupportTitle => 'Bantuan & Dukungan';

  @override
  String get helpSupportSubtitle =>
      'Temukan jawaban cepat, ngobrol dengan ahli kebun, atau jelajahi panduan.';

  @override
  String get helpSupportSearchHint => 'Cari FAQ (mis. pot pintar, penyiraman)';

  @override
  String get helpSupportOnlineBadge => 'Ahli Kebun Online';

  @override
  String get helpSupportChatTitle => 'Chat dengan Support';

  @override
  String get helpSupportChatSubtitle =>
      'Ada pertanyaan tricky? Kami balas dalam hitungan menit!';

  @override
  String get helpSupportChatButton => 'Chat';

  @override
  String get helpSupportFaqTitle => 'Pertanyaan yang Sering Diajukan';

  @override
  String get helpSupportViewAllLink => 'Lihat Semua';

  @override
  String get helpSupportFaqQ1 => 'Cara pairing pot pintar?';

  @override
  String get helpSupportFaqA1 =>
      'Buka app Seedly, tap Tambah Pot Pintar, tahan tombol pairing 3 detik sampai LED berkedip biru.';

  @override
  String get helpSupportFaqQ2 => 'Panduan jadwal penyiraman';

  @override
  String get helpSupportFaqA2 =>
      'Kebanyakan tanaman hias suka disiram tiap 5-7 hari; cek dulu kelembapan tanahnya.';

  @override
  String get helpSupportFaqQ3 => 'Perpanjangan langganan & tagihan';

  @override
  String get helpSupportFaqA3 =>
      'Plus diperpanjang tiap bulan via metode pembayaranmu; batalkan kapan saja di halaman Langganan.';

  @override
  String get helpSupportFaqQ4 => 'Bagaimana kalau tanamanku tidak tumbuh?';

  @override
  String get helpSupportFaqA4 =>
      'Cek dulu cahaya dan air — chat AI kami bisa bantu diagnosa dari foto.';

  @override
  String get helpSupportGuidesTitle => 'Panduan & Manual';

  @override
  String get helpSupportGuide1Title => 'Panduan Cepat';

  @override
  String get helpSupportGuide1Meta => 'PDF • 2.4 MB';

  @override
  String get helpSupportGuide2Title => 'Buku Panduan Pot Pintar';

  @override
  String get helpSupportGuide2Meta => 'PDF • 4.1 MB';

  @override
  String get helpSupportFactTitle => 'Tahukah kamu?';

  @override
  String get helpSupportFactBody =>
      'Ngobrol sama tanaman bantu mereka nyerap energi positif! (Dan karbon dioksida).';

  @override
  String get notificationPrefsTitle => 'Notifikasi';

  @override
  String get notificationPrefsSubtitle =>
      'Pilih notifikasi apa yang masuk ke kebunmu';

  @override
  String get notificationPrefsGroupPlantCare => 'Perawatan Tanaman';

  @override
  String get notificationPrefsGroupMissions => 'Misi & Ringkasan';

  @override
  String get notificationPrefsGroupHardware => 'Pot Pintar & Perangkat';

  @override
  String get notificationPrefsWateringTitle => 'Haus & Penyiraman';

  @override
  String get notificationPrefsWateringSubtitle =>
      'Pengingat ramah saat tanamanmu butuh minum';

  @override
  String get notificationPrefsSunlightTitle => 'Deteksi Sinar Matahari';

  @override
  String get notificationPrefsSunlightSubtitle =>
      'Pengingat pindahkan tanaman ke jendela yang cerah';

  @override
  String get notificationPrefsDailyMissionTitle => 'Notifikasi Misi Harian';

  @override
  String get notificationPrefsDailyMissionSubtitle =>
      'Jangan sampai lewat streak dan hadiah harianmu';

  @override
  String get notificationPrefsWeeklyGrowthTitle =>
      'Rangkuman Pertumbuhan Mingguan';

  @override
  String get notificationPrefsWeeklyGrowthSubtitle =>
      'Rekap manis seberapa subur kebunmu tumbuh';

  @override
  String get notificationPrefsIotTitle => 'Peringatan Koneksi IoT';

  @override
  String get notificationPrefsIotSubtitle =>
      'Notifikasi kalau pot pintarmu putus Bluetooth atau Wi-Fi';

  @override
  String get notificationPrefsFooterNote =>
      'Notifikasi disesuaikan dengan cuaca lokal dan sensor pintarmu biar tanaman tetap subur!';

  @override
  String get profileGreeting => 'Hai, Sam!';

  @override
  String get profileLevelLabel => 'Explorer Level 5';

  @override
  String get profilePlusBadge => 'SEEDLY Plus';

  @override
  String get profileUpsellTitle => 'Buka Keajaiban Lebih Banyak!';

  @override
  String get profileUpsellBody =>
      'Dapatkan 100+ chat AI tambahan tiap hari dan akses Konten Kebun Premium.';

  @override
  String get profileChatUsage => '10/10 chat gratis hari ini terpakai';

  @override
  String get profileUpgradeButton => 'Upgrade ke Plus';

  @override
  String get profileCancelAnytime => 'Batalkan kapan saja.';

  @override
  String get profileSettingsLabel => 'PENGATURAN';

  @override
  String get profileSettingsAccount => 'Akun';

  @override
  String get profileSettingsNotifications => 'Notifikasi';

  @override
  String get profileSettingsHelp => 'Bantuan & Dukungan';

  @override
  String get subscriptionMemberBadge => 'Member SEEDLY Plus';

  @override
  String get subscriptionHeroTitle => 'Naik Level Kebun Digitalmu';

  @override
  String get subscriptionHeroSubtitle =>
      'Buka semua kemungkinan untuk kebun digitalmu.';

  @override
  String get subscriptionPlanName => 'Paket Bulanan';

  @override
  String get subscriptionPlanPrice => 'Rp 49rb';

  @override
  String get subscriptionPlanPeriod => '/bln';

  @override
  String get subscriptionPlanNote =>
      'Batalkan kapan saja, tetap dapat perksnya';

  @override
  String get subscriptionPerkChatTitle => 'Chat AI Tanpa Batas';

  @override
  String get subscriptionPerkChatBody =>
      'Ngobrol dengan teman kebunmu 24/7 tanpa batas';

  @override
  String get subscriptionPerkContentTitle => 'Konten Kebun Premium';

  @override
  String get subscriptionPerkContentBody =>
      'Akses benih langka, tanah ajaib, dan efek cuaca cozy';

  @override
  String get subscriptionPerkDecorTitle => 'Pot & Dekor Eksklusif';

  @override
  String get subscriptionPerkDecorBody =>
      'Pot keramik custom, kristal, dan neon menyala';

  @override
  String get subscriptionPaymentMethodBadge => 'Midtrans QRIS';

  @override
  String get subscriptionTimerBadge => '04:58';

  @override
  String get subscriptionScanInstruction =>
      'Scan dengan app bank atau e-wallet apa saja:';

  @override
  String get subscriptionCheckStatusButton => 'Cek Status Pembayaran';

  @override
  String get subscriptionSimulateSuccessButton =>
      'Simulasikan Pembayaran Sukses';
}
