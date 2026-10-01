import 'package:flutter/material.dart';
import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({
    super.key,
    this.onBack,
    this.onNavTap,
    this.onChat,
    this.onViewAllFaq,
    this.onGuideTap,
  });

  final VoidCallback? onBack;
  final ValueChanged<int>? onNavTap;
  final VoidCallback? onChat;
  final VoidCallback? onViewAllFaq;
  final VoidCallback? onGuideTap;

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: BaseAppBar(
        title: '',
        showClose: false,
        onBack: widget.onBack,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _HelpBanner(),
            const BaseGap.v(16),
            BaseText(l10n.helpSupportTitle, style: AppTypography.headingL),
            const BaseGap.v(6),
            BaseText(
              l10n.helpSupportSubtitle,
              style: AppTypography.bodyM,
              color: AppColors.textSecondary,
            ),
            const BaseGap.v(16),
            BaseTextField(
              hintText: l10n.helpSupportSearchHint,
              prefixIcon: Icons.search,
            ),
            const BaseGap.v(16),
            _GardenersOnlineCard(onChat: widget.onChat),
            const BaseGap.v(16),
            Row(
              children: [
                Expanded(
                  child: BaseText(
                    l10n.helpSupportFaqTitle,
                    style: AppTypography.titleM,
                  ),
                ),
                BaseTextLink(
                  l10n.helpSupportViewAllLink,
                  onTap: widget.onViewAllFaq,
                  style: AppTypography.labelS,
                  color: AppColors.greenDark,
                ),
              ],
            ),
            const BaseGap.v(12),
            _FaqTile(
              index: 0,
              expandedIndex: _expandedIndex,
              onTap: (i) =>
                  setState(() => _expandedIndex = _expandedIndex == i ? null : i),
              iconBackground: AppColors.greenLight,
              iconColor: AppColors.greenDark,
              question: l10n.helpSupportFaqQ1,
              answer: l10n.helpSupportFaqA1,
            ),
            const BaseGap.v(8),
            _FaqTile(
              index: 1,
              expandedIndex: _expandedIndex,
              onTap: (i) =>
                  setState(() => _expandedIndex = _expandedIndex == i ? null : i),
              iconBackground: AppColors.yellowPale,
              iconColor: AppColors.yellowText,
              question: l10n.helpSupportFaqQ2,
              answer: l10n.helpSupportFaqA2,
            ),
            const BaseGap.v(8),
            _FaqTile(
              index: 2,
              expandedIndex: _expandedIndex,
              onTap: (i) =>
                  setState(() => _expandedIndex = _expandedIndex == i ? null : i),
              iconBackground: AppColors.blueLight,
              iconColor: AppColors.blueDark,
              question: l10n.helpSupportFaqQ3,
              answer: l10n.helpSupportFaqA3,
            ),
            const BaseGap.v(8),
            _FaqTile(
              index: 3,
              expandedIndex: _expandedIndex,
              onTap: (i) =>
                  setState(() => _expandedIndex = _expandedIndex == i ? null : i),
              iconBackground: AppColors.error.withValues(alpha: 0.12),
              iconColor: AppColors.error,
              question: l10n.helpSupportFaqQ4,
              answer: l10n.helpSupportFaqA4,
            ),
            const BaseGap.v(16),
            _GuidesSection(onGuideTap: widget.onGuideTap),
            const BaseGap.v(16),
            const _DidYouKnowCard(),
            const BaseGap.v(24),
            BaseBottomNavBar(
              items: [
                BaseBottomNavItem(
                  icon: Icons.eco_outlined,
                  activeIcon: Icons.eco,
                  label: l10n.navHome,
                ),
                BaseBottomNavItem(
                  icon: Icons.yard_outlined,
                  activeIcon: Icons.yard,
                  label: l10n.navGarden,
                ),
                BaseBottomNavItem(
                  icon: Icons.chat_bubble_outline,
                  activeIcon: Icons.chat_bubble,
                  label: l10n.navChat,
                ),
                BaseBottomNavItem(
                  icon: Icons.person_outline,
                  activeIcon: Icons.person,
                  label: l10n.navProfile,
                ),
              ],
              currentIndex: 0,
              onTap: (i) => widget.onNavTap?.call(i),
            ),
          ],
        ),
      ),
    );
  }
}

