import 'package:flutter/material.dart';
import 'package:phul_ecom_partner/widget/form_text_field_checkout.dart';
//import 'package:flutter_form_builder/flutter_form_builder.dart';

class MyAddressSection extends StatefulWidget {
  const MyAddressSection(
      {super.key, required this.formState, required this.send});
  final GlobalKey<FormState> formState;
  final Function(int) send;
  @override
  State<MyAddressSection> createState() => _MyAddressSectionState();
}

class _MyAddressSectionState extends State<MyAddressSection> {
  int gender = 0;
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: sWidth,
      child: Form(
        key: widget.formState,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// name
            const FormTextField(
              hintText: 'Full Name',
              label: 'Enter Full Name',
              textType: TextInputType.name,
              validator: 'Please enter Full Name',
            ),
            const SizedBox(
              height: 10,
            ),

            /// country
            const FormTextField(
              hintText: 'Enter Country',
              label: 'Country',
              textType: TextInputType.text,
              validator: 'Please enter Country',
            ),

            const SizedBox(
              height: 10,
            ),

            /// pincode
            const FormTextField(
              validator: "Please enter pincode'",
              textType: TextInputType.number,
              label: "Pincode/Zipcode",
              hintText: "Enter Pincode/Zipcode",
            ),

            const SizedBox(
              height: 10,
            ),

            /// city
            const FormTextField(
              hintText: "City",
              label: 'City',
              textType: null,
              validator: 'City loading failed',
            ),

            const SizedBox(
              height: 10,
            ),

            /// state
            const FormTextField(
              validator: "loading state failed",
              textType: null,
              label: "State",
              hintText: "State",
            ),

            const SizedBox(
              height: 10,
            ),

            /// address line-1

            const FormTextField(
              validator: "Please enter Address",
              textType: TextInputType.streetAddress,
              label: "Address Line - 1",
              hintText: "Apartment/Unit/Building/Floor etc.",
            ),

            const SizedBox(
              height: 10,
            ),

            /// address line-2
            const FormTextField(
              validator: null,
              textType: TextInputType.streetAddress,
              label: "Address Line - 2",
              hintText: "Street Name, P.O. Box",
            ),

            const SizedBox(
              height: 10,
            ),

            /// mobile number
            const FormTextField(
              validator: "Please enter contact number",
              textType: TextInputType.number,
              label: "Mobile Number",
              hintText: "Enter Mobile Number",
            ),

            const SizedBox(
              height: 10,
            ),

            /// alternative mobile number
            const FormTextField(
              validator: null,
              textType: TextInputType.number,
              label: "Alternative Number",
              hintText: "Alternative Number (Optional)",
            ),

            const SizedBox(
              height: 10,
            ),

            /// email
            const FormTextField(
              validator: "Please enter Email Address",
              textType: TextInputType.emailAddress,
              label: "Email ID *",
              hintText: "Recipient Email Id",
            ),

            const SizedBox(
              height: 10,
            ),
            Text(
              "Address Type *",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
            ),

            /// radio button
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: RadioListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    title: const Text("Home"),
                    value: 1,
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value ?? 0;
                      });
                      widget.send(value ?? 0);
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    title: const Text("Office"),
                    value: 2,
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value ?? 0;
                      });
                      widget.send(value ?? 0);
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    title: const Text("Other"),
                    value: 3,
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value ?? 0;
                      });
                      widget.send(value ?? 0);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
