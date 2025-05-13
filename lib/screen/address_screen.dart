import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phul_ecom_partner/blocs/address/bloc/useraddress_bloc.dart';
import 'package:phul_ecom_partner/utility/app_bar.dart';
import 'package:phul_ecom_partner/utility/app_drawer.dart';
import 'package:phul_ecom_partner/widget/address_card.dart';
import 'package:phul_ecom_partner/widget/address_container.dart';

class UserAddress extends StatefulWidget {
  const UserAddress({super.key});

  @override
  State<UserAddress> createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress> {
  final _formKey = GlobalKey<FormState>();
  int radio = 0;

  @override
  void initState() {
    fetchAddress();
    super.initState();
  }

  void fetchAddress() {
    context
        .read<UseraddressBloc>()
        .add(const UserAddressListEvent(userid: "122"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bottomnavbar(),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Icon(Icons.add),
          onPressed: () {
            openDialogFromMethod(context);
          },
        ),
        drawer: const MyDrawer(),
        appBar: MyAppBar.myApp(context),
        body: SingleChildScrollView(
          child: BlocBuilder<UseraddressBloc, UseraddressState>(
            builder: (context, state) {
              if (state is AddressLoaded) {
                return Column(
                  children: [
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.size,
                        itemBuilder: (context, index) {
                          return AddressCard(
                            email: state.addresses[index].email,
                            name: state.addresses[index].name,
                            addressLine_1: state.addresses[index].addressline_1,
                            addressLine_2:
                                state.addresses[index].addressline_2 ?? '',
                            city: state.addresses[index].city,
                            country: state.addresses[index].country,
                            state: state.addresses[index].state,
                            zipCode: state.addresses[index].zipCode,
                            mobile: state.addresses[index].mobile,
                            type: state.addresses[index].type,
                          );
                        }),
                  ],
                );
              } else {
                return const CircularProgressIndicator.adaptive();
              }
            },
          ),
        ));
  }

  BottomAppBar bottomnavbar() {
    return BottomAppBar(
      color: Colors.redAccent,
      shape: const CircularNotchedRectangle(), //shape of notch
      notchMargin: 5, //notche margin between floating button and bottom appbar
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.print,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.people,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  InkWell openDialog(BuildContext context) {
    return InkWell(
      onTap: () {
        openDialogFromMethod(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        color: Colors.green,
        child: const Center(
          child: Text("Add New Address"),
        ),
      ),
    );
  }

  Future<dynamic> openDialogFromMethod(BuildContext context) {
    return showDialog(
        // anchorPoint: Offset(-100, 80),
        context: context,
        builder: (_) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "close",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (radio != 0) {
                      Navigator.of(context).pop();

                      showDialog(
                          context: context,
                          builder: (_) {
                            return const AlertDialog(
                              content: Text("Address Added Successfully..."),
                            );
                          });
                    } else {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please Choose address type...')),
                      );
                    }
                  }
                },
                child: Text(
                  "submit",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text(
                        "Add Address",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("close"),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: MyAddressSection(
                        formState: _formKey,
                        send: (int k) {
                          radio = k;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
