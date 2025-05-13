import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phul_ecom_partner/blocs/topSeller/bloc/top_seller_bloc.dart';
import 'package:phul_ecom_partner/data/static_data/static_data.dart';
import 'package:phul_ecom_partner/service/topSeller/top_seller.dart';

import '../../../service/cities/available_city.dart';

part 'home_screen_bloc_event.dart';
part 'home_screen_bloc_state.dart';

class HomeScreenBlocBloc
    extends Bloc<HomeScreenBlocEvent, HomeScreenBlocState> {
  final TopSellerBloc topSellerBloc;
  HomeScreenBlocBloc(this.topSellerBloc) : super(HomeScreenBlocInitial()) {
    on<HomeScreenBlocEvent>((event, emit) {});
    on<HomeScreenDataEvent>(homeMethod);

    on<HomeScreenDataEmit>((event, emit) {
      // if (event.code == 1) {
      //   emit(const HomeScreenBlocLoaded(status: true));
      // } else {
      //   emit(const HomeScreenBlocLoaded(status: false));
      // }
    });

    // topSellerBloc.stream.listen((event) async {
    //   if (event is TopSellerLoaded) {
    //     blocA();
    //   } else {
    //     blocB();
    //   }
    // });
  }

  // void blocB() => emit(const HomeScreenBlocLoaded(status: false));

  // void blocA() => emit(const HomeScreenBlocLoaded(status: true));

  FutureOr<void> homeMethod(event, emit) async {
    emit(const HomeScreenLoading());
    // topSellerBloc.add(const TopSellerDataEvent());
    List<TopSeller> top = [];
    List<String> city = [];

    // this service is for testing purpose
    TopSellerService().fetchAddressList();
    //
    try {
      final futures = Future.wait([
        TopSellerService().fetchTopSellerList(),
        AvailableCity().fetchAvailableCity(),
      ]);

      final results = await futures;

      final top = results[0] as List<TopSeller>;
      final city = results[1] as List<String>;
      //  topSellerBloc.add(const TopSellerDataEvent());
      topSellerBloc.add(TopSellerDataEventHome(topSellerList: top));
      emit(
        HomeScreenBlocLoaded(
          status: false,
          availableCities: city,
          topSeller: top,
        ),
      );
    } catch (e) {
      emit(
        HomeScreenBlocLoaded(
          status: false,
          availableCities: city,
          topSeller: top,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    topSellerBloc.close();
    return super.close();
  }
}
