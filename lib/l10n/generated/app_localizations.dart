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

  /// No description provided for @retryButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retryButtonLabel;

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

  /// No description provided for @welcomeGreeting.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}! 🌱'**
  String welcomeGreeting(String name);

  /// No description provided for @gardenWaitingTitle.
  ///
  /// In en, this message translates to:
  /// **'Your garden is waiting.'**
  String get gardenWaitingTitle;

  /// No description provided for @gardenWaitingDescription.
  ///
  /// In en, this message translates to:
  /// **'Connect a physical Seedly Smart Pot or start growing your first digital seed companion today!'**
  String get gardenWaitingDescription;

  /// No description provided for @addFirstPlantButton.
  ///
  /// In en, this message translates to:
  /// **'Add My First Plant'**
  String get addFirstPlantButton;

  /// No description provided for @scanSmartPotButton.
  ///
  /// In en, this message translates to:
  /// **'Scan Smart Pot QR Code'**
  String get scanSmartPotButton;

  /// No description provided for @zeroStressTitle.
  ///
  /// In en, this message translates to:
  /// **'Zero stress, 100% fun!'**
  String get zeroStressTitle;

  /// No description provided for @zeroStressDescription.
  ///
  /// In en, this message translates to:
  /// **'We\'ll guide you step by step with gentle watering tips.'**
  String get zeroStressDescription;

  /// No description provided for @readyBadgeLabel.
  ///
  /// In en, this message translates to:
  /// **'Ready!'**
  String get readyBadgeLabel;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navGarden.
  ///
  /// In en, this message translates to:
  /// **'Garden'**
  String get navGarden;

  /// No description provided for @navMissions.
  ///
  /// In en, this message translates to:
  /// **'Missions'**
  String get navMissions;

  /// No description provided for @navChat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get navChat;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @gardenHasPlantsTitle.
  ///
  /// In en, this message translates to:
  /// **'Your garden is growing!'**
  String get gardenHasPlantsTitle;

  /// No description provided for @gardenHasPlantsDescription.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 plant across your containers.} other{{count} plants across your containers.}}'**
  String gardenHasPlantsDescription(int count);

  /// No description provided for @viewMyPlantsButton.
  ///
  /// In en, this message translates to:
  /// **'View My Plants'**
  String get viewMyPlantsButton;

  /// No description provided for @addNewSeedTitle.
  ///
  /// In en, this message translates to:
  /// **'Add New Seed'**
  String get addNewSeedTitle;

  /// No description provided for @addSeedQuestion.
  ///
  /// In en, this message translates to:
  /// **'How would you like to introduce your new plant to the garden?'**
  String get addSeedQuestion;

  /// No description provided for @scanQrMethodTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan QR'**
  String get scanQrMethodTitle;

  /// No description provided for @scanQrMethodDescription.
  ///
  /// In en, this message translates to:
  /// **'Fastest way if you have a Seedly starter kit.'**
  String get scanQrMethodDescription;

  /// No description provided for @enterCodeMethodTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter SEEDLY Code'**
  String get enterCodeMethodTitle;

  /// No description provided for @enterCodeMethodDescription.
  ///
  /// In en, this message translates to:
  /// **'Type the 6-digit code on your seed packet.'**
  String get enterCodeMethodDescription;

  /// No description provided for @browseCatalogueMethodTitle.
  ///
  /// In en, this message translates to:
  /// **'Browse Catalogue'**
  String get browseCatalogueMethodTitle;

  /// No description provided for @browseCatalogueMethodDescription.
  ///
  /// In en, this message translates to:
  /// **'Adding a plant you bought somewhere else?'**
  String get browseCatalogueMethodDescription;

  /// No description provided for @confirmSmartPotButton.
  ///
  /// In en, this message translates to:
  /// **'Confirm Smart Pot'**
  String get confirmSmartPotButton;

  /// No description provided for @iotSyncFooterNote.
  ///
  /// In en, this message translates to:
  /// **'Smart Pot syncs with SEEDLY OS over BLE 5.2'**
  String get iotSyncFooterNote;

  /// No description provided for @smartPotReadyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your {potName} is ready'**
  String smartPotReadyTitle(String potName);

  /// No description provided for @smartPotReadyDescription.
  ///
  /// In en, this message translates to:
  /// **'Your Smart Pot is paired and ready to grow. Place your seeds to begin the journey.'**
  String get smartPotReadyDescription;

  /// No description provided for @scanQrCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan QR Code'**
  String get scanQrCodeTitle;

  /// No description provided for @scanSeedCodeHeadline.
  ///
  /// In en, this message translates to:
  /// **'Scan your SEEDLY seed code 🌱'**
  String get scanSeedCodeHeadline;

  /// No description provided for @scanSeedCodeDescription.
  ///
  /// In en, this message translates to:
  /// **'Hold the QR code inside the frame.'**
  String get scanSeedCodeDescription;

  /// No description provided for @tapToScanHint.
  ///
  /// In en, this message translates to:
  /// **'Tap to scan the Plant QR Code'**
  String get tapToScanHint;

  /// No description provided for @enterCodeManuallyButton.
  ///
  /// In en, this message translates to:
  /// **'Enter Code Manually'**
  String get enterCodeManuallyButton;

  /// No description provided for @cameraPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Camera access is needed to scan a QR code.'**
  String get cameraPermissionDenied;

  /// No description provided for @addPlantTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Plant'**
  String get addPlantTitle;

  /// No description provided for @enterSeedlyCodeHeadline.
  ///
  /// In en, this message translates to:
  /// **'Enter SEEDLY Code'**
  String get enterSeedlyCodeHeadline;

  /// No description provided for @enterSeedlyCodeDescription.
  ///
  /// In en, this message translates to:
  /// **'Find the 10-digit code on the bottom of your sensor kit or on the instruction manual.'**
  String get enterSeedlyCodeDescription;

  /// No description provided for @seedCodeHint.
  ///
  /// In en, this message translates to:
  /// **'XXXXX-XXXXX'**
  String get seedCodeHint;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @whereFindCodeLink.
  ///
  /// In en, this message translates to:
  /// **'Where do I find my code?'**
  String get whereFindCodeLink;

  /// No description provided for @invalidSeedCodeError.
  ///
  /// In en, this message translates to:
  /// **'Enter the 10-digit code exactly as printed.'**
  String get invalidSeedCodeError;

  /// No description provided for @seedCatalogueTitle.
  ///
  /// In en, this message translates to:
  /// **'Seed Catalogue'**
  String get seedCatalogueTitle;

  /// No description provided for @seedCatalogueDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose a seed to begin its journey. Each plant comes with tailored care routines to help it thrive in your Seedly environment.'**
  String get seedCatalogueDescription;

  /// No description provided for @addSeedButton.
  ///
  /// In en, this message translates to:
  /// **'Add Seed'**
  String get addSeedButton;

  /// No description provided for @inactiveSpeciesBadge.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get inactiveSpeciesBadge;

  /// No description provided for @expectedJourneyTitle.
  ///
  /// In en, this message translates to:
  /// **'Expected Journey'**
  String get expectedJourneyTitle;

  /// No description provided for @whereWillYouGrow.
  ///
  /// In en, this message translates to:
  /// **'Where will you grow {name}?'**
  String whereWillYouGrow(String name);

  /// No description provided for @confirmPlantingButton.
  ///
  /// In en, this message translates to:
  /// **'Confirm Planting'**
  String get confirmPlantingButton;

  /// No description provided for @containerReadyStatus.
  ///
  /// In en, this message translates to:
  /// **'READY'**
  String get containerReadyStatus;

  /// No description provided for @containerFullStatus.
  ///
  /// In en, this message translates to:
  /// **'Garden is full'**
  String get containerFullStatus;

  /// No description provided for @smartPotLabel.
  ///
  /// In en, this message translates to:
  /// **'Smart Pot {letter}'**
  String smartPotLabel(String letter);

  /// No description provided for @directPlantSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Direct Plant'**
  String get directPlantSubtitle;

  /// No description provided for @kitKeywordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{kitName} Kit'**
  String kitKeywordSubtitle(String kitName);

  /// No description provided for @adventureSuffixTitle.
  ///
  /// In en, this message translates to:
  /// **'{speciesName} Adventure'**
  String adventureSuffixTitle(String speciesName);

  /// No description provided for @plantJoinedTitle.
  ///
  /// In en, this message translates to:
  /// **'{name} has joined your garden! 🌱'**
  String plantJoinedTitle(String name);

  /// No description provided for @growthJourneyBeginsToday.
  ///
  /// In en, this message translates to:
  /// **'Your growth journey begins today.'**
  String get growthJourneyBeginsToday;

  /// No description provided for @daySproutingLabel.
  ///
  /// In en, this message translates to:
  /// **'Day {day}: Sprouting'**
  String daySproutingLabel(int day);

  /// No description provided for @firstQuestUnlockedTitle.
  ///
  /// In en, this message translates to:
  /// **'First Quest Unlocked!'**
  String get firstQuestUnlockedTitle;

  /// No description provided for @firstQuestUnlockedDescription.
  ///
  /// In en, this message translates to:
  /// **'Take a photo of your new plant to start its timeline.'**
  String get firstQuestUnlockedDescription;

  /// No description provided for @goToMyGardenButton.
  ///
  /// In en, this message translates to:
  /// **'Go to My Garden'**
  String get goToMyGardenButton;

  /// No description provided for @authWelcomeBackTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back 🌱'**
  String get authWelcomeBackTitle;

  /// No description provided for @authWelcomeBackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Log in to see how Tommy and your garden are thriving today!'**
  String get authWelcomeBackSubtitle;

  /// No description provided for @authEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get authEmailLabel;

  /// No description provided for @authPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPasswordLabel;

  /// No description provided for @authEmailHint.
  ///
  /// In en, this message translates to:
  /// **'alex.grower@example.com'**
  String get authEmailHint;

  /// No description provided for @authPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'GardenSecret123'**
  String get authPasswordHint;

  /// No description provided for @authMinCharsHint.
  ///
  /// In en, this message translates to:
  /// **'min 8 chars'**
  String get authMinCharsHint;

  /// No description provided for @authRememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get authRememberMe;

  /// No description provided for @authForgotPasswordLink.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get authForgotPasswordLink;

  /// No description provided for @authLogInButton.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get authLogInButton;

  /// No description provided for @authOrDivider.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get authOrDivider;

  /// No description provided for @authSignInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get authSignInWithGoogle;

  /// No description provided for @authNewToSeedly.
  ///
  /// In en, this message translates to:
  /// **'New to Seedly?'**
  String get authNewToSeedly;

  /// No description provided for @authCreateAnAccountLink.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get authCreateAnAccountLink;

  /// No description provided for @authRegisterTitle.
  ///
  /// In en, this message translates to:
  /// **'Create your SEEDLY account 🌱'**
  String get authRegisterTitle;

  /// No description provided for @authRegisterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Save your plants, track real-time telemetry, and earn garden medals together.'**
  String get authRegisterSubtitle;

  /// No description provided for @authRegisterEmailHint.
  ///
  /// In en, this message translates to:
  /// **'nurul.gardener@gmail.com'**
  String get authRegisterEmailHint;

  /// No description provided for @authConfirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get authConfirmPasswordLabel;

  /// No description provided for @authWeakPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Weak password'**
  String get authWeakPasswordLabel;

  /// No description provided for @authMediumPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Medium password'**
  String get authMediumPasswordLabel;

  /// No description provided for @authStrongPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Strong password'**
  String get authStrongPasswordLabel;

  /// No description provided for @authPasswordLevelLabel.
  ///
  /// In en, this message translates to:
  /// **'Lvl. {level} {tier}'**
  String authPasswordLevelLabel(int level, String tier);

  /// No description provided for @authPasswordTierSeed.
  ///
  /// In en, this message translates to:
  /// **'Seed'**
  String get authPasswordTierSeed;

  /// No description provided for @authPasswordTierSprout.
  ///
  /// In en, this message translates to:
  /// **'Sprout'**
  String get authPasswordTierSprout;

  /// No description provided for @authPasswordTierBloom.
  ///
  /// In en, this message translates to:
  /// **'Bloom'**
  String get authPasswordTierBloom;

  /// No description provided for @authTermsAgreement.
  ///
  /// In en, this message translates to:
  /// **'I agree to Seedly Family Terms and Child Safety Privacy Policy'**
  String get authTermsAgreement;

  /// No description provided for @authCreateAccountButton.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get authCreateAccountButton;

  /// No description provided for @authEmailRequiredError.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get authEmailRequiredError;

  /// No description provided for @authPasswordMinLengthError.
  ///
  /// In en, this message translates to:
  /// **'Use at least 8 characters'**
  String get authPasswordMinLengthError;

  /// No description provided for @authPasswordMismatchError.
  ///
  /// In en, this message translates to:
  /// **'Passwords don\'t match'**
  String get authPasswordMismatchError;

  /// No description provided for @authOrRegisterWith.
  ///
  /// In en, this message translates to:
  /// **'or register with'**
  String get authOrRegisterWith;

  /// No description provided for @authContinueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get authContinueWithGoogle;

  /// No description provided for @authPrivacyNote.
  ///
  /// In en, this message translates to:
  /// **'We only use your account to preserve your smart container pairings, care streaks, and botany certificates.'**
  String get authPrivacyNote;

  /// No description provided for @authAlreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get authAlreadyHaveAccount;

  /// No description provided for @authLogInLink.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get authLogInLink;

  /// No description provided for @authStepProgress.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String authStepProgress(int current, int total);

  /// No description provided for @authCheckEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Check your email 📩'**
  String get authCheckEmailTitle;

  /// No description provided for @authCheckEmailSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We sent a magical confirmation link to:'**
  String get authCheckEmailSubtitle;

  /// No description provided for @authCheckEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Tap the link in your inbox to sprout your account!'**
  String get authCheckEmailHint;

  /// No description provided for @authQuickStepsTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick 3-step sprout'**
  String get authQuickStepsTitle;

  /// No description provided for @authEasyPeasyBadge.
  ///
  /// In en, this message translates to:
  /// **'EASY PEASY'**
  String get authEasyPeasyBadge;

  /// No description provided for @authOpenEmailAppTitle.
  ///
  /// In en, this message translates to:
  /// **'Open email app'**
  String get authOpenEmailAppTitle;

  /// No description provided for @authOpenEmailAppDescription.
  ///
  /// In en, this message translates to:
  /// **'Find message from Seedly Garden'**
  String get authOpenEmailAppDescription;

  /// No description provided for @authVerifyAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Tap \'Verify my Seedly Account\''**
  String get authVerifyAccountTitle;

  /// No description provided for @authVerifyAccountDescription.
  ///
  /// In en, this message translates to:
  /// **'Look for the big green button inside'**
  String get authVerifyAccountDescription;

  /// No description provided for @authReturnToPlantTitle.
  ///
  /// In en, this message translates to:
  /// **'Return here to start planting'**
  String get authReturnToPlantTitle;

  /// No description provided for @authReturnToPlantDescription.
  ///
  /// In en, this message translates to:
  /// **'Your cozy seedling plot is all prepped'**
  String get authReturnToPlantDescription;

  /// No description provided for @authOpenMailAppButton.
  ///
  /// In en, this message translates to:
  /// **'Open Mail App'**
  String get authOpenMailAppButton;

  /// No description provided for @authResendLinkCountdown.
  ///
  /// In en, this message translates to:
  /// **'Resend link ({seconds}s)'**
  String authResendLinkCountdown(int seconds);

  /// No description provided for @authResendLinkButton.
  ///
  /// In en, this message translates to:
  /// **'Resend link'**
  String get authResendLinkButton;

  /// No description provided for @authChangeEmailLink.
  ///
  /// In en, this message translates to:
  /// **'Wrong email address? Change email'**
  String get authChangeEmailLink;

  /// No description provided for @authSpamNote.
  ///
  /// In en, this message translates to:
  /// **'Can\'t find the email? Don\'t forget to check your spam or promotions folder. Sometimes baby sprouts get tucked into quiet corners!'**
  String get authSpamNote;

  /// No description provided for @authResetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Your Password 🔑'**
  String get authResetPasswordTitle;

  /// No description provided for @authResetPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your registered email and we\'ll send you safe instructions to reset your garden access.'**
  String get authResetPasswordSubtitle;

  /// No description provided for @authAccountEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Your Account Email'**
  String get authAccountEmailLabel;

  /// No description provided for @authAccountEmailBadge.
  ///
  /// In en, this message translates to:
  /// **'Grown-up or Guardian'**
  String get authAccountEmailBadge;

  /// No description provided for @authAccountEmailHint.
  ///
  /// In en, this message translates to:
  /// **'hello@familygarden.com'**
  String get authAccountEmailHint;

  /// No description provided for @authSendResetLinkButton.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get authSendResetLinkButton;

  /// No description provided for @authEncryptedKidSafe.
  ///
  /// In en, this message translates to:
  /// **'Encrypted & Kid-Safe'**
  String get authEncryptedKidSafe;

  /// No description provided for @authNeedHandTitle.
  ///
  /// In en, this message translates to:
  /// **'Need a hand right now?'**
  String get authNeedHandTitle;

  /// No description provided for @authNeedHandDescription.
  ///
  /// In en, this message translates to:
  /// **'Contact our friendly family care guides anytime at {email}'**
  String authNeedHandDescription(String email);

  /// No description provided for @authSupportEmail.
  ///
  /// In en, this message translates to:
  /// **'support@seedly.app'**
  String get authSupportEmail;

  /// No description provided for @authBackToLogIn.
  ///
  /// In en, this message translates to:
  /// **'Back to Log In'**
  String get authBackToLogIn;

  /// No description provided for @authOnboardingHeroTitle.
  ///
  /// In en, this message translates to:
  /// **'Learn, Earn & Flourish 🌿'**
  String get authOnboardingHeroTitle;

  /// No description provided for @authOnboardingHeroDescription.
  ///
  /// In en, this message translates to:
  /// **'Complete fun botany missions, ask Seedly AI anything, and unlock 10 progressive medals as your real greenhouse thrives.'**
  String get authOnboardingHeroDescription;

  /// No description provided for @authGardenMasterBadge.
  ///
  /// In en, this message translates to:
  /// **'Garden Master'**
  String get authGardenMasterBadge;

  /// No description provided for @authBotanyQuickChecksTitle.
  ///
  /// In en, this message translates to:
  /// **'Botany Quick Checks'**
  String get authBotanyQuickChecksTitle;

  /// No description provided for @authBotanyQuickChecksDescription.
  ///
  /// In en, this message translates to:
  /// **'Daily 60-second micro-missions'**
  String get authBotanyQuickChecksDescription;

  /// No description provided for @authXpBadge.
  ///
  /// In en, this message translates to:
  /// **'+10 XP'**
  String get authXpBadge;

  /// No description provided for @authMedalJourneyTitle.
  ///
  /// In en, this message translates to:
  /// **'10 Medal Mastery Journey'**
  String get authMedalJourneyTitle;

  /// No description provided for @authMedalJourneySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Seedling to Bloom Master'**
  String get authMedalJourneySubtitle;

  /// No description provided for @authMedalJourneyFraction.
  ///
  /// In en, this message translates to:
  /// **'{current} / {total}'**
  String authMedalJourneyFraction(int current, int total);

  /// No description provided for @authPlantCompanionTitle.
  ///
  /// In en, this message translates to:
  /// **'Intelligent Plant Companion'**
  String get authPlantCompanionTitle;

  /// No description provided for @authPlantCompanionDescription.
  ///
  /// In en, this message translates to:
  /// **'24/7 kid-friendly botany chat'**
  String get authPlantCompanionDescription;

  /// No description provided for @authGetStartedButton.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get authGetStartedButton;

  /// No description provided for @accountDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Account Detail'**
  String get accountDetailTitle;

  /// No description provided for @accountDetailMemberSince.
  ///
  /// In en, this message translates to:
  /// **'Member Since: March 2023'**
  String get accountDetailMemberSince;

  /// No description provided for @accountDetailLevelBadge.
  ///
  /// In en, this message translates to:
  /// **'Level 4 Botanist'**
  String get accountDetailLevelBadge;

  /// No description provided for @accountDetailStreakBadge.
  ///
  /// In en, this message translates to:
  /// **'12 Streaks'**
  String get accountDetailStreakBadge;

  /// No description provided for @accountDetailPersonalInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get accountDetailPersonalInfoTitle;

  /// No description provided for @accountDetailDisplayNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Display Name'**
  String get accountDetailDisplayNameLabel;

  /// No description provided for @accountDetailDisplayNameHint.
  ///
  /// In en, this message translates to:
  /// **'Sam D.'**
  String get accountDetailDisplayNameHint;

  /// No description provided for @accountDetailEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get accountDetailEmailLabel;

  /// No description provided for @accountDetailEmailHint.
  ///
  /// In en, this message translates to:
  /// **'sam.gardener@example.com'**
  String get accountDetailEmailHint;

  /// No description provided for @accountDetailUpdateButton.
  ///
  /// In en, this message translates to:
  /// **'Update Profile Details'**
  String get accountDetailUpdateButton;

  /// No description provided for @accountDetailPotsTitle.
  ///
  /// In en, this message translates to:
  /// **'Associated Smart Pots'**
  String get accountDetailPotsTitle;

  /// No description provided for @accountDetailAddNewLink.
  ///
  /// In en, this message translates to:
  /// **'+ Add New'**
  String get accountDetailAddNewLink;

  /// No description provided for @accountDetailPotAName.
  ///
  /// In en, this message translates to:
  /// **'Smart Pot A'**
  String get accountDetailPotAName;

  /// No description provided for @accountDetailPotASpecies.
  ///
  /// In en, this message translates to:
  /// **'Monstera Deliciosa'**
  String get accountDetailPotASpecies;

  /// No description provided for @accountDetailPotASoil.
  ///
  /// In en, this message translates to:
  /// **'• Soil: 68% • Ideal'**
  String get accountDetailPotASoil;

  /// No description provided for @accountDetailPotBName.
  ///
  /// In en, this message translates to:
  /// **'Smart Pot B'**
  String get accountDetailPotBName;

  /// No description provided for @accountDetailPotBSpecies.
  ///
  /// In en, this message translates to:
  /// **'Fiddle Leaf Fig'**
  String get accountDetailPotBSpecies;

  /// No description provided for @accountDetailPotBSoil.
  ///
  /// In en, this message translates to:
  /// **'• Temp: 24°C • Stable'**
  String get accountDetailPotBSoil;

  /// No description provided for @accountDetailFooterNote.
  ///
  /// In en, this message translates to:
  /// **'Your plants are thriving under your care!'**
  String get accountDetailFooterNote;

  /// No description provided for @helpSupportBanner.
  ///
  /// In en, this message translates to:
  /// **'We\'re here to help, little sprout!'**
  String get helpSupportBanner;

  /// No description provided for @helpSupportTitle.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpSupportTitle;

  /// No description provided for @helpSupportSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find quick answers, chat with our master gardeners, or explore helpful guides.'**
  String get helpSupportSubtitle;

  /// No description provided for @helpSupportSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search FAQs (e.g., smart pot, watering)'**
  String get helpSupportSearchHint;

  /// No description provided for @helpSupportOnlineBadge.
  ///
  /// In en, this message translates to:
  /// **'Gardeners Online'**
  String get helpSupportOnlineBadge;

  /// No description provided for @helpSupportChatTitle.
  ///
  /// In en, this message translates to:
  /// **'Chat with Support'**
  String get helpSupportChatTitle;

  /// No description provided for @helpSupportChatSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Got a tricky question? We reply in minutes!'**
  String get helpSupportChatSubtitle;

  /// No description provided for @helpSupportChatButton.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get helpSupportChatButton;

  /// No description provided for @helpSupportFaqTitle.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get helpSupportFaqTitle;

  /// No description provided for @helpSupportViewAllLink.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get helpSupportViewAllLink;

  /// No description provided for @helpSupportFaqQ1.
  ///
  /// In en, this message translates to:
  /// **'How to pair smart pot?'**
  String get helpSupportFaqQ1;

  /// No description provided for @helpSupportFaqA1.
  ///
  /// In en, this message translates to:
  /// **'Open the Seedly app, tap Add Smart Pot, and hold the pairing button for 3 seconds until the LED blinks blue.'**
  String get helpSupportFaqA1;

  /// No description provided for @helpSupportFaqQ2.
  ///
  /// In en, this message translates to:
  /// **'Watering schedule guide'**
  String get helpSupportFaqQ2;

  /// No description provided for @helpSupportFaqA2.
  ///
  /// In en, this message translates to:
  /// **'Most houseplants like a drink every 5-7 days; check the soil moisture reading before adding water.'**
  String get helpSupportFaqA2;

  /// No description provided for @helpSupportFaqQ3.
  ///
  /// In en, this message translates to:
  /// **'Subscription renewal & billing'**
  String get helpSupportFaqQ3;

  /// No description provided for @helpSupportFaqA3.
  ///
  /// In en, this message translates to:
  /// **'Plus renews monthly via your chosen payment method; cancel anytime from the Subscription screen.'**
  String get helpSupportFaqA3;

  /// No description provided for @helpSupportFaqQ4.
  ///
  /// In en, this message translates to:
  /// **'What if my plant isn\'t growing?'**
  String get helpSupportFaqQ4;

  /// No description provided for @helpSupportFaqA4.
  ///
  /// In en, this message translates to:
  /// **'Check light and water levels first — our AI chat can diagnose common issues from a photo.'**
  String get helpSupportFaqA4;

  /// No description provided for @helpSupportGuidesTitle.
  ///
  /// In en, this message translates to:
  /// **'User Guides & Manuals'**
  String get helpSupportGuidesTitle;

  /// No description provided for @helpSupportGuide1Title.
  ///
  /// In en, this message translates to:
  /// **'Quick Start Guide'**
  String get helpSupportGuide1Title;

  /// No description provided for @helpSupportGuide1Meta.
  ///
  /// In en, this message translates to:
  /// **'PDF • 2.4 MB'**
  String get helpSupportGuide1Meta;

  /// No description provided for @helpSupportGuide2Title.
  ///
  /// In en, this message translates to:
  /// **'Smart Pot Handbook'**
  String get helpSupportGuide2Title;

  /// No description provided for @helpSupportGuide2Meta.
  ///
  /// In en, this message translates to:
  /// **'PDF • 4.1 MB'**
  String get helpSupportGuide2Meta;

  /// No description provided for @helpSupportFactTitle.
  ///
  /// In en, this message translates to:
  /// **'Did you know?'**
  String get helpSupportFactTitle;

  /// No description provided for @helpSupportFactBody.
  ///
  /// In en, this message translates to:
  /// **'Talking to your plants helps them absorb positive vibes! (And carbon dioxide).'**
  String get helpSupportFactBody;

  /// No description provided for @notificationPrefsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationPrefsTitle;

  /// No description provided for @notificationPrefsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose what pings your cozy little garden'**
  String get notificationPrefsSubtitle;

  /// No description provided for @notificationPrefsGroupPlantCare.
  ///
  /// In en, this message translates to:
  /// **'Plant Care'**
  String get notificationPrefsGroupPlantCare;

  /// No description provided for @notificationPrefsGroupMissions.
  ///
  /// In en, this message translates to:
  /// **'Missions & Summary'**
  String get notificationPrefsGroupMissions;

  /// No description provided for @notificationPrefsGroupHardware.
  ///
  /// In en, this message translates to:
  /// **'Smart Pot & Hardware'**
  String get notificationPrefsGroupHardware;

  /// No description provided for @notificationPrefsWateringTitle.
  ///
  /// In en, this message translates to:
  /// **'Watering & Thirst'**
  String get notificationPrefsWateringTitle;

  /// No description provided for @notificationPrefsWateringSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Friendly pings when your green buddies need a drink'**
  String get notificationPrefsWateringSubtitle;

  /// No description provided for @notificationPrefsSunlightTitle.
  ///
  /// In en, this message translates to:
  /// **'Sunlight Spotting'**
  String get notificationPrefsSunlightTitle;

  /// No description provided for @notificationPrefsSunlightSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Reminders to move plants to sunny windows'**
  String get notificationPrefsSunlightSubtitle;

  /// No description provided for @notificationPrefsDailyMissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Mission Alerts'**
  String get notificationPrefsDailyMissionTitle;

  /// No description provided for @notificationPrefsDailyMissionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Never miss your daily streak rewards and quests'**
  String get notificationPrefsDailyMissionSubtitle;

  /// No description provided for @notificationPrefsWeeklyGrowthTitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly Growth Sun'**
  String get notificationPrefsWeeklyGrowthTitle;

  /// No description provided for @notificationPrefsWeeklyGrowthSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A sweet recap of how much your garden grew'**
  String get notificationPrefsWeeklyGrowthSubtitle;

  /// No description provided for @notificationPrefsIotTitle.
  ///
  /// In en, this message translates to:
  /// **'IoT Connection Warnings'**
  String get notificationPrefsIotTitle;

  /// No description provided for @notificationPrefsIotSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Alerts if your smart pot loses Bluetooth or Wi-Fi'**
  String get notificationPrefsIotSubtitle;

  /// No description provided for @notificationPrefsFooterNote.
  ///
  /// In en, this message translates to:
  /// **'Notifications are tailored to your local weather and smart sensor telemetry to keep your plants thriving!'**
  String get notificationPrefsFooterNote;

  /// No description provided for @profileGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hi, Sam!'**
  String get profileGreeting;

  /// No description provided for @profileLevelLabel.
  ///
  /// In en, this message translates to:
  /// **'Explorer Level 5'**
  String get profileLevelLabel;

  /// No description provided for @profilePlusBadge.
  ///
  /// In en, this message translates to:
  /// **'SEEDLY Plus'**
  String get profilePlusBadge;

  /// No description provided for @profileUpsellTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock More Magic!'**
  String get profileUpsellTitle;

  /// No description provided for @profileUpsellBody.
  ///
  /// In en, this message translates to:
  /// **'Get 100+ more AI chats each day and access to Premium Garden Content.'**
  String get profileUpsellBody;

  /// No description provided for @profileChatUsage.
  ///
  /// In en, this message translates to:
  /// **'10/10 free chats used today'**
  String get profileChatUsage;

  /// No description provided for @profileUpgradeButton.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to Plus'**
  String get profileUpgradeButton;

  /// No description provided for @profileCancelAnytime.
  ///
  /// In en, this message translates to:
  /// **'Cancel anytime.'**
  String get profileCancelAnytime;

  /// No description provided for @profileSettingsLabel.
  ///
  /// In en, this message translates to:
  /// **'SETTINGS'**
  String get profileSettingsLabel;

  /// No description provided for @profileSettingsAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get profileSettingsAccount;

  /// No description provided for @profileSettingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get profileSettingsNotifications;

  /// No description provided for @profileSettingsHelp.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get profileSettingsHelp;

  /// No description provided for @subscriptionMemberBadge.
  ///
  /// In en, this message translates to:
  /// **'SEEDLY Plus Member'**
  String get subscriptionMemberBadge;

  /// No description provided for @subscriptionHeroTitle.
  ///
  /// In en, this message translates to:
  /// **'Level Up Your Sanctuary'**
  String get subscriptionHeroTitle;

  /// No description provided for @subscriptionHeroSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock infinite possibilities for your digital garden.'**
  String get subscriptionHeroSubtitle;

  /// No description provided for @subscriptionPlanName.
  ///
  /// In en, this message translates to:
  /// **'Monthly Pass'**
  String get subscriptionPlanName;

  /// No description provided for @subscriptionPlanPrice.
  ///
  /// In en, this message translates to:
  /// **'Rp 49k'**
  String get subscriptionPlanPrice;

  /// No description provided for @subscriptionPlanPeriod.
  ///
  /// In en, this message translates to:
  /// **'/mo'**
  String get subscriptionPlanPeriod;

  /// No description provided for @subscriptionPlanNote.
  ///
  /// In en, this message translates to:
  /// **'Cancel anytime, keep your perks'**
  String get subscriptionPlanNote;

  /// No description provided for @subscriptionPerkChatTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlimited AI Chats'**
  String get subscriptionPerkChatTitle;

  /// No description provided for @subscriptionPerkChatBody.
  ///
  /// In en, this message translates to:
  /// **'Chat with your garden buddies 24/7 without limits'**
  String get subscriptionPerkChatBody;

  /// No description provided for @subscriptionPerkContentTitle.
  ///
  /// In en, this message translates to:
  /// **'Premium Garden Content'**
  String get subscriptionPerkContentTitle;

  /// No description provided for @subscriptionPerkContentBody.
  ///
  /// In en, this message translates to:
  /// **'Access rare seeds, magical soils, and cozy weather fx'**
  String get subscriptionPerkContentBody;

  /// No description provided for @subscriptionPerkDecorTitle.
  ///
  /// In en, this message translates to:
  /// **'Exclusive Pots & Decor'**
  String get subscriptionPerkDecorTitle;

  /// No description provided for @subscriptionPerkDecorBody.
  ///
  /// In en, this message translates to:
  /// **'Custom ceramic, crystal, and glowing neon planters'**
  String get subscriptionPerkDecorBody;

  /// No description provided for @subscriptionPaymentMethodBadge.
  ///
  /// In en, this message translates to:
  /// **'Midtrans QRIS'**
  String get subscriptionPaymentMethodBadge;

  /// No description provided for @subscriptionTimerBadge.
  ///
  /// In en, this message translates to:
  /// **'04:58'**
  String get subscriptionTimerBadge;

  /// No description provided for @subscriptionScanInstruction.
  ///
  /// In en, this message translates to:
  /// **'Scan with any banking app or e-wallet:'**
  String get subscriptionScanInstruction;

  /// No description provided for @subscriptionCheckStatusButton.
  ///
  /// In en, this message translates to:
  /// **'Check Payment Status'**
  String get subscriptionCheckStatusButton;

  /// No description provided for @subscriptionSimulateSuccessButton.
  ///
  /// In en, this message translates to:
  /// **'Simulate Successful Payment'**
  String get subscriptionSimulateSuccessButton;
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
