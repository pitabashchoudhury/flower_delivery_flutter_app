import 'package:flutter/material.dart';

class PaymentOption extends StatefulWidget {
  const PaymentOption({super.key});

  @override
  State<PaymentOption> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PaymentOption> {
  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: sWidth,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Amount :",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    "₹ 14000",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              //color: Colors.green,
              width: sWidth,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: RadioListTile(
                subtitle: const Text("Best payment option"),
                activeColor: Colors.green,
                dense: true,
                contentPadding: const EdgeInsets.all(0.0),
                title: const Text("RazorPay"),
                value: 1,
                groupValue: 1,
                onChanged: (value) {
                  setState(() {
                    // gender = value ?? 0;
                  });
                  //  widget.send(value ?? 0);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              //color: Colors.green,
              width: sWidth,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: RadioListTile(
                subtitle: const Text("Best payment option"),
                activeColor: Colors.green,
                dense: true,
                contentPadding: const EdgeInsets.all(0.0),
                title: const Text("PayU"),
                value: 1,
                groupValue: 1,
                onChanged: (value) {
                  setState(() {
                    // gender = value ?? 0;
                  });
                  //  widget.send(value ?? 0);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
