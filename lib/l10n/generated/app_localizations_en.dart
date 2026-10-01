// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get backButtonLabel => 'Back';

  @override
  String get closeButtonLabel => 'Close';

  @override
  String get retryButtonLabel => 'Retry';

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
    return '$count Milestones';
  }

  @override
  String get achievementsTitle => 'Achievements';

  @override
  String get gardenMasteryTitle => 'Garden Mastery';

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
      'Track your growing milestones and earn badges as your digital greenhouse flourishes.';

  @override
  String get currentMedalLabel => 'CURRENT MEDAL';

  @override
  String get masterGardenerName => 'Master Gardener';

  @override
  String get masterGardenerQuote =>
      '\"You\'re becoming a great plant caretaker! Your plants are thriving with steady care.\"';

  @override
  String get milestonesProgressTitle => 'Milestones Progress';

  @override
  String milestonesToNextRank(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count milestones to next rank',
      one: '1 milestone to next rank',
    );
    return '$_temp0';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% completed';
  }

  @override
  String get nextUnlockLabel => 'NEXT UNLOCK';

  @override
  String get unlockedMedalsTitle => 'Unlocked Medals';

  @override
  String earnedCount(int count) {
    return '$count earned';
  }

  @override
  String get milestoneProgressTitle => 'Milestone Progress';

  @override
  String get medalJourneyLabel => 'Medal Journey';

  @override
  String get medalJourneyDescription =>
      'Grow your rank, unlock rare secrets, and tend your lush digital sanctuary!';

  @override
  String tierValue(int tier) {
    return 'Tier $tier';
  }

  @override
  String get currentRankLabel => 'Current Rank';

  @override
  String get milestonesLabel => 'Milestones';

  @override
  String leftValue(int count) {
    return '$count Left';
  }

  @override
  String get toNextTierLabel => 'To Next Tier';

  @override
  String tierCompleted(int tier) {
    return 'Tier $tier • Completed';
  }

  @override
  String get currentActiveTierLabel => 'CURRENT ACTIVE TIER';

  @override
  String rankLabel(int rank) {
    return 'Rank $rank';
  }

  @override
  String get milestoneProgressLabel => 'Milestone Progress';

  @override
  String milestonesFraction(int current, int total) {
    return '$current / $total Milestones';
  }

  @override
  String get nextMilestoneTargetLabel => 'Next Milestone Target';

  @override
  String lockedMilestones(int count) {
    return 'Locked • $count Milestones';
  }

  @override
  String legendaryTier(int count) {
    return 'LEGENDARY TIER • $count MILESTONES';
  }

  @override
  String get keepRootsGrowingTitle => 'Keep Your Roots Growing!';

  @override
  String keepRootsGrowingDescription(String nextTier) {
    return 'Complete today\'s daily gardening missions to earn rapid milestone points toward $nextTier.';
  }

  @override
  String get viewTodaysMissions => 'View Today\'s Missions';

  @override
  String get tierSeedlingName => 'Seedling';

  @override
  String get tierSeedlingDescription =>
      'Every mighty oak begins as a tiny dream in the dirt. You planted your first root!';

  @override
  String get tierSproutName => 'Sprout';

  @override
  String get tierSproutDescription =>
      'First green leaves breaking the soil! You are learning the rhythm of daily sunshine and water.';

  @override
  String get tierGrowerName => 'Grower';

  @override
  String get tierGrowerDescription =>
      'Stems are thickening and branches reaching out. Consistent care turns tiny sprouts into resilient stalks.';

  @override
  String get tierNurturerName => 'Nurturer';

  @override
  String get tierNurturerDescription =>
      'You know when plants are thirsty before they even ask. Your empathy brings vibrant vitality to the garden.';

  @override
  String get tierGardenerName => 'Gardener';

  @override
  String get tierGardenerDescription =>
      'You manage soil health, pruning schedules, and joyful blossoms with seasoned expertise!';

  @override
  String get tierPlantKeeperName => 'Plant Keeper';

  @override
  String get tierPlantKeeperDescription =>
      'Guard rare botanical species and unlock legendary greenhouse upgrades.';

  @override
  String get plantKeeperUnlockDescription =>
      'Unlock exotic seeds and fertilizer boosts!';

  @override
  String get tierGardenKeeperName => 'Garden Keeper';

  @override
  String get tierGardenKeeperDescription =>
      'Master complex companion planting and balance seasonal microclimates.';

  @override
  String get tierGardenMasterName => 'Garden Master';

  @override
  String get tierGardenMasterDescription =>
      'Design breathtaking ecosystem landscapes that hum with pollinator wildlife.';

  @override
  String get tierGreenThumbName => 'Green Thumb';

  @override
  String get tierGreenThumbDescription =>
      'A legendary touch where even dormant seeds spring instantly to joyful life.';

  @override
  String get tierBloomMasterName => 'Bloom Master';

  @override
  String get tierBloomMasterDescription =>
      'The ultimate pinnacle of sanctuary cultivation. Your sanctuary becomes a timeless wonderland of eternal spring!';

  @override
  String get newAchievementsTitle => 'New Achievements';

  @override
  String get achievementUnlockedBadge => 'Achievement Unlocked';

  @override
  String get newMedalUnlockedTitle => '🎉 New Medal Unlocked!';

  @override
  String get plantKeeperSupremeName => 'Plant Keeper Supreme';

  @override
  String unlockedMedalMessage(String petName) {
    return 'Amazing work! $petName and your digital garden are flourishing.';
  }

  @override
  String get milestonesCompletedLabel => 'Milestones completed';

  @override
  String get unlockedPerkLabel => 'Unlocked Perk';

  @override
  String get goldenPotPerk => 'Special Golden Pot Skin & +100 XP Bonus!';

  @override
  String get claimRewardAndContinue => 'Claim Reward & Continue';

  @override
  String get viewInMedalJourney => 'View in Medal Journey';

  @override
  String welcomeGreeting(String name) {
    return 'Welcome, $name! 🌱';
  }

  @override
  String get gardenWaitingTitle => 'Your garden is waiting.';

  @override
  String get gardenWaitingDescription =>
      'Connect a physical Seedly Smart Pot or start growing your first digital seed companion today!';

  @override
  String get addFirstPlantButton => 'Add My First Plant';

  @override
  String get scanSmartPotButton => 'Scan Smart Pot QR Code';

  @override
  String get zeroStressTitle => 'Zero stress, 100% fun!';

  @override
  String get zeroStressDescription =>
      'We\'ll guide you step by step with gentle watering tips.';

  @override
  String get readyBadgeLabel => 'Ready!';

  @override
  String get navHome => 'Home';

  @override
  String get navGarden => 'Garden';

  @override
  String get navMissions => 'Missions';

  @override
  String get navChat => 'Chat';

  @override
  String get navProfile => 'Profile';

  @override
  String get gardenHasPlantsTitle => 'Your garden is growing!';

  @override
  String gardenHasPlantsDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count plants across your containers.',
      one: '1 plant across your containers.',
    );
    return '$_temp0';
  }

  @override
  String get viewMyPlantsButton => 'View My Plants';

  @override
  String get addNewSeedTitle => 'Add New Seed';

  @override
  String get addSeedQuestion =>
      'How would you like to introduce your new plant to the garden?';

  @override
  String get scanQrMethodTitle => 'Scan QR';

  @override
  String get scanQrMethodDescription =>
      'Fastest way if you have a Seedly starter kit.';

  @override
  String get enterCodeMethodTitle => 'Enter SEEDLY Code';

  @override
  String get enterCodeMethodDescription =>
      'Type the 6-digit code on your seed packet.';

  @override
  String get browseCatalogueMethodTitle => 'Browse Catalogue';

  @override
  String get browseCatalogueMethodDescription =>
      'Adding a plant you bought somewhere else?';

  @override
  String get confirmSmartPotButton => 'Confirm Smart Pot';

  @override
  String get iotSyncFooterNote => 'Smart Pot syncs with SEEDLY OS over BLE 5.2';

  @override
  String smartPotReadyTitle(String potName) {
    return 'Your $potName is ready';
  }

  @override
  String get smartPotReadyDescription =>
      'Your Smart Pot is paired and ready to grow. Place your seeds to begin the journey.';

  @override
  String get scanQrCodeTitle => 'Scan QR Code';

  @override
  String get scanSeedCodeHeadline => 'Scan your SEEDLY seed code 🌱';

  @override
  String get scanSeedCodeDescription => 'Hold the QR code inside the frame.';

  @override
  String get tapToScanHint => 'Tap to scan the Plant QR Code';

  @override
  String get enterCodeManuallyButton => 'Enter Code Manually';

  @override
  String get cameraPermissionDenied =>
      'Camera access is needed to scan a QR code.';

  @override
  String get addPlantTitle => 'Add Plant';

  @override
  String get enterSeedlyCodeHeadline => 'Enter SEEDLY Code';

  @override
  String get enterSeedlyCodeDescription =>
      'Find the 10-digit code on the bottom of your sensor kit or on the instruction manual.';

  @override
  String get seedCodeHint => 'XXXXX-XXXXX';

  @override
  String get continueButton => 'Continue';

  @override
  String get whereFindCodeLink => 'Where do I find my code?';

  @override
  String get invalidSeedCodeError =>
      'Enter the 10-digit code exactly as printed.';

  @override
  String get seedCatalogueTitle => 'Seed Catalogue';

  @override
  String get seedCatalogueDescription =>
      'Choose a seed to begin its journey. Each plant comes with tailored care routines to help it thrive in your Seedly environment.';

  @override
  String get addSeedButton => 'Add Seed';

  @override
  String get inactiveSpeciesBadge => 'Coming soon';

  @override
  String get expectedJourneyTitle => 'Expected Journey';

  @override
  String whereWillYouGrow(String name) {
    return 'Where will you grow $name?';
  }

  @override
  String get confirmPlantingButton => 'Confirm Planting';

  @override
  String get containerReadyStatus => 'READY';

  @override
  String get containerFullStatus => 'Garden is full';

  @override
  String smartPotLabel(String letter) {
    return 'Smart Pot $letter';
  }

  @override
  String get directPlantSubtitle => 'Direct Plant';

  @override
  String kitKeywordSubtitle(String kitName) {
    return '$kitName Kit';
  }

  @override
  String adventureSuffixTitle(String speciesName) {
    return '$speciesName Adventure';
  }

  @override
  String plantJoinedTitle(String name) {
    return '$name has joined your garden! 🌱';
  }

  @override
  String get growthJourneyBeginsToday => 'Your growth journey begins today.';

  @override
  String daySproutingLabel(int day) {
    return 'Day $day: Sprouting';
  }

  @override
  String get firstQuestUnlockedTitle => 'First Quest Unlocked!';

  @override
  String get firstQuestUnlockedDescription =>
      'Take a photo of your new plant to start its timeline.';

  @override
  String get goToMyGardenButton => 'Go to My Garden';

  @override
  String get authWelcomeBackTitle => 'Welcome back 🌱';

  @override
  String get authWelcomeBackSubtitle =>
      'Log in to see how Tommy and your garden are thriving today!';

  @override
  String get authEmailLabel => 'Email Address';

  @override
  String get authPasswordLabel => 'Password';

  @override
  String get authEmailHint => 'alex.grower@example.com';

  @override
  String get authPasswordHint => 'GardenSecret123';

  @override
  String get authMinCharsHint => 'min 8 chars';

  @override
  String get authRememberMe => 'Remember me';

  @override
  String get authForgotPasswordLink => 'Forgot password?';

  @override
  String get authLogInButton => 'Log In';

  @override
  String get authOrDivider => 'or';

  @override
  String get authSignInWithGoogle => 'Sign in with Google';

  @override
  String get authNewToSeedly => 'New to Seedly?';

  @override
  String get authCreateAnAccountLink => 'Create an account';

  @override
  String get authRegisterTitle => 'Create your SEEDLY account 🌱';

  @override
  String get authRegisterSubtitle =>
      'Save your plants, track real-time telemetry, and earn garden medals together.';

  @override
  String get authRegisterEmailHint => 'nurul.gardener@gmail.com';

  @override
  String get authConfirmPasswordLabel => 'Confirm Password';

  @override
  String get authWeakPasswordLabel => 'Weak password';

  @override
  String get authMediumPasswordLabel => 'Medium password';

  @override
  String get authStrongPasswordLabel => 'Strong password';

  @override
  String authPasswordLevelLabel(int level, String tier) {
    return 'Lvl. $level $tier';
  }

  @override
  String get authPasswordTierSeed => 'Seed';

  @override
  String get authPasswordTierSprout => 'Sprout';

  @override
  String get authPasswordTierBloom => 'Bloom';

  @override
  String get authTermsAgreement =>
      'I agree to Seedly Family Terms and Child Safety Privacy Policy';

  @override
  String get authCreateAccountButton => 'Create Account';

  @override
  String get authEmailRequiredError => 'Email is required';

  @override
  String get authPasswordMinLengthError => 'Use at least 8 characters';

  @override
  String get authPasswordMismatchError => 'Passwords don\'t match';

  @override
  String get authOrRegisterWith => 'or register with';

  @override
  String get authContinueWithGoogle => 'Continue with Google';

  @override
  String get authPrivacyNote =>
      'We only use your account to preserve your smart container pairings, care streaks, and botany certificates.';

  @override
  String get authAlreadyHaveAccount => 'Already have an account?';

  @override
  String get authLogInLink => 'Log In';

  @override
  String authStepProgress(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get authCheckEmailTitle => 'Check your email 📩';

  @override
  String get authCheckEmailSubtitle =>
      'We sent a magical confirmation link to:';

  @override
  String get authCheckEmailHint =>
      'Tap the link in your inbox to sprout your account!';

  @override
  String get authQuickStepsTitle => 'Quick 3-step sprout';

  @override
  String get authEasyPeasyBadge => 'EASY PEASY';

  @override
  String get authOpenEmailAppTitle => 'Open email app';

  @override
  String get authOpenEmailAppDescription => 'Find message from Seedly Garden';

  @override
  String get authVerifyAccountTitle => 'Tap \'Verify my Seedly Account\'';

  @override
  String get authVerifyAccountDescription =>
      'Look for the big green button inside';

  @override
  String get authReturnToPlantTitle => 'Return here to start planting';

  @override
  String get authReturnToPlantDescription =>
      'Your cozy seedling plot is all prepped';

  @override
  String get authOpenMailAppButton => 'Open Mail App';

  @override
  String authResendLinkCountdown(int seconds) {
    return 'Resend link (${seconds}s)';
  }

  @override
  String get authResendLinkButton => 'Resend link';

  @override
  String get authChangeEmailLink => 'Wrong email address? Change email';

  @override
  String get authSpamNote =>
      'Can\'t find the email? Don\'t forget to check your spam or promotions folder. Sometimes baby sprouts get tucked into quiet corners!';

  @override
  String get authResetPasswordTitle => 'Reset Your Password 🔑';

  @override
  String get authResetPasswordSubtitle =>
      'Enter your registered email and we\'ll send you safe instructions to reset your garden access.';

  @override
  String get authAccountEmailLabel => 'Your Account Email';

  @override
  String get authAccountEmailBadge => 'Grown-up or Guardian';

  @override
  String get authAccountEmailHint => 'hello@familygarden.com';

  @override
  String get authSendResetLinkButton => 'Send Reset Link';

  @override
  String get authEncryptedKidSafe => 'Encrypted & Kid-Safe';

  @override
  String get authNeedHandTitle => 'Need a hand right now?';

  @override
  String authNeedHandDescription(String email) {
    return 'Contact our friendly family care guides anytime at $email';
  }

  @override
  String get authSupportEmail => 'support@seedly.app';

  @override
  String get authBackToLogIn => 'Back to Log In';

  @override
  String get authOnboardingHeroTitle => 'Learn, Earn & Flourish 🌿';

  @override
  String get authOnboardingHeroDescription =>
      'Complete fun botany missions, ask Seedly AI anything, and unlock 10 progressive medals as your real greenhouse thrives.';

  @override
  String get authGardenMasterBadge => 'Garden Master';

  @override
  String get authBotanyQuickChecksTitle => 'Botany Quick Checks';

  @override
  String get authBotanyQuickChecksDescription =>
      'Daily 60-second micro-missions';

  @override
  String get authXpBadge => '+10 XP';

  @override
  String get authMedalJourneyTitle => '10 Medal Mastery Journey';

  @override
  String get authMedalJourneySubtitle => 'Seedling to Bloom Master';

  @override
  String authMedalJourneyFraction(int current, int total) {
    return '$current / $total';
  }

  @override
  String get authPlantCompanionTitle => 'Intelligent Plant Companion';

  @override
  String get authPlantCompanionDescription => '24/7 kid-friendly botany chat';

  @override
  String get authGetStartedButton => 'Get Started';

  @override
  String get accountDetailTitle => 'Account Detail';

  @override
  String get accountDetailMemberSince => 'Member Since: March 2023';

  @override
  String get accountDetailLevelBadge => 'Level 4 Botanist';

  @override
  String get accountDetailStreakBadge => '12 Streaks';

  @override
  String get accountDetailPersonalInfoTitle => 'Personal Information';

  @override
  String get accountDetailDisplayNameLabel => 'Display Name';

  @override
  String get accountDetailDisplayNameHint => 'Sam D.';

  @override
  String get accountDetailEmailLabel => 'Email Address';

  @override
  String get accountDetailEmailHint => 'sam.gardener@example.com';

  @override
  String get accountDetailUpdateButton => 'Update Profile Details';

  @override
  String get accountDetailPotsTitle => 'Associated Smart Pots';

  @override
  String get accountDetailAddNewLink => '+ Add New';

  @override
  String get accountDetailPotAName => 'Smart Pot A';

  @override
  String get accountDetailPotASpecies => 'Monstera Deliciosa';

  @override
  String get accountDetailPotASoil => '• Soil: 68% • Ideal';

  @override
  String get accountDetailPotBName => 'Smart Pot B';

  @override
  String get accountDetailPotBSpecies => 'Fiddle Leaf Fig';

  @override
  String get accountDetailPotBSoil => '• Temp: 24°C • Stable';

  @override
  String get accountDetailFooterNote =>
      'Your plants are thriving under your care!';

  @override
  String get helpSupportBanner => 'We\'re here to help, little sprout!';

  @override
  String get helpSupportTitle => 'Help & Support';

  @override
  String get helpSupportSubtitle =>
      'Find quick answers, chat with our master gardeners, or explore helpful guides.';

  @override
  String get helpSupportSearchHint => 'Search FAQs (e.g., smart pot, watering)';

  @override
  String get helpSupportOnlineBadge => 'Gardeners Online';

  @override
  String get helpSupportChatTitle => 'Chat with Support';

  @override
  String get helpSupportChatSubtitle =>
      'Got a tricky question? We reply in minutes!';

  @override
  String get helpSupportChatButton => 'Chat';

  @override
  String get helpSupportFaqTitle => 'Frequently Asked Questions';

  @override
  String get helpSupportViewAllLink => 'View All';

  @override
  String get helpSupportFaqQ1 => 'How to pair smart pot?';

  @override
  String get helpSupportFaqA1 =>
      'Open the Seedly app, tap Add Smart Pot, and hold the pairing button for 3 seconds until the LED blinks blue.';

  @override
  String get helpSupportFaqQ2 => 'Watering schedule guide';

  @override
  String get helpSupportFaqA2 =>
      'Most houseplants like a drink every 5-7 days; check the soil moisture reading before adding water.';

  @override
  String get helpSupportFaqQ3 => 'Subscription renewal & billing';

  @override
  String get helpSupportFaqA3 =>
      'Plus renews monthly via your chosen payment method; cancel anytime from the Subscription screen.';

  @override
  String get helpSupportFaqQ4 => 'What if my plant isn\'t growing?';

  @override
  String get helpSupportFaqA4 =>
      'Check light and water levels first — our AI chat can diagnose common issues from a photo.';

  @override
  String get helpSupportGuidesTitle => 'User Guides & Manuals';

  @override
  String get helpSupportGuide1Title => 'Quick Start Guide';

  @override
  String get helpSupportGuide1Meta => 'PDF • 2.4 MB';

  @override
  String get helpSupportGuide2Title => 'Smart Pot Handbook';

  @override
  String get helpSupportGuide2Meta => 'PDF • 4.1 MB';

  @override
  String get helpSupportFactTitle => 'Did you know?';

  @override
  String get helpSupportFactBody =>
      'Talking to your plants helps them absorb positive vibes! (And carbon dioxide).';

  @override
  String get notificationPrefsTitle => 'Notifications';

  @override
  String get notificationPrefsSubtitle =>
      'Choose what pings your cozy little garden';

  @override
  String get notificationPrefsGroupPlantCare => 'Plant Care';

  @override
  String get notificationPrefsGroupMissions => 'Missions & Summary';

  @override
  String get notificationPrefsGroupHardware => 'Smart Pot & Hardware';

  @override
  String get notificationPrefsWateringTitle => 'Watering & Thirst';

  @override
  String get notificationPrefsWateringSubtitle =>
      'Friendly pings when your green buddies need a drink';

  @override
  String get notificationPrefsSunlightTitle => 'Sunlight Spotting';

  @override
  String get notificationPrefsSunlightSubtitle =>
      'Reminders to move plants to sunny windows';

  @override
  String get notificationPrefsDailyMissionTitle => 'Daily Mission Alerts';

  @override
  String get notificationPrefsDailyMissionSubtitle =>
      'Never miss your daily streak rewards and quests';

  @override
  String get notificationPrefsWeeklyGrowthTitle => 'Weekly Growth Sun';

  @override
  String get notificationPrefsWeeklyGrowthSubtitle =>
      'A sweet recap of how much your garden grew';

  @override
  String get notificationPrefsIotTitle => 'IoT Connection Warnings';

  @override
  String get notificationPrefsIotSubtitle =>
      'Alerts if your smart pot loses Bluetooth or Wi-Fi';

  @override
  String get notificationPrefsFooterNote =>
      'Notifications are tailored to your local weather and smart sensor telemetry to keep your plants thriving!';

  @override
  String get profileGreeting => 'Hi, Sam!';

  @override
  String get profileLevelLabel => 'Explorer Level 5';

  @override
  String get profilePlusBadge => 'SEEDLY Plus';

  @override
  String get profileUpsellTitle => 'Unlock More Magic!';

  @override
  String get profileUpsellBody =>
      'Get 100+ more AI chats each day and access to Premium Garden Content.';

  @override
  String get profileChatUsage => '10/10 free chats used today';

  @override
  String get profileUpgradeButton => 'Upgrade to Plus';

  @override
  String get profileCancelAnytime => 'Cancel anytime.';

  @override
  String get profileSettingsLabel => 'SETTINGS';

  @override
  String get profileSettingsAccount => 'Account';

  @override
  String get profileSettingsNotifications => 'Notifications';

  @override
  String get profileSettingsHelp => 'Help & Support';

  @override
  String get subscriptionMemberBadge => 'SEEDLY Plus Member';

  @override
  String get subscriptionHeroTitle => 'Level Up Your Sanctuary';

  @override
  String get subscriptionHeroSubtitle =>
      'Unlock infinite possibilities for your digital garden.';

  @override
  String get subscriptionPlanName => 'Monthly Pass';

  @override
  String get subscriptionPlanPrice => 'Rp 49k';

  @override
  String get subscriptionPlanPeriod => '/mo';

  @override
  String get subscriptionPlanNote => 'Cancel anytime, keep your perks';

  @override
  String get subscriptionPerkChatTitle => 'Unlimited AI Chats';

  @override
  String get subscriptionPerkChatBody =>
      'Chat with your garden buddies 24/7 without limits';

  @override
  String get subscriptionPerkContentTitle => 'Premium Garden Content';

  @override
  String get subscriptionPerkContentBody =>
      'Access rare seeds, magical soils, and cozy weather fx';

  @override
  String get subscriptionPerkDecorTitle => 'Exclusive Pots & Decor';

  @override
  String get subscriptionPerkDecorBody =>
      'Custom ceramic, crystal, and glowing neon planters';

  @override
  String get subscriptionPaymentMethodBadge => 'Midtrans QRIS';

  @override
  String get subscriptionTimerBadge => '04:58';

  @override
  String get subscriptionScanInstruction =>
      'Scan with any banking app or e-wallet:';

  @override
  String get subscriptionCheckStatusButton => 'Check Payment Status';

  @override
  String get subscriptionSimulateSuccessButton => 'Simulate Successful Payment';
}
