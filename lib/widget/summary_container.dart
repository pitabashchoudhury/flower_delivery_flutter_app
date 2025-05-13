import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phul_ecom_partner/blocs/cart/bloc/addtocart_bloc.dart';
import 'package:phul_ecom_partner/data/model/add_cart_model.dart';
import 'package:phul_ecom_partner/data/static_data/static_data.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({super.key});

  @override
  State<OrderSummary> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    // final sHeight = MediaQuery.of(context).size.height;
    // ScrollController ctr = ScrollController();

    return BlocBuilder<AddtocartBloc, AddtocartState>(
      builder: (context, state) {
        if (state is Addtocart) {
          return SizedBox(
            width: sWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  width: sWidth,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Contact Details *",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                            ),
                            const Text(
                              "(pitabash choudhdry, 9583871974)",
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  width: sWidth,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    leading: const Icon(
                      Icons.stacked_bar_chart_outlined,
                      size: 30,
                    ),
                    title: Text(
                      "Add a Personalized Message",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    // trailing: TextButton(
                    //   onPressed: () {
                    //     ctr.animateTo(10 * 100,
                    //         duration: const Duration(milliseconds: 1000),
                    //         curve: Curves.bounceIn);
                    //   },
                    //   child: const Text("compose"),
                    // ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: sWidth,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Summary",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.black,
                              //  fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Total:',
                            style:
                                Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: Colors.black,
                                      // fontSize: 20,
                                    ),
                            children: [
                              TextSpan(
                                text: '₹ 15000',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      // fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  width: sWidth,
                  //height: 120,
                  child: ListView.separated(
                    // controller: ctr,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return summaryproduct(
                          sWidth, context, state.items[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10.0,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0.0),
                  leading: const Icon(Icons.gif_box_outlined),
                  title: RichText(
                    text: TextSpan(
                        text: 'Have a coupon code?',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.black,
                              // fontSize: 20,
                            ),
                        children: [
                          TextSpan(
                            text: ' Apply here',
                            style:
                                Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: Colors.blue,
                                      // fontSize: 20,
                                    ),
                          ),
                        ]),
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0.0),
                  leading: const Icon(Icons.percent_outlined),
                  title: RichText(
                    text: TextSpan(
                        text: 'Have a gift voucher?',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.black,
                              // fontSize: 20,
                            ),
                        children: [
                          TextSpan(
                            text: ' Redeem',
                            style:
                                Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: Colors.blue,
                                      // fontSize: 20,
                                    ),
                          ),
                        ]),
                  ),
                ),
                billingDetails(sWidth, context),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Message Card 🎁",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 20,
                      ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  width: sWidth,
                  height: 50,
                  child: ListView.separated(
                    //controller: ctr,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: StaticData.gifts.length,
                    itemBuilder: (context, index) {
                      return Chip(
                        label: Text(
                          StaticData.gifts[index].gift,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Container billingDetails(double sWidth, BuildContext context) {
    return Container(
      color: Colors.white,
      width: sWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Billing Details",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                ),
          ),
          const Divider(
            height: 10,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Total items"),
                Text("5"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Sub Total"),
                Text("₹ 15000"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Discount"),
                Text("₹ 1000"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Shipping Charges"),
                Text("Free"),
              ],
            ),
          ),
          const Divider(
            height: 10,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Amount:",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                ),
                Text(
                  "₹ 14000",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container summaryproduct(
      double sWidth, BuildContext context, Carting carting) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      // color: Colors.white,
      padding: const EdgeInsets.all(4.0),
      width: sWidth,
      //height: 140,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  carting.image,
                  height: 80,
                  width: 80,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    //height: 80,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          carting.title,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          "Qty. ${carting.size}",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  "₹ ${carting.price}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: 'Standard by ',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey,
                                    // fontSize: 20,
                                  ),
                          children: [
                            TextSpan(
                              text: '07-aug-2023 ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.black,
                                    // fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ]),
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'between ',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey,
                                    // fontSize: 20,
                                  ),
                          children: [
                            TextSpan(
                              text: '20:00 hrs - 21:00 hrs ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.black,
                                    // fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ]),
                    ),
                  ],
                ),
                const Icon(Icons.info_outline),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
