import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:phul_ecom_partner/data/static_data/static_data.dart';
import 'package:phul_ecom_partner/service/topSeller/top_seller.dart';
part 'top_seller_event.dart';
part 'top_seller_state.dart';

class TopSellerBloc extends Bloc<TopSellerEvent, TopSellerState> {
  TopSellerBloc() : super(TopSellerInitial()) {
    // add(const TopSellerDataEvent());
    on<TopSellerEvent>((event, emit) {});
    on<TopSellerDataEvent>(fetchTopSeller);
    on<TopSellerDataEventHome>(fetchDataFromHomeBloc);
  }

  FutureOr<void> fetchDataFromHomeBloc(event, emit) {
    emit(
      TopSellerLoaded(topSeller: event.topSellerList),
    );
  }

  FutureOr<void> fetchTopSeller(event, emit) async {
    final statek = state;
    List<TopSeller> dataLoaded = await TopSellerService().fetchTopSellerList();
    if (statek is TopSellerLoaded) {
      emit(
        statek.copyWith(
          topSeller: dataLoaded,
        ),
      );
    } else {
      emit(
        TopSellerLoaded(topSeller: dataLoaded),
      );
    }
  }
}
