// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_screen_bloc_bloc.dart';

class HomeScreenBlocEvent extends Equatable {
  const HomeScreenBlocEvent();

  @override
  List<Object> get props => [];
}

class HomeScreenDataEvent extends HomeScreenBlocEvent {
  const HomeScreenDataEvent();

  @override
  List<Object> get props => [];
}

class HomeScreenDataEmit extends HomeScreenBlocEvent {
  final int code;
  const HomeScreenDataEmit(
    this.code,
  );

  @override
  List<Object> get props => [code];

  HomeScreenDataEmit copyWith({
    int? code,
  }) {
    return HomeScreenDataEmit(
      code ?? this.code,
    );
  }
}
