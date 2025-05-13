import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phul_ecom_partner/blocs/homescreen/bloc/home_screen_bloc_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

class AvailableCity extends StatelessWidget {
  const AvailableCity({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBlocBloc, HomeScreenBlocState>(
      builder: (context, state) {
        if (state is HomeScreenBlocLoaded) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 5,
              children: state.availableCities.map((e) {
                return InkWell(
                  onTap: () {
                    // ScaffoldMessenger.of(context)
                    //     .showSnackBar(const SnackBar(content: Text("working")));
                    context.goNamed('login');
                  },
                  // child: Image.network(
                  //   e,
                  //   height: 100,
                  // ),
                  child: FadeInImage.memoryNetwork(
                    //e,
                    height: 100, image: e, placeholder: kTransparentImage,
                  ),
                );
              }).toList(),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
