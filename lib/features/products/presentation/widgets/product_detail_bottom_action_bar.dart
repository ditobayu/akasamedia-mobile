import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toko_rame/core/theme/app_colors.dart';
import 'package:toko_rame/ui/widgets/buttons.dart';

class ProductDetailBottomActionBar extends StatelessWidget {
  const ProductDetailBottomActionBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Wrap(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomOutlineButton(
                        outlineColor: AppColors.primary950,
                        title: "Tambahkan ke toko",
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomFilledIconButton(
                        width: 90,
                        icon: SvgPicture.asset('assets/icons/ic_cart.svg',
                            width: 20, height: 20),
                        onPressed: () {})
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
