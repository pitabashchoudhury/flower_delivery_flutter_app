import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  final String name;
  final String email;
  final String addressLine_1;
  final String addressLine_2;
  final String city;
  final String state;
  final String country;
  final int zipCode;
  final int mobile;
  final int type;
  const AddressCard({
    super.key,
    required this.name,
    required this.email,
    required this.addressLine_1,
    required this.addressLine_2,
    required this.city,
    required this.state,
    required this.country,
    required this.zipCode,
    required this.mobile,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(00.0),
      ),
      elevation: 0.0,
      child: Container(
        decoration: const BoxDecoration(),
        //color: Colors.green,
        width: MediaQuery.of(context).size.width,
        child: ListTile(
          leading: const Icon(Icons.home),
          contentPadding: EdgeInsets.zero,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              Text("$addressLine_1-$addressLine_2"),
              Text("$city-$state"),
              Text("$country-$zipCode"),
              Row(
                children: [
                  const Icon(Icons.call_end_outlined),
                  Text(mobile.toString())
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.email_outlined),
                  Text(email),
                ],
              ),
              TextButton(onPressed: () {}, child: const Text("edit")),
            ],
          ),
          trailing: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
              width: MediaQuery.of(context).size.width * 0.2,
              height: 30,
              child: Center(child: Text(addressType(type)))),
        ),
      ),
    );
  }

  String addressType(int k) {
    switch (k) {
      case 0:
        return "Home";

      case 1:
        return "Office";
      case 2:
        return "Others";
      default:
        return "Home";
    }
  }
}
