import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:toko_rame/features/products/domain/entities/product.dart';
import 'package:toko_rame/features/products/presentation/bloc/product_detail/remote/remote_product_detail_bloc.dart';
import 'package:toko_rame/features/products/presentation/widgets/product_detail_section.dart';
import 'package:toko_rame/features/products/presentation/widgets/other_products_from_same_seller.dart';
import 'package:toko_rame/features/products/presentation/widgets/product_description_section.dart';
import 'package:toko_rame/features/products/presentation/widgets/product_detail_action_bar.dart';
import 'package:toko_rame/features/products/presentation/widgets/product_detail_bottom_action_bar.dart';
import 'package:toko_rame/features/products/presentation/widgets/product_detail_carousel_pagination.dart';
import 'package:toko_rame/features/products/presentation/widgets/product_options_section.dart';
import 'package:toko_rame/features/products/presentation/widgets/similar_products.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final CarouselSliderController carouselController =
      CarouselSliderController();
  int currentIndex = 0;
  int currentSizeIndex = 0;
  int currentColorIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<RemoteProductDetailBloc>().add(
          GetRemoteProductDetail(widget.productId),
        );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        context.pop();
      },
      child: Scaffold(
        body: BlocBuilder<RemoteProductDetailBloc, RemoteProductDetailState>(
          builder: (context, state) {
            if (state is RemoteProductDetailLoading) {
              ProductEntity product = const ProductEntity(
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
              );

              return Skeletonizer(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          // Bagian gambar yang sedikit menutupi konten
                          Stack(
                            children: [
                              CarouselSlider(
                                items: [
                                  ...product.image!.map(
                                    (content) => Container(
                                      height: 376, // Tinggi gambar
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              content), // URL gambar
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                options: CarouselOptions(
                                    height: 376,
                                    viewportFraction: 1,
                                    enableInfiniteScroll: true,
                                    autoPlay: true,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        currentIndex = index;
                                      });
                                    }),
                                carouselController: carouselController,
                              ),
                              ProductDetailCarousePagination(
                                currentIndex: currentIndex,
                                product: product,
                              ),
                              Positioned(
                                top:
                                    356, // Posisi konten, menumpuk sedikit pada gambar
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Konten scrollable di bawah gambar
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                ProductDetailSection(
                                  product: product,
                                ),
                                const SizedBox(height: 18),
                                ProductOptionsSection(
                                  product: product,
                                  currentColorIndex: currentColorIndex,
                                  currentSizeIndex: currentSizeIndex,
                                  onColorChange: (index) {
                                    setState(() {
                                      currentColorIndex = index;
                                    });
                                  },
                                  onSizeChange: (index) {
                                    setState(() {
                                      currentSizeIndex = index;
                                    });
                                  },
                                ),
                                const SizedBox(height: 18),
                                const ProductDescriptionSection(),
                                const OtherProductsFromSameSeller(),
                                const SimilarProducts(),
                                const SizedBox(
                                  height: 80,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const ProductDetailBottomActionBar(),
                    const ProductDetailActionBar(),
                  ],
                ),
              );
            }
            if (state is RemoteProductDetailLoaded) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        // Bagian gambar yang sedikit menutupi konten
                        Stack(
                          children: [
                            CarouselSlider(
                              items: [
                                ...state.product.image!.map(
                                  (content) => Container(
                                    height: 376, // Tinggi gambar
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            NetworkImage(content), // URL gambar
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              options: CarouselOptions(
                                  height: 376,
                                  viewportFraction: 1,
                                  enableInfiniteScroll: true,
                                  autoPlay: true,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  }),
                              carouselController: carouselController,
                            ),
                            ProductDetailCarousePagination(
                              currentIndex: currentIndex,
                              product: state.product,
                            ),
                            Positioned(
                              top:
                                  356, // Posisi konten, menumpuk sedikit pada gambar
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Konten scrollable di bawah gambar
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              ProductDetailSection(
                                product: state.product,
                              ),
                              const SizedBox(height: 18),
                              ProductOptionsSection(
                                product: state.product,
                                currentColorIndex: currentColorIndex,
                                currentSizeIndex: currentSizeIndex,
                                onColorChange: (index) {
                                  setState(() {
                                    currentColorIndex = index;
                                  });
                                },
                                onSizeChange: (index) {
                                  setState(() {
                                    currentSizeIndex = index;
                                  });
                                },
                              ),
                              const SizedBox(height: 18),
                              const ProductDescriptionSection(),
                              const OtherProductsFromSameSeller(),
                              const SimilarProducts(),
                              const SizedBox(
                                height: 80,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const ProductDetailBottomActionBar(),
                  const ProductDetailActionBar(),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
