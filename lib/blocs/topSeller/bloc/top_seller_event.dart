// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'top_seller_bloc.dart';

class TopSellerEvent extends Equatable {
  const TopSellerEvent();

  @override
  List<Object> get props => [];
}

class TopSellerDataEvent extends TopSellerEvent {
  const TopSellerDataEvent();

  @override
  List<Object> get props => [];
}

class TopSellerDataEventHome extends TopSellerEvent {
  final List<TopSeller> topSellerList;
  const TopSellerDataEventHome({
    required this.topSellerList,
  });

  @override
  List<Object> get props => [topSellerList];

  TopSellerDataEventHome copyWith({
    List<TopSeller>? topSellerList,
  }) {
    return TopSellerDataEventHome(
      topSellerList: topSellerList ?? this.topSellerList,
    );
  }
}
