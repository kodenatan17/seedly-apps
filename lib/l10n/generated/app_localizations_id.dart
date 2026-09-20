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
}
