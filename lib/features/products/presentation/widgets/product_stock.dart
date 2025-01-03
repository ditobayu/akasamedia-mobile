import 'package:flutter/material.dart';
import 'package:toko_rame/core/theme/app_font.dart';

class ProductStock extends StatelessWidget {
  const ProductStock({
    super.key,
    required this.stock,
  });
  final int stock;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Stok : ',
        style: AppTextStyles.smallNoneRegular, // Gaya untuk teks pertama
        children: <TextSpan>[
          TextSpan(text: '$stock pcs', style: AppTextStyles.smallNoneBold),
        ],
      ),
    );
  }
}
