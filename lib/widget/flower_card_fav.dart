// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:phul_ecom_partner/data/static_data/static_data.dart';

class FavoriteFlowerCard extends StatefulWidget {
  const FavoriteFlowerCard(
      {Key? key, required this.topSeller, required this.voidCallback})
      : super(key: key);
  final TopSeller topSeller;
  final VoidCallback voidCallback;

  @override
  State<FavoriteFlowerCard> createState() => _FlowerCardState();
}

class _FlowerCardState extends State<FavoriteFlowerCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: widget.voidCallback,
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
                      widget.topSeller.image,
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
                    widget.topSeller.title,
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
                    '₹${widget.topSeller.price}',
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
                    widget.topSeller.ratings,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          //center: const Offset(130, 5),
          left: MediaQuery.of(context).size.width * 0.34,
          top: 5,
          //height: 0,

          child: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Wel Come")));
            },
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.red,
              size: 35,
            ),
          ),
        ),
        // Positioned.fromRect(
        //   rect: Rect.fromCenter(
        //     //center: const Offset(130, 5),
        //     center: Offset(MediaQuery.of(context).size.width * 0.34, 5),
        //     width: 0,
        //     height: 0,
        //   ),
        //   child: OutlinedButton(
        //     onPressed: () {
        //       ScaffoldMessenger.of(context)
        //           .showSnackBar(const SnackBar(content: Text("loading")));
        //     },
        //     child: const Icon(
        //       Icons.favorite_border_outlined,
        //       color: Colors.red,
        //       size: 35,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
