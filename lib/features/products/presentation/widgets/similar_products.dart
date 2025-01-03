import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toko_rame/core/theme/app_font.dart';
import 'package:toko_rame/features/products/presentation/bloc/product/remote/remote_product_bloc.dart';
import 'package:toko_rame/features/products/presentation/widgets/product_item.dart';

class SimilarProducts extends StatelessWidget {
  const SimilarProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Produk Serupa",
            style: AppTextStyles.regularNoneMedium,
          ),
          BlocBuilder<RemoteProductBloc, RemoteProductState>(
            builder: (context, state) {
              if (state is RemoteProductLoaded) {
                return GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 254),
                  children: [
                    ...state.products.take(2).map((item) => ProductItem(
                          item: item,
                        )),
                  ],
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
