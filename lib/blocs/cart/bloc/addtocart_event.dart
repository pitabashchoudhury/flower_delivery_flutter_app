// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'addtocart_bloc.dart';

class AddtocartEvent extends Equatable {
  const AddtocartEvent();

  @override
  List<Object> get props => [];
}

class AddToCartData extends AddtocartEvent {
  final Carting topSeller;
  const AddToCartData({
    required this.topSeller,
  });

  @override
  List<Object> get props => [topSeller];

  AddToCartData copyWith({
    Carting? topSeller,
  }) {
    return AddToCartData(
      topSeller: topSeller ?? this.topSeller,
    );
  }
}

class RemoveFromCartData extends AddtocartEvent {
  final Carting topSeller;

  const RemoveFromCartData({
    required this.topSeller,
  });

  @override
  List<Object> get props => [topSeller];

  RemoveFromCartData copyWith({
    Carting? topSeller,
  }) {
    return RemoveFromCartData(
      topSeller: topSeller ?? this.topSeller,
    );
  }
}

class IncreaseItem extends AddtocartEvent {
  final Carting topSeller;

  const IncreaseItem({
    required this.topSeller,
  });

  @override
  List<Object> get props => [topSeller];

  IncreaseItem copyWith({
    Carting? topSeller,
  }) {
    return IncreaseItem(
      topSeller: topSeller ?? this.topSeller,
    );
  }
}

class DecreaseItem extends AddtocartEvent {
  final Carting topSeller;

  const DecreaseItem({
    required this.topSeller,
  });

  @override
  List<Object> get props => [topSeller];

  DecreaseItem copyWith({
    Carting? topSeller,
  }) {
    return DecreaseItem(
      topSeller: topSeller ?? this.topSeller,
    );
  }
}
