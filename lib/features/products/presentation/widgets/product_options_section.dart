import 'package:flutter/material.dart';
import 'package:toko_rame/core/theme/app_colors.dart';
import 'package:toko_rame/core/theme/app_font.dart';
import 'package:toko_rame/features/products/domain/entities/product.dart';

class ProductOptionsSection extends StatelessWidget {
  final int currentSizeIndex;
  final int currentColorIndex;
  final ProductEntity product;
  final Function(int) onSizeChange;
  final Function(int) onColorChange;
  const ProductOptionsSection({
    super.key,
    required this.currentSizeIndex,
    required this.currentColorIndex,
    required this.product,
    required this.onSizeChange,
    required this.onColorChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.primary200,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ukuran",
                style: AppTextStyles.smallNoneRegular,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ...product.sizes!.asMap().entries.map(
                        (size) => GestureDetector(
                          onTap: () {
                            onSizeChange(size.key);
                          },
                          child: Row(
                            children: [
                              size.key == currentSizeIndex
                                  ? Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 6),
                                      decoration: BoxDecoration(
                                          color: AppColors.primary100,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(
                                              color: AppColors.primary950,
                                              width: 2)),
                                      child: Text(
                                        size.value,
                                        style: AppTextStyles.smallNoneMedium,
                                      ))
                                  : Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary100,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        size.value,
                                        style: AppTextStyles.smallNoneMedium,
                                      )),
                              const SizedBox(
                                width: 12,
                              ),
                            ],
                          ),
                        ),
                      )
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Warna",
                style: AppTextStyles.smallNoneRegular,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ...product.colors!.asMap().entries.map(
                        (color) => GestureDetector(
                          onTap: () {
                            onColorChange(color.key);
                          },
                          child: Row(
                            children: [
                              color.key == currentColorIndex
                                  ? Container(
                                      height: 44,
                                      width: 44,
                                      decoration: BoxDecoration(
                                          color: AppColors.primary100,
                                          borderRadius:
                                              BorderRadius.circular(22),
                                          border: Border.all(
                                              color: AppColors.primary950,
                                              width: 2)),
                                    )
                                  : Container(
                                      height: 44,
                                      width: 44,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary100,
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                    ),
                              const SizedBox(
                                width: 12,
                              ),
                            ],
                          ),
                        ),
                      )
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          RichText(
            text: TextSpan(
              text: 'Stok : ',
              style: AppTextStyles.smallNoneRegular, // Gaya untuk teks pertama
              children: <TextSpan>[
                TextSpan(text: '99+ pcs', style: AppTextStyles.smallNoneBold),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
