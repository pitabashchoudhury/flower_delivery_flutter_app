import 'package:flutter/material.dart';

class DrawerContent extends StatefulWidget {
  const DrawerContent({super.key, required this.title, required this.cities});

  final String title;
  final List<String> cities;

  @override
  State<DrawerContent> createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
  int count = 3;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.grey.shade700,
                ),
          ),
        ),
        Divider(
          thickness: 2,
          color: Colors.grey.shade200,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          // itemCount: StaticData.cities.length,
          itemCount: count,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                // tileColor: index % 2 == 0 ? Colors.red : Colors.green,
                title: Text(widget.cities[index]));
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            side: BorderSide(
              color: Colors.grey.shade300,
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignCenter,
            ),
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {
            setState(() {
              if (count == 3) {
                count = widget.cities.length;
              } else {
                count = 3;
              }
            });
          },
          child: Text(
            "Show more(17)",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.grey.shade800,
                ),
          ),
        ),
      ],
    );
  }
}
