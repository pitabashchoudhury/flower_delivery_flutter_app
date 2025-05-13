import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phul_ecom_partner/utility/app_bar.dart';
import 'package:phul_ecom_partner/utility/app_drawer.dart';
import 'package:phul_ecom_partner/widget/address_container.dart';
import 'package:phul_ecom_partner/widget/payment_section.dart';
import 'package:phul_ecom_partner/widget/summary_container.dart';

import '../blocs/internetConnectivity/cubit/internetconnection_cubit.dart';
import '../constant/global_constant.dart';

class ProceedToCheckOut extends StatefulWidget {
  const ProceedToCheckOut({super.key});

  @override
  State<ProceedToCheckOut> createState() => _ProceedToCheckOutState();
}

class _ProceedToCheckOutState extends State<ProceedToCheckOut> {
  int _index = 0;
  final _formKey = GlobalKey<FormState>();
  int radio = 0;
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetconnectionCubit, InternetconnectionState>(
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
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        onVerticalDragEnd: (DragEndDetails details) =>
            FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          drawer: const MyDrawer(),
          appBar: MyAppBar.myApp(context),
          body: ListView(
            padding: EdgeInsets.zero,
            // controller: _scroll,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 0.0),
                  child: Text(
                    "CHECKOUT",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colors.transparent,
                child: Stepper(
                  elevation: 0.0,
                  margin: const EdgeInsets.all(0.0),
                  physics: const ClampingScrollPhysics(),
                  type: StepperType.horizontal,
                  currentStep: _index,
                  steps: <Step>[
                    Step(
                      label: const Text('Delivery Details'),
                      title: const Text(''),
                      content: MyAddressSection(
                        formState: _formKey,
                        send: (int k) {
                          radio = k;
                        },
                      ),
                      isActive:
                          _checkState(0) == StepState.complete ? false : true,
                      state: _checkState(0),
                    ),
                    Step(
                      title: const Text(''),
                      label: const Text('OrderSummary'),
                      content: const OrderSummary(),
                      isActive: _index == 1,
                      state: _checkState(1),
                    ),
                    Step(
                      title: const Text(''),
                      label: const Text('Payment'),
                      content: const PaymentOption(),
                      // isActive: _checkState(2) == StepState.complete ? false : true,
                      isActive: _index >= 2,
                      state: _checkState(2),
                    ),
                  ],
                  controlsBuilder: (context, details) {
                    if (details.currentStep == 0) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsConstant.backgroundButtonColor,
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (radio != 0) {
                              if (_index == 0) {
                                setState(() {
                                  _index = _index + 1;
                                });
                              } else {
                                null;
                              }
                            } else {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Please Choose address type...')),
                              );
                            }
                          }
                        },
                        child: Text(
                          "Save Address",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                        ),
                      );
                    } else if (details.currentStep == 1) {
                      return ElevatedButton(
                          onPressed: () {
                            //  if (_index == 0) {
                            //   setState(() {
                            //     _index = _index + 1;
                            //   });
                            // } else {
                            //   null;
                            // }

                            setState(() {
                              _index = _index + 1;
                            });
                          },
                          child: const Text("Check Summary"));
                    } else {
                      return ElevatedButton(
                        onPressed: () {
                          // setState(() {
                          //   _index = _index + 1;
                          // });
                        },
                        child: const Text("Make Payment"),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _checkState(int i) {
    if (_index > i) {
      return StepState.complete;
    } else if (_index == i) {
      return StepState.editing;
    } else {
      return StepState.indexed;
    }
  }
}
