// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_screen_bloc_bloc.dart';

class HomeScreenBlocState extends Equatable {
  const HomeScreenBlocState();

  @override
  List<Object> get props => [];
}

class HomeScreenBlocInitial extends HomeScreenBlocState {}

class HomeScreenLoading extends HomeScreenBlocState {
  const HomeScreenLoading();
  @override
  List<Object> get props => [];
}

class HomeScreenBlocLoaded extends HomeScreenBlocState {
  final bool status;
  final List<TopSeller> topSeller;
  final List<String> availableCities;
  const HomeScreenBlocLoaded(
      {required this.status,
      required this.availableCities,
      required this.topSeller});

  @override
  List<Object> get props => [status, topSeller, availableCities];

  HomeScreenBlocLoaded copyWith({
    bool? status,
    List<TopSeller>? topSeller,
    List<String>? availableCities,
  }) {
    return HomeScreenBlocLoaded(
      status: status ?? this.status,
      topSeller: topSeller ?? this.topSeller,
      availableCities: availableCities ?? this.availableCities,
    );
  }
}

class HomeScreenError extends HomeScreenBlocState {
  final int code;
  final String error;
  const HomeScreenError({
    required this.code,
    required this.error,
  });

  @override
  List<Object> get props => [code, error];

  HomeScreenError copyWith({
    int? code,
    String? error,
  }) {
    return HomeScreenError(
      code: code ?? this.code,
      error: error ?? this.error,
    );
  }
}
