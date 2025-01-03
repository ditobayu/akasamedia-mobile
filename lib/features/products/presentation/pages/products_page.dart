import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_rame/core/theme/app_font.dart';
import 'package:toko_rame/features/products/presentation/bloc/product/remote/remote_product_bloc.dart';
import 'package:toko_rame/ui/widgets/buttons.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RemoteProductBloc>(context).add(GetRemoteProducts());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: BlocBuilder<RemoteProductBloc, RemoteProductState>(
        builder: (context, state) {
          if (state is RemoteProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is RemoteProductLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 254),
                children: [
                  ...state.products.map((item) => GestureDetector(
                        onTap: () {
                          context.push('/product/${item.id}');
                        },
                        child: SizedBox(
                          height: 254,
                          child: Column(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Harga Reseller",
                                        style: AppTextStyles.tinyNoneRegular,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "Rp${item.resellerPrice!.toInt()}",
                                        style: AppTextStyles.smallNormalBold
                                            .copyWith(
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("${item.stock} pcs",
                                          style: AppTextStyles.tinyNoneRegular),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              CustomFilledButton(
                                title: "Bagikan Produk",
                                onPressed: () {},
                                textStyle: AppTextStyles.xSmallNoneRegular,
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            );
          }

          return const Center(
            child: Text('Products Page'),
          );
        },
      ),
    );
  }
}