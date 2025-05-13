import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phul_ecom_partner/blocs/homescreen/bloc/home_screen_bloc_bloc.dart';
import 'package:phul_ecom_partner/blocs/internetConnectivity/cubit/internetconnection_cubit.dart';
import 'package:phul_ecom_partner/blocs/topSeller/bloc/top_seller_bloc.dart';
import 'package:phul_ecom_partner/data/static_data/static_data.dart';
import 'package:phul_ecom_partner/utility/app_bar.dart';
import 'package:phul_ecom_partner/utility/app_drawer.dart';
import 'package:phul_ecom_partner/utility/logo_categpry_box.dart';
import 'package:phul_ecom_partner/widget/carousel.dart';
import 'package:phul_ecom_partner/widget/cities.dart';
import 'package:phul_ecom_partner/widget/flower_card.dart';
import 'package:phul_ecom_partner/widget/flower_category.dart';
import 'package:phul_ecom_partner/widget/home/curated_widget.dart';
import 'package:phul_ecom_partner/widget/search_widget.dart';
import 'package:upgrader/upgrader.dart';

class HomePage extends StatefulWidget {
  final String name = "homepage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String a = '';
  bool e = false;
  bool b = false;
  //int _counter = 0;
  //late Timer timer;
  @override
  void initState() {
    // getData(context);

    // _startTimer();
    getMe();
    super.initState();
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    //timer.cancel();
    super.dispose();
  }

  /// timer testing
  // void _startTimer() async {
  //   const Duration interval = Duration(seconds: 5); // Interval for the timer
  //   timer = Timer.periodic(interval, (Timer timer) async {
  //     // Show a SnackBar at regular intervals
  //     if (_counter == 5) {
  //       timer.cancel();
  //     } else {
  //       _showSnackBar();
  //     }
  //   });
  // }

  // void _showSnackBar() {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       dismissDirection: DismissDirection.horizontal,
  //       content: Text('SnackBar $_counter'),
  //       duration: const Duration(seconds: 2),
  //     ),
  //   );

  //   setState(() {
  //     _counter++;
  //   });
  // }

  /// timer testing
  getMe() async {
    context.read<HomeScreenBlocBloc>().add(const HomeScreenDataEvent());
  }

  getData(BuildContext context) async {
    setState(() {
      e = true;
    });
    Future.wait([
      getA(context),
      getB(),
    ]).then((List<dynamic> data) {
      setState(() {
        e = false;
        b = false;
      });
    }).catchError((error) {
      setState(() {
        e = false;
      });
    });
  }

  getDataRetry(BuildContext context) async {
    setState(() {
      e = true;
    });
    Future.wait([
      getA(context),
      getB(),
    ]).then((List<dynamic> data) {
      setState(() {
        e = false;
        b = false;
      });
    }).catchError((error) {
      setState(() {
        e = false;
      });
    });
  }

  Future<void> getA(BuildContext context) async {
    context.read<TopSellerBloc>().add(const TopSellerDataEvent());
    return Future.delayed(const Duration(seconds: 2), () {
      // return 1;
    });
  }

