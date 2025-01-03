import 'package:toko_rame/features/products/data/data_sources/remote/product_api_service.dart';
import 'package:toko_rame/features/products/data/models/product.dart';

class ProductApiServiceImpl implements ProductApiService {
  @override
  Future<List<ProductModel>> getProducts() {
    //give a timer to simulate the network delay
    return Future.delayed(const Duration(seconds: 2), () {
      return [
        const ProductModel(
          id: '1',
          name: 'Product 1',
          seller: 'Seller 1',
          description: 'Description 1',
          customerPrice: 100000,
          resellerPrice: 90000,
          image: [
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg'
          ],
          isNew: true,
          commision: 20,
          stock: 10,
          sizes: ['Paket 1', 'Paket 2'],
          colors: ['FF0000', '0000FF', '008000'],
        ),
        const ProductModel(
          id: '2',
          name: 'Product 2',
          seller: 'Seller 2',
          description: 'Description 2',
          customerPrice: 200000,
          resellerPrice: 180000,
          image: [
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg'
          ],
          isNew: true,
          commision: 20,
          stock: 20,
          sizes: ['Paket 1', 'Paket 2'],
          colors: ['FF0000', '0000FF', '008000'],
        ),
        const ProductModel(
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
        ),
        const ProductModel(
          id: '4',
          name: 'Product 4',
          seller: 'Seller 4',
          description: 'Description 4',
          customerPrice: 400000,
          resellerPrice: 360000,
          image: [
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg'
          ],
          isNew: false,
          commision: 25,
          stock: 40,
          sizes: ['Paket 1', 'Paket 2'],
          colors: ['FF0000', '0000FF', '008000'],
        ),
        const ProductModel(
          id: '5',
          name: 'Product 5',
          seller: 'Seller 5',
          description: 'Description 5',
          customerPrice: 500000,
          resellerPrice: 450000,
          image: [
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg'
          ],
          isNew: true,
          commision: 30,
          stock: 50,
          sizes: ['Paket 1', 'Paket 2'],
          colors: ['FF0000', '0000FF', '008000'],
        ),
        const ProductModel(
          id: '6',
          name: 'Product 6',
          seller: 'Seller 6',
          description: 'Description 6',
          customerPrice: 600000,
          resellerPrice: 540000,
          image: [
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
            'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg'
          ],
          isNew: false,
          commision: 35,
          stock: 60,
          sizes: ['Paket 1', 'Paket 2'],
          colors: ['FF0000', '0000FF', '008000'],
        ),
      ];
    });
  }

  @override
  Future<ProductModel> getProductDetail(String id) {
    List<ProductModel> products = [
      const ProductModel(
        id: '1',
        name: 'Product 1',
        seller: 'Seller 1',
        description: 'Description 1',
        customerPrice: 100000,
        resellerPrice: 90000,
        image: [
          'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
          'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
          'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
          'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg'
        ],
        isNew: true,
        commision: 20,
        stock: 10,
        sizes: ['Paket 1', 'Paket 2'],
        colors: ['FF0000', '0000FF', '008000'],
      ),
      const ProductModel(
        id: '2',
        name: 'Product 2',
        seller: 'Seller 2',
        description: 'Description 2',
        customerPrice: 200000,
        resellerPrice: 180000,
        image: [
          'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
          'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
          'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg',
          'https://asset.kompas.com/crops/mYjxtrLJrYGSUXELuF5Qo7N7Xuw=/0x0:1000x667/1200x800/data/photo/2022/05/28/62922b221dd75.jpg'
        ],
        isNew: false,
        commision: 20,
        stock: 20,
        sizes: ['Paket 1', 'Paket 2'],
        colors: ['FF0000', '0000FF', '008000'],
      ),
      const ProductModel(
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
      ),
    ];

    //give a timer to simulate the network delay
    return Future.delayed(const Duration(seconds: 2), () {
      return products.firstWhere((element) => element.id == id);
    });
  }
}
