// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'top_seller_bloc.dart';

class TopSellerState extends Equatable {
  const TopSellerState();

  @override
  List<Object> get props => [];
}

class TopSellerInitial extends TopSellerState {}

class TopSellerLoading extends TopSellerState {
  const TopSellerLoading();
  @override
  List<Object> get props => [];
}

class TopSellerLoaded extends TopSellerState {
  final List<TopSeller> topSeller;
  const TopSellerLoaded({
    required this.topSeller,
  });

  @override
  List<Object> get props => [topSeller];

  TopSellerLoaded copyWith({
    List<TopSeller>? topSeller,
  }) {
    return TopSellerLoaded(
      topSeller: topSeller ?? this.topSeller,
    );
  }
}

class TopSellerError extends TopSellerState {
  final int code;
  final String error;
  const TopSellerError({
    required this.code,
    required this.error,
  });

  @override
  List<Object> get props => [code, error];

  TopSellerError copyWith({
    int? code,
    String? error,
  }) {
    return TopSellerError(
      code: code ?? this.code,
      error: error ?? this.error,
    );
  }
}
