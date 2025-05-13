import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phul_ecom_partner/blocs/address/bloc/useraddress_bloc.dart';
import 'package:phul_ecom_partner/blocs/cart/bloc/addtocart_bloc.dart';
import 'package:phul_ecom_partner/blocs/homescreen/bloc/home_screen_bloc_bloc.dart';
import 'package:phul_ecom_partner/blocs/internetConnectivity/cubit/internetconnection_cubit.dart';
import 'package:phul_ecom_partner/blocs/topSeller/bloc/top_seller_bloc.dart';
import 'package:phul_ecom_partner/blocs/userSession/bloc/userdata_bloc.dart';
import 'package:phul_ecom_partner/router/routes.dart';

void main() {
  runApp(
    // MultiBlocProvider(
    //   providers: [
    //     BlocProvider<InternetconnectionCubit>(
    //       create: (context) => InternetconnectionCubit(Connectivity(), 0),
    //     ),
    //     BlocProvider<AddtocartBloc>(
    //       create: (context) => AddtocartBloc(),
    //     ),
    //     BlocProvider<TopSellerBloc>(
    //       create: (context) => TopSellerBloc(),
    //     ),
    //     BlocProvider(create: (create)=>HomeScreenBlocBloc())
    //   ],
    //   child: const MyApp(),
    // ),

    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetconnectionCubit>(
          create: (context) => InternetconnectionCubit(Connectivity(), 0),
        ),
        BlocProvider<AddtocartBloc>(
          create: (context) => AddtocartBloc(),
        ),
        BlocProvider<TopSellerBloc>(
          create: (context) => TopSellerBloc(),
        ),
        BlocProvider(
          create: (context) {
            return HomeScreenBlocBloc(context.read<TopSellerBloc>());
          },
        ),
        BlocProvider(create: (context) {
          return UserdataBloc();
        }),
        BlocProvider(create: (context) {
          return UseraddressBloc();
        }),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flora',
        routerConfig: AppRouter.router,
        // routerDelegate: AppRouter.router.routerDelegate,
        // routeInformationParser: AppRouter.router.routeInformationParser,
        // routeInformationProvider: AppRouter.router.routeInformationProvider,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            color: Colors.black,
          ),
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
