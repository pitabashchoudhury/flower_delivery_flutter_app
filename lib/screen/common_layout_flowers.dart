import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phul_ecom_partner/data/static_data/static_data.dart';
import 'package:phul_ecom_partner/utility/app_bar.dart';
import 'package:phul_ecom_partner/utility/app_drawer.dart';
import 'package:phul_ecom_partner/widget/flower_card.dart';

class CommonFlowerPlatforms extends StatefulWidget {
  const CommonFlowerPlatforms({super.key, required this.heading});
  final String heading;
  @override
  State<CommonFlowerPlatforms> createState() => _CommonFlowerPlatformsState();
}

class _CommonFlowerPlatformsState extends State<CommonFlowerPlatforms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: MyAppBar.myApp(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(widget.heading),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: StaticData.topSellers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.66,
                ),
                itemBuilder: (context, index) {
                  return FlowerCard(
                    voidCallback: () {
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //     content: Text(StaticData.topSellers[index].title)));

                      context.go(
                        context.namedLocation("flower-detail",
                            pathParameters: <String, String>{
                              'name': StaticData.topSellers[index].title,
                            },
                            queryParameters: <String, String>{
                              'heading': widget.heading,
                              'ratings': StaticData.topSellers[index].ratings,
                              'itemId':
                                  StaticData.topSellers[index].id.toString(),
                              'image': StaticData.topSellers[index].image,
                              'price': StaticData.topSellers[index].price,
                            }),
                      );
                    },
                    topSeller: StaticData.topSellers[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
