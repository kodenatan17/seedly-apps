import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id'),
  ];

  /// No description provided for @backButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backButtonLabel;

  /// No description provided for @closeButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeButtonLabel;

  /// No description provided for @progressFraction.
  ///
  /// In en, this message translates to:
  /// **'{current} / {total}'**
  String progressFraction(int current, int total);

  /// No description provided for @milestoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Milestone {number}'**
  String milestoneNumber(int number);

  /// No description provided for @milestonesCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Milestones'**
  String milestonesCount(int count);

  /// No description provided for @achievementsTitle.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievementsTitle;

  /// No description provided for @gardenMasteryTitle.
  ///
  /// In en, this message translates to:
  /// **'Garden Mastery'**
  String get gardenMasteryTitle;

  /// No description provided for @levelLabel.
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String levelLabel(int level);

  /// No description provided for @levelShort.
  ///
  /// In en, this message translates to:
  /// **'Lvl {level}'**
  String levelShort(int level);

  /// No description provided for @gardenMasterySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track your growing milestones and earn badges as your digital greenhouse flourishes.'**
  String get gardenMasterySubtitle;

  /// No description provided for @currentMedalLabel.
  ///
  /// In en, this message translates to:
  /// **'CURRENT MEDAL'**
  String get currentMedalLabel;

  /// No description provided for @masterGardenerName.
  ///
  /// In en, this message translates to:
  /// **'Master Gardener'**
  String get masterGardenerName;

  /// No description provided for @masterGardenerQuote.
  ///
  /// In en, this message translates to:
  /// **'\"You\'re becoming a great plant caretaker! Your plants are thriving with steady care.\"'**
  String get masterGardenerQuote;

  /// No description provided for @milestonesProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Milestones Progress'**
  String get milestonesProgressTitle;

  /// No description provided for @milestonesToNextRank.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 milestone to next rank} other{{count} milestones to next rank}}'**
  String milestonesToNextRank(int count);

  /// No description provided for @percentCompleted.
  ///
  /// In en, this message translates to:
  /// **'{percent}% completed'**
  String percentCompleted(int percent);

  /// No description provided for @nextUnlockLabel.
  ///
  /// In en, this message translates to:
  /// **'NEXT UNLOCK'**
  String get nextUnlockLabel;

  /// No description provided for @unlockedMedalsTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlocked Medals'**
  String get unlockedMedalsTitle;

  /// No description provided for @earnedCount.
  ///
  /// In en, this message translates to:
  /// **'{count} earned'**
  String earnedCount(int count);

  /// No description provided for @milestoneProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Milestone Progress'**
  String get milestoneProgressTitle;

  /// No description provided for @medalJourneyLabel.
  ///
  /// In en, this message translates to:
  /// **'Medal Journey'**
  String get medalJourneyLabel;

  /// No description provided for @medalJourneyDescription.
  ///
  /// In en, this message translates to:
  /// **'Grow your rank, unlock rare secrets, and tend your lush digital sanctuary!'**
  String get medalJourneyDescription;

  /// No description provided for @tierValue.
  ///
  /// In en, this message translates to:
  /// **'Tier {tier}'**
  String tierValue(int tier);

  /// No description provided for @currentRankLabel.
  ///
  /// In en, this message translates to:
  /// **'Current Rank'**
  String get currentRankLabel;

  /// No description provided for @milestonesLabel.
  ///
  /// In en, this message translates to:
  /// **'Milestones'**
  String get milestonesLabel;

  /// No description provided for @leftValue.
  ///
  /// In en, this message translates to:
  /// **'{count} Left'**
  String leftValue(int count);

  /// No description provided for @toNextTierLabel.
  ///
  /// In en, this message translates to:
  /// **'To Next Tier'**
  String get toNextTierLabel;

  /// No description provided for @tierCompleted.
  ///
  /// In en, this message translates to:
  /// **'Tier {tier} • Completed'**
  String tierCompleted(int tier);

  /// No description provided for @currentActiveTierLabel.
  ///
  /// In en, this message translates to:
  /// **'CURRENT ACTIVE TIER'**
  String get currentActiveTierLabel;

  /// No description provided for @rankLabel.
  ///
  /// In en, this message translates to:
  /// **'Rank {rank}'**
  String rankLabel(int rank);

  /// No description provided for @milestoneProgressLabel.
  ///
  /// In en, this message translates to:
  /// **'Milestone Progress'**
  String get milestoneProgressLabel;

  /// No description provided for @milestonesFraction.
  ///
  /// In en, this message translates to:
  /// **'{current} / {total} Milestones'**
  String milestonesFraction(int current, int total);

  /// No description provided for @nextMilestoneTargetLabel.
  ///
  /// In en, this message translates to:
  /// **'Next Milestone Target'**
  String get nextMilestoneTargetLabel;

  /// No description provided for @lockedMilestones.
  ///
  /// In en, this message translates to:
  /// **'Locked • {count} Milestones'**
  String lockedMilestones(int count);

  /// No description provided for @legendaryTier.
  ///
  /// In en, this message translates to:
  /// **'LEGENDARY TIER • {count} MILESTONES'**
  String legendaryTier(int count);

  /// No description provided for @keepRootsGrowingTitle.
  ///
  /// In en, this message translates to:
  /// **'Keep Your Roots Growing!'**
  String get keepRootsGrowingTitle;

  /// No description provided for @keepRootsGrowingDescription.
  ///
  /// In en, this message translates to:
  /// **'Complete today\'s daily gardening missions to earn rapid milestone points toward {nextTier}.'**
  String keepRootsGrowingDescription(String nextTier);

  /// No description provided for @viewTodaysMissions.
  ///
  /// In en, this message translates to:
  /// **'View Today\'s Missions'**
  String get viewTodaysMissions;

  /// No description provided for @tierSeedlingName.
  ///
  /// In en, this message translates to:
  /// **'Seedling'**
  String get tierSeedlingName;

  /// No description provided for @tierSeedlingDescription.
  ///
  /// In en, this message translates to:
  /// **'Every mighty oak begins as a tiny dream in the dirt. You planted your first root!'**
  String get tierSeedlingDescription;

  /// No description provided for @tierSproutName.
  ///
  /// In en, this message translates to:
  /// **'Sprout'**
  String get tierSproutName;

  /// No description provided for @tierSproutDescription.
  ///
  /// In en, this message translates to:
  /// **'First green leaves breaking the soil! You are learning the rhythm of daily sunshine and water.'**
  String get tierSproutDescription;

  /// No description provided for @tierGrowerName.
  ///
  /// In en, this message translates to:
  /// **'Grower'**
  String get tierGrowerName;

  /// No description provided for @tierGrowerDescription.
  ///
  /// In en, this message translates to:
  /// **'Stems are thickening and branches reaching out. Consistent care turns tiny sprouts into resilient stalks.'**
  String get tierGrowerDescription;

  /// No description provided for @tierNurturerName.
  ///
  /// In en, this message translates to:
  /// **'Nurturer'**
  String get tierNurturerName;

  /// No description provided for @tierNurturerDescription.
  ///
  /// In en, this message translates to:
  /// **'You know when plants are thirsty before they even ask. Your empathy brings vibrant vitality to the garden.'**
  String get tierNurturerDescription;

  /// No description provided for @tierGardenerName.
  ///
  /// In en, this message translates to:
  /// **'Gardener'**
  String get tierGardenerName;

  /// No description provided for @tierGardenerDescription.
  ///
  /// In en, this message translates to:
  /// **'You manage soil health, pruning schedules, and joyful blossoms with seasoned expertise!'**
  String get tierGardenerDescription;

  /// No description provided for @tierPlantKeeperName.
  ///
  /// In en, this message translates to:
  /// **'Plant Keeper'**
  String get tierPlantKeeperName;

  /// No description provided for @tierPlantKeeperDescription.
  ///
  /// In en, this message translates to:
  /// **'Guard rare botanical species and unlock legendary greenhouse upgrades.'**
  String get tierPlantKeeperDescription;

  /// No description provided for @plantKeeperUnlockDescription.
  ///
  /// In en, this message translates to:
  /// **'Unlock exotic seeds and fertilizer boosts!'**
  String get plantKeeperUnlockDescription;

  /// No description provided for @tierGardenKeeperName.
  ///
  /// In en, this message translates to:
  /// **'Garden Keeper'**
  String get tierGardenKeeperName;

  /// No description provided for @tierGardenKeeperDescription.
  ///
  /// In en, this message translates to:
  /// **'Master complex companion planting and balance seasonal microclimates.'**
  String get tierGardenKeeperDescription;

  /// No description provided for @tierGardenMasterName.
  ///
  /// In en, this message translates to:
  /// **'Garden Master'**
  String get tierGardenMasterName;

  /// No description provided for @tierGardenMasterDescription.
  ///
  /// In en, this message translates to:
  /// **'Design breathtaking ecosystem landscapes that hum with pollinator wildlife.'**
  String get tierGardenMasterDescription;

  /// No description provided for @tierGreenThumbName.
  ///
  /// In en, this message translates to:
  /// **'Green Thumb'**
  String get tierGreenThumbName;

  /// No description provided for @tierGreenThumbDescription.
  ///
  /// In en, this message translates to:
  /// **'A legendary touch where even dormant seeds spring instantly to joyful life.'**
  String get tierGreenThumbDescription;

  /// No description provided for @tierBloomMasterName.
  ///
  /// In en, this message translates to:
  /// **'Bloom Master'**
  String get tierBloomMasterName;

  /// No description provided for @tierBloomMasterDescription.
  ///
  /// In en, this message translates to:
  /// **'The ultimate pinnacle of sanctuary cultivation. Your sanctuary becomes a timeless wonderland of eternal spring!'**
  String get tierBloomMasterDescription;

  /// No description provided for @newAchievementsTitle.
  ///
  /// In en, this message translates to:
  /// **'New Achievements'**
  String get newAchievementsTitle;

  /// No description provided for @achievementUnlockedBadge.
  ///
  /// In en, this message translates to:
  /// **'Achievement Unlocked'**
  String get achievementUnlockedBadge;

  /// No description provided for @newMedalUnlockedTitle.
  ///
  /// In en, this message translates to:
  /// **'🎉 New Medal Unlocked!'**
  String get newMedalUnlockedTitle;

  /// No description provided for @plantKeeperSupremeName.
  ///
  /// In en, this message translates to:
  /// **'Plant Keeper Supreme'**
  String get plantKeeperSupremeName;

  /// No description provided for @unlockedMedalMessage.
  ///
  /// In en, this message translates to:
  /// **'Amazing work! {petName} and your digital garden are flourishing.'**
  String unlockedMedalMessage(String petName);

  /// No description provided for @milestonesCompletedLabel.
  ///
  /// In en, this message translates to:
  /// **'Milestones completed'**
  String get milestonesCompletedLabel;

  /// No description provided for @unlockedPerkLabel.
  ///
  /// In en, this message translates to:
  /// **'Unlocked Perk'**
  String get unlockedPerkLabel;

  /// No description provided for @goldenPotPerk.
  ///
  /// In en, this message translates to:
  /// **'Special Golden Pot Skin & +100 XP Bonus!'**
  String get goldenPotPerk;

  /// No description provided for @claimRewardAndContinue.
  ///
  /// In en, this message translates to:
  /// **'Claim Reward & Continue'**
  String get claimRewardAndContinue;

  /// No description provided for @viewInMedalJourney.
  ///
  /// In en, this message translates to:
  /// **'View in Medal Journey'**
  String get viewInMedalJourney;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
