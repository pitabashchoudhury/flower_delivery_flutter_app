import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phul_ecom_partner/data/static_data/static_data.dart';

InkWell logoCategoryBox(BuildContext context, LogoCategory logo) {
  return InkWell(
    onTap: () {
      // context.goNamed(
      //   "top-seller",
      // );
      context.go(context.namedLocation(
        "top-seller",
        queryParameters: <String, String>{'heading': logo.name},
      ));
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text(logo.name)));
    },
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 189, 189, 189),
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(10),
        // ),
      ),
      child: Wrap(
        runSpacing: 5,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: const Color.fromARGB(255, 217, 225, 241),
            //backgroundImage: AssetImage(path),
            child: Image.asset(
              logo.path,
              fit: BoxFit.fill, width: 40, height: 40, scale: 0.8,
              colorBlendMode: BlendMode.darken,

              // color: Colors.orangeAccent,
            ),
          ),
          Text(
            logo.name,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
