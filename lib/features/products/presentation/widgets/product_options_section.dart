import 'package:flutter/material.dart';
import 'package:toko_rame/core/theme/app_colors.dart';
import 'package:toko_rame/core/theme/app_font.dart';
import 'package:toko_rame/features/products/domain/entities/product.dart';
import 'package:toko_rame/features/products/presentation/widgets/color_item.dart';
import 'package:toko_rame/features/products/presentation/widgets/product_stock.dart';
import 'package:toko_rame/features/products/presentation/widgets/size_item.dart';

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
                        (size) => SizeItem(
                            onSizeChange: onSizeChange,
                            currentSizeIndex: currentSizeIndex,
                            index: size.key,
                            value: size.value),
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
                        (color) => ColorItem(
                          onColorChange: onColorChange,
                          currentColorIndex: currentColorIndex,
                          index: color.key,
                          value: color.value,
                        ),
                      )
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          ProductStock(
            stock: product.stock!,
          ),
        ],
      ),
    );
  }
}
