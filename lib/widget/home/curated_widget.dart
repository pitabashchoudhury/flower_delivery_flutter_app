import 'package:flutter/material.dart';

class CuratedCollections extends StatelessWidget {
  const CuratedCollections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 8.0, right: 8.0, bottom: 8.0, top: 10),
          child: RichText(
            text: TextSpan(
              text: 'Curated Collections \n',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: "Use the language of flowers to send your love",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black45,
                      ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Image.network(
              "https://res.cloudinary.com/interflora/f_auto,q_auto/banners/same_day_delivery_collection_d_igp_collections_20230531.jpg",
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
              fit: BoxFit.fill,
            ),
          ),
        ),
        gridLayout(
            "https://res.cloudinary.com/interflora/f_auto,q_auto/banners/sustainable_edit_collection_d_igp_collections_20230531.jpg",
            "https://res.cloudinary.com/interflora/f_auto,q_auto/banners/dried_flowers_collection_d_igp_collections_20230531.jpg"),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 160,
          child: Image.network(
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
            "https://res.cloudinary.com/interflora/f_auto,q_auto/banners/handcrafted_hampers_collection_d_igp_collections_20230531.jpg",
            fit: BoxFit.fill,
            scale: 20.0,
          ),
        ),
        gridLayout(
            "https://res.cloudinary.com/interflora/f_auto,q_auto/banners/classic_collection_d_igp_collections_20230531.jpg",
            "https://res.cloudinary.com/interflora/f_auto,q_auto/banners/new_arrivals_collection_d_igp_collections_20230531.jpg"),
      ],
    );
  }

  GridView gridLayout(String img1, String img2) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 15,
        childAspectRatio: 1,
      ),
      children: [
        Image.network(
          img1,
        ),
        Image.network(
          img2,
        ),
      ],
    );
  }
}
