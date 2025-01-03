import 'package:flutter/material.dart';
import 'package:toko_rame/core/theme/app_colors.dart';
import 'package:toko_rame/core/theme/app_font.dart';

class SizeItem extends StatelessWidget {
  const SizeItem({
    super.key,
    required this.onSizeChange,
    required this.currentSizeIndex,
    required this.index,
    required this.value,
  });

  final Function(int p1) onSizeChange;
  final int currentSizeIndex;
  final int index;
  final String value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSizeChange(index);
      },
      child: Row(
        children: [
          index == currentSizeIndex
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                  decoration: BoxDecoration(
                      color: AppColors.primary100,
                      borderRadius: BorderRadius.circular(6),
                      border:
                          Border.all(color: AppColors.primary950, width: 2)),
                  child: Text(
                    value,
                    style: AppTextStyles.smallNoneMedium,
                  ))
              : Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primary100,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    value,
                    style: AppTextStyles.smallNoneMedium.copyWith(
                      color: AppColors.gray700,
                    ),
                  )),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }
}