class _HelpBanner extends StatelessWidget {
  const _HelpBanner();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BaseCard(
      backgroundColor: AppColors.lavender,
      boxShadow: AppShadows.none,
      borderRadius: 20,
      child: Row(
        children: [
          const BaseIcon(
            Icons.eco,
            backgroundColor: AppColors.greenLight,
            color: AppColors.greenDark,
            backgroundSize: 36,
          ),
          const BaseGap.h(12),
          Expanded(
            child: BaseText(l10n.helpSupportBanner, style: AppTypography.bodyS),
          ),
        ],
      ),
    );
  }
}

class _GardenersOnlineCard extends StatelessWidget {
  const _GardenersOnlineCard({this.onChat});

  final VoidCallback? onChat;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BaseCard(
      backgroundColor: AppColors.greenDark,
      boxShadow: AppShadows.none,
      borderRadius: 20,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseBadge(
                  label: l10n.helpSupportOnlineBadge,
                  backgroundColor: AppColors.whiteOverlay,
                  foregroundColor: AppColors.white,
                  textStyle: AppTypography.caption,
                ),
                const BaseGap.v(8),
                BaseText(
                  l10n.helpSupportChatTitle,
                  style: AppTypography.headingS,
                  color: AppColors.white,
                ),
                const BaseGap.v(4),
                BaseText(
                  l10n.helpSupportChatSubtitle,
                  style: AppTypography.bodyS,
                  color: AppColors.whiteMuted,
                ),
              ],
            ),
          ),
          const BaseGap.h(12),
          BaseButton(
            label: l10n.helpSupportChatButton,
            onPressed: onChat,
            variant: BaseButtonVariant.secondary,
            backgroundColor: AppColors.white,
            foregroundColor: AppColors.greenDark,
            borderRadius: BorderRadius.circular(999),
            leadingIcon: Icons.chat_bubble_outline,
          ),
        ],
      ),
    );
  }
}

class _FaqTile extends StatelessWidget {
  const _FaqTile({
    required this.index,
    required this.expandedIndex,
    required this.onTap,
    required this.iconBackground,
    required this.iconColor,
    required this.question,
    required this.answer,
  });

  final int index;
  final int? expandedIndex;
  final ValueChanged<int> onTap;
  final Color iconBackground;
  final Color iconColor;
  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    final expanded = expandedIndex == index;
    return BaseCard(
      borderRadius: 16,
      onTap: () => onTap(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              BaseIcon(
                Icons.search,
                backgroundSize: 40,
                backgroundColor: iconBackground,
                color: iconColor,
              ),
              const BaseGap.h(12),
              Expanded(
                child: BaseText(question, style: AppTypography.titleS),
              ),
              Icon(
                expanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: AppColors.textMuted,
              ),
            ],
          ),
          if (expanded) ...[
            const BaseGap.v(8),
            BaseText(
              answer,
              style: AppTypography.bodyS,
              color: AppColors.textSecondary,
            ),
          ],
        ],
      ),
    );
  }
}

class _GuidesSection extends StatelessWidget {
  const _GuidesSection({this.onGuideTap});

  final VoidCallback? onGuideTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseText(l10n.helpSupportGuidesTitle, style: AppTypography.titleM),
        const BaseGap.v(12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _GuideCard(
                icon: Icons.menu_book,
                bg: AppColors.blueLight,
                fg: AppColors.blueDark,
                title: l10n.helpSupportGuide1Title,
                meta: l10n.helpSupportGuide1Meta,
                onTap: onGuideTap,
              ),
            ),
            const BaseGap.h(12),
            Expanded(
              child: _GuideCard(
                icon: Icons.eco,
                bg: AppColors.yellowPale,
                fg: AppColors.yellowText,
                title: l10n.helpSupportGuide2Title,
                meta: l10n.helpSupportGuide2Meta,
                onTap: onGuideTap,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _GuideCard extends StatelessWidget {
  const _GuideCard({
    required this.icon,
    required this.bg,
    required this.fg,
    required this.title,
    required this.meta,
    this.onTap,
  });

  final IconData icon;
  final Color bg;
  final Color fg;
  final String title;
  final String meta;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      borderRadius: 16,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
            child: Icon(icon, color: fg, size: 20),
          ),
          const BaseGap.v(8),
          BaseText(title, style: AppTypography.titleS),
          BaseText(
            meta,
            style: AppTypography.caption,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}

class _DidYouKnowCard extends StatelessWidget {
  const _DidYouKnowCard();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BaseCard(
      backgroundColor: AppColors.blueSurface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseText(l10n.helpSupportFactTitle, style: AppTypography.titleS),
          const BaseGap.v(6),
          BaseText(
            l10n.helpSupportFactBody,
            style: AppTypography.bodyS,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
