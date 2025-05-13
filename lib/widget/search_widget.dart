import 'package:flutter/material.dart';

class CommonSearch extends StatefulWidget {
  const CommonSearch({super.key, required this.function});
  final Function(String val) function;

  @override
  State<CommonSearch> createState() => _CommonSearchState();
}

class _CommonSearchState extends State<CommonSearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextField(
          onChanged: widget.function,
          onTap: () {},
          decoration: InputDecoration(
            suffixIcon: const Icon(
              Icons.search_sharp,
              color: Colors.grey,
              size: 25,
            ),
            hintText: "Search for blooms",
            hintStyle: const TextStyle(
              fontStyle: FontStyle.italic,
            ),
            isDense: true,
            filled: true,
            fillColor: Colors.grey.shade300,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.grey.shade100,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
