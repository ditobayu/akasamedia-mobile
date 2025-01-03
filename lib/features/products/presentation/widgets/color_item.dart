import 'package:flutter/material.dart';
import 'package:toko_rame/core/theme/app_colors.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.onColorChange,
    required this.currentColorIndex,
    required this.index,
    required this.value,
  });

  final Function(int p1) onColorChange;
  final int currentColorIndex;
  final int index;
  final String value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onColorChange(index);
      },
      child: Row(
        children: [
          index == currentColorIndex
              ? Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                      color: (Color(int.parse("0xFF$value"))),
                      borderRadius: BorderRadius.circular(22),
                      border:
                          Border.all(color: AppColors.primary950, width: 2)),
                )
              : Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: (Color(int.parse("0xFF$value"))),
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }
}
