import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toko_rame/core/theme/app_colors.dart';
import 'package:toko_rame/core/theme/app_font.dart';

class ProductDescriptionSection extends StatelessWidget {
  const ProductDescriptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          decoration: const BoxDecoration(
            color: AppColors.primary200,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Deskripsi",
                    style: AppTextStyles.regularNoneMedium,
                  ),
                  SvgPicture.asset(
                    'assets/icons/ic_copy.svg',
                    width: 24,
                    height: 24,
                  )
                ],
              ),
              const SizedBox(height: 16),
              Text(
                "*New Material*\nTerbuat dari bahan 100% Katun Linen yang \nmembuat nyaman jika digunakan.\nMenggunakan fit Relaxed Fit.\n\nSIZE CHART RELAXED SHIRT....",
                style: AppTextStyles.smallNormalRegular,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Selengkapnya",
                      style: AppTextStyles.smallNoneMedium.copyWith(
                        color: AppColors.info500,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SvgPicture.asset(
                      'assets/icons/ic_arrow_down.svg',
                      width: 16,
                      height: 16,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          height: 1,
          decoration: const BoxDecoration(
            color: AppColors.primary200,
          ),
        ),
      ],
    );
  }
}
