import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:toko_rame/core/theme/app_font.dart';
import 'package:toko_rame/features/products/domain/entities/product.dart';
import 'package:toko_rame/features/products/presentation/bloc/product/remote/remote_product_bloc.dart';
import 'package:toko_rame/features/products/presentation/widgets/product_item.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RemoteProductBloc>(context).add(GetRemoteProducts());
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              "Products",
              style: AppTextStyles.title3,
            ),
            BlocBuilder<RemoteProductBloc, RemoteProductState>(
              builder: (context, state) {
                if (state is RemoteProductLoading) {
                  // return const Center(
                  //   child: CircularProgressIndicator(),
                  // );

                  List<ProductEntity> products = List.filled(
                      6,
                      const ProductEntity(
                        id: '3',
                        name: 'Product 3',
                        seller: 'Seller 3',
                        description: 'Description 3',
                        customerPrice: 300000,
                        resellerPrice: 270000,
                        image: [
                          'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
                          'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
                          'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
                          'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg'
                        ],
                        isNew: true,
                        commision: 20,
                        stock: 30,
                        sizes: ['Paket 1', 'Paket 2'],
                        colors: ['FF0000', '0000FF', '008000'],
                      ));
                  return GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            mainAxisExtent: 254),
                    children: [
                      ...products.map((item) => Skeletonizer(
                            child: ProductItem(
                              item: item,
                            ),
                          )),
                    ],
                  );
                }
                if (state is RemoteProductLoaded) {
                  return GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            mainAxisExtent: 254),
                    children: [
                      ...state.products.map((item) => ProductItem(
                            item: item,
                          )),
                    ],
                  );
                }

                return const Center(
                  child: Text('Products Page'),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
