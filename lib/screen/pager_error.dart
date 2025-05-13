import 'package:flutter/material.dart';
import 'package:phul_ecom_partner/utility/app_drawer.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        elevation: 0.0,
        leading: const Icon(
          Icons.menu,
          size: 40,
        ),
        title: Image.asset(
          "assets/interflora-logo-desktop.png",
          width: 70,
          height: 40,
          fit: BoxFit.fill,
        ),
      ),
      body: const SafeArea(
        child: Center(
          child: Text("Page Not Found"),
        ),
      ),
    );
  }
}
