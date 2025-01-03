import 'package:flutter/material.dart';
import 'package:toko_rame/features/products/domain/entities/product.dart';

class ProductDetailCarousePagination extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailCarousePagination({
    super.key,
    required this.currentIndex,
    required this.product,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 336,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...product.image!.asMap().entries.map(
                  (entry) => AnimatedContainer(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 500),
                    width: currentIndex == entry.key ? 20 : 4,
                    height: 4,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
