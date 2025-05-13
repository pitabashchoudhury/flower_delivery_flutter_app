// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:phul_ecom_partner/data/static_data/static_data.dart';

class FlowerCard extends StatelessWidget {
  const FlowerCard(
      {Key? key, required this.topSeller, required this.voidCallback})
      : super(key: key);
  final TopSeller topSeller;
  final VoidCallback voidCallback;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Card(
        elevation: 0.5,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // direction: Axis.vertical,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 160,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  topSeller.image,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 5.0, right: 0.0, bottom: 5.0),
              child: Text(
                topSeller.title,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 5.0, right: 0.0, bottom: 5.0),
              child: Text(
                '₹${topSeller.price}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                    ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 5.0, right: 0.0, bottom: 5.0),
              child: Text(
                topSeller.ratings,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
