import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phul_ecom_partner/blocs/topSeller/bloc/top_seller_bloc.dart';
import 'package:phul_ecom_partner/utility/app_bar.dart';
import 'package:phul_ecom_partner/utility/app_drawer.dart';
import 'package:phul_ecom_partner/widget/flower_card_fav.dart';

class MyFavoriteCollection extends StatefulWidget {
  const MyFavoriteCollection({super.key});

  @override
  State<MyFavoriteCollection> createState() => _MyFavoriteCollectionState();
}

class _MyFavoriteCollectionState extends State<MyFavoriteCollection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: MyAppBar.myApp(context),
      body: BlocBuilder<TopSellerBloc, TopSellerState>(
        builder: (context, state) {
          if (state is TopSellerLoaded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                // shrinkWrap: true,
                itemCount: state.topSeller.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.66,
                ),
                itemBuilder: (context, index) {
                  return FavoriteFlowerCard(
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
                              'heading': state.topSeller[index].title,
                              'ratings': state.topSeller[index].ratings,
                              'itemId': state.topSeller[index].id.toString(),
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
    );
  }
}
