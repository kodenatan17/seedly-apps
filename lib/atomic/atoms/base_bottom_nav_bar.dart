import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../typograph/typograph.dart';
import 'base_text.dart';

class BaseBottomNavItem {
  const BaseBottomNavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
}

/// Bottom tab bar atom.
class BaseBottomNavBar extends StatelessWidget {
  const BaseBottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.backgroundColor = AppColors.surface,
    this.activeColor = AppColors.greenDark,
    this.inactiveColor = AppColors.textMuted,
  });

  final List<BaseBottomNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: const Border(top: BorderSide(color: AppColors.divider)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              for (var i = 0; i < items.length; i++)
                Expanded(
                  child: _NavTapTarget(
                    item: items[i],
                    isActive: i == currentIndex,
                    activeColor: activeColor,
                    inactiveColor: inactiveColor,
                    onTap: () => onTap(i),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavTapTarget extends StatelessWidget {
  const _NavTapTarget({
    required this.item,
    required this.isActive,
    required this.activeColor,
    required this.inactiveColor,
    required this.onTap,
  });

  final BaseBottomNavItem item;
  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? activeColor : inactiveColor;
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(isActive ? item.activeIcon : item.icon, color: color, size: 24),
          const SizedBox(height: 4),
          BaseText(
            item.label,
            style: AppTypography.caption,
            color: color,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
