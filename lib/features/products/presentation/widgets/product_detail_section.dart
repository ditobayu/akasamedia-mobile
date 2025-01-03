import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toko_rame/core/theme/app_colors.dart';
import 'package:toko_rame/core/theme/app_font.dart';
import 'package:toko_rame/core/util/currency_formatter.dart';
import 'package:toko_rame/features/products/domain/entities/product.dart';

class ProductDetailSection extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailSection({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              product.isNew!
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.secondary400,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: 'New',
                          style: AppTextStyles
                              .regularNoneBold, // Gaya untuk teks pertama
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Product Baru',
                                style: AppTextStyles.smallNoneRegular),
                          ],
                        ),
                      ),
                    )
                  : Container(),
              SvgPicture.asset(
                'assets/icons/ic_share.svg',
                width: 24,
                height: 24,
              ),
            ],
          ),
          const SizedBox(height: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name!, style: AppTextStyles.title3),
              const SizedBox(height: 2),
              Text(
                product.seller!,
                style: AppTextStyles.smallNormalMedium
                    .copyWith(color: AppColors.primary400),
              ),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(formatCurrency(product.customerPrice!),
                              style: AppTextStyles.regularNoneBold),
                          const SizedBox(height: 4),
                          Text(
                            "Harga Customer",
                            style: AppTextStyles.smallNoneRegular.copyWith(
                              color: AppColors.primary500,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 1,
                      height: 44,
                      color: AppColors.primary500,
                    ),
                    const SizedBox(width: 16),
                    Center(
                      child: Column(
                        children: [
                          Text(formatCurrency(product.resellerPrice!),
                              style: AppTextStyles.regularNoneBold),
                          const SizedBox(height: 4),
                          Text(
                            "Harga Customer",
                            style: AppTextStyles.smallNoneRegular.copyWith(
                              color: AppColors.primary500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.secondary500,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            height: 36,
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: 'Komisi ',
                  style:
                      AppTextStyles.smallNoneRegular, // Gaya untuk teks pertama
                  children: <TextSpan>[
                    TextSpan(
                        text: formatCurrency(
                            product.customerPrice! * product.commision! / 100),
                        style: AppTextStyles.largeNormalBold),
                    TextSpan(
                        text: "(${product.commision}%)",
                        style: AppTextStyles.smallNoneBold),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
