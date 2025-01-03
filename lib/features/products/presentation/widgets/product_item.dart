import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_rame/core/theme/app_colors.dart';
import 'package:toko_rame/core/theme/app_font.dart';
import 'package:toko_rame/core/util/currency_formatter.dart';
import 'package:toko_rame/features/products/domain/entities/product.dart';
import 'package:toko_rame/ui/widgets/buttons.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity item;
  const ProductItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/product/${item.id}');
      },
      child: Stack(
        children: [
          SizedBox(
            height: 254,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(item.image![0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.name!,
                  style: AppTextStyles.xSmallTightMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Harga Reseller",
                          style: AppTextStyles.tinyNoneRegular,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          formatCurrency(item.resellerPrice!.toInt()),
                          style: AppTextStyles.smallNormalBold.copyWith(
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ic_stock.svg',
                              width: 12,
                              height: 12,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text("${item.stock} pcs",
                                style: AppTextStyles.tinyNoneRegular),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                CustomFilledButton(
                  title: "Bagikan Produk",
                  onPressed: () {
                    _showShareDialog(context);
                  },
                  textStyle: AppTextStyles.xSmallNoneRegular,
                )
              ],
            ),
          ),
          Positioned(
              top: 0,
              right: 7,
              child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.secondary400,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text("New")))
        ],
      ),
    );
  }

  _showShareDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Wrap(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 17),
          width: double.infinity,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_close.svg',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Text(
                    "Bagikan Product",
                    style: AppTextStyles.smallNoneMedium,
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                            // give only bottom border
                            border: Border(
                                bottom: BorderSide(
                                    color: AppColors.primary200, width: 1))),
                        child: Text(
                          "Text dan Link",
                          style: AppTextStyles.smallNoneRegular,
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                            // give only bottom border
                            border: Border(
                                bottom: BorderSide(
                                    color: AppColors.primary200, width: 1))),
                        child: Text(
                          "Gambar",
                          style: AppTextStyles.smallNoneRegular,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
