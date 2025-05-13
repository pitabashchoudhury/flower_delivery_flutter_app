import 'package:flutter/material.dart';

class SelectDate extends StatefulWidget {
  const SelectDate({super.key});

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Select Date",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
        ),
        const SizedBox(
          height: 15,
        ),
        GridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: 2.4,
            ),
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 189, 189, 189),
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                  // borderRadius: const BorderRadius.only(
                  //   topLeft: Radius.circular(10),
                  // ),
                ),
                child: const Center(child: Text("Today,18 Jul")),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 189, 189, 189),
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                  // borderRadius: const BorderRadius.only(
                  //   topLeft: Radius.circular(10),
                  // ),
                ),
                child: const Center(child: Text("Tomorrow,19 Jul")),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 189, 189, 189),
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                  // borderRadius: const BorderRadius.only(
                  //   topLeft: Radius.circular(10),
                  // ),
                ),
                child: Center(
                  child: OutlinedButton(
                    onPressed: () async {
                      DateTime? s = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(
                          const Duration(days: 10),
                        ),
                        helpText: "Select Delivery Date",
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: Colors.black,
                                onPrimary: Colors.white,
                                onSurface: Colors.black,
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Colors.black, // button text color
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                    },
                    child: const Text("Select Date"),
                  ),
                ),
              ),
            ]),
      ],
    );
  }
}
