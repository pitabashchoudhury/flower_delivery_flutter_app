// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'addtocart_bloc.dart';

class AddtocartState extends Equatable {
  const AddtocartState();

  @override
  List<Object> get props => [];
}

class AddtocartInitial extends AddtocartState {}

class Addtocart extends AddtocartState {
  final List<Carting> items;
  final bool move;
  const Addtocart({required this.items, required this.move});
  @override
  List<Object> get props => [items, move];

  Addtocart copyWith({
    List<Carting>? items,
    bool? move,
  }) {
    return Addtocart(
      items: items ?? this.items,
      move: move ?? this.move,
    );
  }
}
