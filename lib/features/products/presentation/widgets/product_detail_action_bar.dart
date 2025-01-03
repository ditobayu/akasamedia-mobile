import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailActionBar extends StatelessWidget {
  const ProductDetailActionBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.only(top: 40, left: 18, right: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/icons/ic_back.svg',
                width: 24,
                height: 24,
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/icons/ic_download.svg',
                    width: 20,
                    height: 20,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/icons/ic_cart.svg',
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
