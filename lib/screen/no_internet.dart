import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:phul_ecom_partner/utility/app_bar.dart';
import 'package:phul_ecom_partner/utility/app_drawer.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: MyAppBar.myApp(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              'assets/no_internet.json',
              repeat: true,
              reverse: true,
              animate: true,
              delegates: LottieDelegates(
                values: [
                  ValueDelegate.color(
                    // keyPath order: ['layer name', 'group name', 'shape name']
                    const ['**', 'wave_2 Outlines', '**'],
                    value: Colors.orange,
                  ),
                ],
              ),
            ),
          ),
          Text(
            "No Internet",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
