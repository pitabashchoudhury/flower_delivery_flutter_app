import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phul_ecom_partner/blocs/cart/bloc/addtocart_bloc.dart';
import 'package:phul_ecom_partner/constant/global_constant.dart';
import 'package:phul_ecom_partner/data/model/add_cart_model.dart';

class AddToContainer extends StatefulWidget {
  const AddToContainer({
    Key? key,
    required this.sWidth,
    required this.topSeller,
  }) : super(key: key);

  final double sWidth;
  final Carting topSeller;

  @override
  State<AddToContainer> createState() => _AddToContainerState();
}

class _AddToContainerState extends State<AddToContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.sWidth,
      // height: sHeight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flex(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.horizontal,
              children: [
                Image.network(
                  widget.topSeller.image,
                  fit: BoxFit.fill,
                  width: 140,
                  height: 140,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.topSeller.title,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16,
                                  ),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "₹ ${widget.topSeller.price}",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 14,
                                  ),
                        ),
                        Text(
                          "Standard- Free",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                        ),
                        Text(
                          "by 28-Jul-2023 \n17:00 HRS - 21:00 HRS",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ),
                        ),
                        Text(
                          "Pincode: 560055",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    context.read<AddtocartBloc>().add(
                          RemoveFromCartData(
                            topSeller: Carting(
                              id: widget.topSeller.id,
                              title: widget.topSeller.title,
                              price: widget.topSeller.price,
                              ratings: widget.topSeller.ratings,
                              image: widget.topSeller.image,
                              size: 1,
                              totalAmount: 1 *
                                  (int.parse(widget.topSeller.price)).toInt(),
                            ),
                          ),
                        );
                  },
                  child: Row(
                    children: [
                      Text(
                        "Delete",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      const Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                const Spacer(),
                const Text(
                  "|",
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        "Move to favorite",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Text("|"),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    //color: Colors.grey,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          padding: const EdgeInsets.all(0.0),
                          icon: const Icon(
                            Icons.remove,
                          ),
                          onPressed: (ConstantData.mimumOrder ==
                                  widget.topSeller.size)
                              ? null
                              : () {
                                  context.read<AddtocartBloc>().add(
                                        DecreaseItem(
                                          topSeller: Carting(
                                            id: widget.topSeller.id,
                                            title: widget.topSeller.title,
                                            price: widget.topSeller.price,
                                            ratings: widget.topSeller.ratings,
                                            image: widget.topSeller.image,
                                            size: 1,
                                            totalAmount: 1 *
                                                (int.parse(
                                                        widget.topSeller.price))
                                                    .toInt(),
                                          ),
                                        ),
                                      );
                                },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.topSeller.size.toString()),
                        ),
                        IconButton(
                          padding: const EdgeInsets.all(0.0),
                          icon: const Icon(Icons.add),
                          onPressed: (ConstantData.highestOrder ==
                                  widget.topSeller.size)
                              ? null
                              : () {
                                  context.read<AddtocartBloc>().add(
                                        IncreaseItem(
                                          topSeller: Carting(
                                            id: widget.topSeller.id,
                                            title: widget.topSeller.title,
                                            price: widget.topSeller.price,
                                            ratings: widget.topSeller.ratings,
                                            image: widget.topSeller.image,
                                            size: 1,
                                            totalAmount: 1 *
                                                (int.parse(
                                                        widget.topSeller.price))
                                                    .toInt(),
                                          ),
                                        ),
                                      );
                                },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
