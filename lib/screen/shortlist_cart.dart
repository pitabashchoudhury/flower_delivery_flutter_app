import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phul_ecom_partner/blocs/cart/bloc/addtocart_bloc.dart';
import 'package:phul_ecom_partner/blocs/internetConnectivity/cubit/internetconnection_cubit.dart';
import 'package:phul_ecom_partner/utility/app_bar.dart';
import 'package:phul_ecom_partner/utility/app_drawer.dart';
import 'package:phul_ecom_partner/utility/calculation/add_to_cart_price.dart';
import 'package:phul_ecom_partner/widget/add_to_cart_container.dart';

class AddToCardList extends StatefulWidget {
  const AddToCardList({super.key});

  @override
  State<AddToCardList> createState() => _AddToCardListState();
}

class _AddToCardListState extends State<AddToCardList> {
  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    //final sHeight = MediaQuery.of(context).size.width * 0.8;
    return BlocBuilder<AddtocartBloc, AddtocartState>(
      builder: (context, state) {
        if (state is Addtocart) {
          return Scaffold(
            drawer: const MyDrawer(),
            appBar: MyAppBar.myApp(context),
            body:
                BlocListener<InternetconnectionCubit, InternetconnectionState>(
              listener: (context, state) {
                if (state is InternetDisconnected) {
                  context.pushNamed("noInternet");
                } else if (state is InternetConnected && state.count == 1) {
                  if (context.canPop()) {
                    context.pop();
                  }
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Live")));
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.2,
                      color: const Color.fromARGB(255, 244, 228, 233),
                      child: Center(
                        child: Text(
                          "Shopping Cart",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          return AddToContainer(
                            sWidth: sWidth,
                            topSeller: state.items[index],
                          );
                        }),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              width: sWidth,
              height: 120,
              // color: Color.fromRGBO(202, 173, 89, 1),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: [
                                Text(
                                  "Total Products:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  "${state.items.length}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Expanded(
                            child: Wrap(
                              children: [
                                Text(
                                  "Total Amount:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  "₹ ${AddToCartPrice.totalPrice(state.items)}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: SizedBox(
                        width: sWidth,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(202, 173, 89, 1),
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                            ),
                          ),
                          onPressed: () {
                            context.push(
                                context.namedLocation("proceed-to-checkout"));
                          },
                          child: Text(
                            "PROCEED TO CHECKOUT",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(child: Text("nothing")),
          );
        }
      },
    );
  }
}
