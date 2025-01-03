import 'package:flutter/material.dart';
import 'package:toko_rame/config/routes/app_router.dart';
import 'package:toko_rame/features/products/presentation/bloc/product/remote/remote_product_bloc.dart';
import 'package:toko_rame/features/products/presentation/bloc/product_detail/remote/remote_product_detail_bloc.dart';
import 'package:toko_rame/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteProductBloc>(
            create: (context) => RemoteProductBloc(
                  sl(),
                )),
        BlocProvider<RemoteProductDetailBloc>(
            create: (context) => RemoteProductDetailBloc(
                  sl(),
                )),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // scaffoldBackgroundColor: lightBackgroundColor,
        ),
        title: 'Toko Rame',
      ),
    );
  }
}
