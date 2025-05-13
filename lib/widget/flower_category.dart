import 'package:flutter/material.dart';
import 'package:phul_ecom_partner/data/static_data/static_data.dart';

class FLowerLogo extends StatelessWidget {
  const FLowerLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 5,
        children: StaticData.logoFlower.map((e) {
          return InkWell(
            onTap: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(e.name)));
            },
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              runSpacing: 5,
              spacing: 5,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  // backgroundColor: const Color.fromARGB(255, 217, 225, 241),
                  backgroundImage: NetworkImage(e.path),
                ),
                Text(
                  e.name,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 12,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