  Future<void> getB() async {
    Future.delayed(const Duration(seconds: 6), () {
      // return "wel come";
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              insetPadding: EdgeInsets.zero,
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Wel come to InterFlora",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Make Your Beloved Happy by presenting the token of love in the form of Flower Bouquet",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBlocBloc, HomeScreenBlocState>(
      builder: (context, state) {
        if (state is HomeScreenLoading) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/interflora-logo-desktop.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                  // const CircularProgressIndicator.adaptive(
                  //   backgroundColor: Colors.white,
                  // ),
                ],
              ),
            ),
          );
        } else if (state is HomeScreenBlocInitial) {
          return const SizedBox.shrink();
        } else {
          getB();
          return dataLoaded(context);
        }
      },
    );
    // if (e == true) {
    //   return Scaffold(
    //     backgroundColor: Colors.black,
    //     body: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Image.asset(
    //             "assets/interflora-logo-desktop.png",
    //             width: 100,
    //             height: 100,
    //             fit: BoxFit.fill,
    //           ),
    //           const CircularProgressIndicator.adaptive(
    //             backgroundColor: Colors.white,
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // } else if (b == true) {
    //   return Scaffold(
    //     backgroundColor: Colors.black,
    //     body: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Text(
    //             "Retry",
    //             style: Theme.of(context).textTheme.bodyMedium!.copyWith(
    //                   color: Colors.white,
    //                 ),
    //           ),
    //           InkWell(
    //             onTap: () {
    //               getDataRetry(context);
    //             },
    //             child: const Icon(
    //               Icons.restore_page,
    //               size: 50,
    //               color: Colors.white,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // } else {
    //   return dataLoaded(context);
    // }
  }

  BlocListener<InternetconnectionCubit, InternetconnectionState> dataLoaded(
      BuildContext context) {
    return BlocListener<InternetconnectionCubit, InternetconnectionState>(
      listener: (context, state) {
        if (state is InternetDisconnected) {
          context.pushNamed("noInternet");
        } else if (state is InternetConnected && state.count == 1) {
          if (context.canPop()) {
            context.pop();
          }
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Live")));
        }
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        onVerticalDragEnd: (DragEndDetails details) =>
            FocusManager.instance.primaryFocus?.unfocus(),
        child: UpgradeAlert(
          child: Scaffold(
            drawer: const MyDrawer(),
            appBar: MyAppBar.myApp(context),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonSearch(
                    function: (val) {
                      setState(() {
                        a = val;
                      });
                    },
                  ),
                  a != ''
                      ? Column(
                          children: const [
                            ListTile(
                              title: Text("wel come1"),
                            ),
                            ListTile(
                              title: Text("wel come2"),
                            ),
                            ListTile(
                              title: Text("wel come3"),
                            ),
                            ListTile(
                              title: Text("wel come4"),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: ClipRRect(
                      clipBehavior: Clip.none,
                      borderRadius: BorderRadius.circular(10.0),
                      child: GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                          childAspectRatio: 0.9,
                        ),
                        children: StaticData.logoCategory.map((e) {
                          return logoCategoryBox(context, e);
                        }).toList(),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Carousel(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      "Hand-delivered Across India",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: AvailableCity(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 0.0, right: 0.0, bottom: 8.0, top: 10),
                    child: FLowerLogo(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0, top: 10),
                    child: RichText(
                      text: TextSpan(
                        text: 'Top Sellers \n',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Floral arrangements on everyone's list",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black45,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: GridView(
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     shrinkWrap: true,
                  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 2,
                  //       mainAxisSpacing: 10,
                  //       crossAxisSpacing: 10,
                  //       childAspectRatio: 0.7,
                  //     ),
                  //     children: StaticData.topSellers.map((e) {
                  //       return FlowerCard(
                  //         topSeller: e,
                  //       );
                  //     }).toList(),
                  //   ),
                  // ),

                  BlocBuilder<TopSellerBloc, TopSellerState>(
                    builder: (context, state) {
                      if (state is TopSellerLoaded) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.topSeller.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.66,
                            ),
                            itemBuilder: (context, index) {
                              return FlowerCard(
                                voidCallback: () {
                                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  //     content: Text(StaticData.topSellers[index].title)));
                                  //context.pushNamed('top-seller');
                                  // context.goNamed(
                                  //   "top-seller",
                                  // );
                                  context.push(
                                    context.namedLocation("flower-detail",
                                        pathParameters: <String, String>{
                                          'name': state.topSeller[index].title
                                        },
                                        queryParameters: <String, String>{
                                          'heading':
                                              state.topSeller[index].title,
                                          'ratings':
                                              state.topSeller[index].ratings,
                                          'itemId': state.topSeller[index].id
                                              .toString(),
                                          'image': state.topSeller[index].image,
                                          'price': state.topSeller[index].price,
                                        }),
                                  );
                                },
                                topSeller: state.topSeller[index],
                              );
                            },
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),

                  /// Curated Collection
                  ///
                  const CuratedCollections(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
