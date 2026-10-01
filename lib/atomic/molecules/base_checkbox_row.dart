import 'package:flutter/material.dart';

import '../atoms/base_gap.dart';
import '../atoms/base_text.dart';
import '../colors/colors.dart';
import '../typograph/typograph.dart';

/// Checkbox + label row with an optional trailing widget (e.g. a
/// "Forgot password?" link). The whole row is the tap target, so the box is
/// drawn directly instead of using [Checkbox] — that avoids two competing tap
/// recognisers firing on the same tap.
class BaseCheckboxRow extends StatelessWidget {
  const BaseCheckboxRow({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
    this.trailing,
  });

  final String label;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      checked: value,
      child: InkWell(
        onTap: onChanged == null ? null : () => onChanged!(!value),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: value ? AppColors.greenDark : AppColors.transparent,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: value ? AppColors.greenDark : AppColors.border,
                    width: 1.5,
                  ),
                ),
                child: value
                    ? const Icon(Icons.check, size: 15, color: AppColors.white)
                    : null,
              ),
              const BaseGap.h(10),
              Expanded(
                child: BaseText(
                  label,
                  style: AppTypography.bodyS,
                  color: AppColors.textSecondary,
                ),
              ),
              if (trailing != null) ...[const BaseGap.h(4), trailing!],
            ],
          ),
        ),
      ),
    );
  }
}
