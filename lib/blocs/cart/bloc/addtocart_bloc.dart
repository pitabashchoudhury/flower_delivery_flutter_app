import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phul_ecom_partner/data/model/add_cart_model.dart';
part 'addtocart_event.dart';
part 'addtocart_state.dart';

class AddtocartBloc extends Bloc<AddtocartEvent, AddtocartState> {
  AddtocartBloc() : super(const Addtocart(items: [], move: false)) {
    on<AddToCartData>(addToCartData);
    on<RemoveFromCartData>(removeToCartData);
    on<IncreaseItem>(increaseItem);
    on<DecreaseItem>(decreaseItem);
  }

  FutureOr<void> decreaseItem(event, emit) {
    final s = state;
    List<Carting> u = [];
    if (s is Addtocart) {
      if (s.items.isNotEmpty) {
        u = s.items.map((e) {
          if (e.id == event.topSeller.id) {
            return Carting(
              id: e.id,
              title: e.title,
              price: e.price,
              ratings: e.ratings,
              image: e.image,
              size: e.size - 1,
              totalAmount: e.totalAmount - (int.parse(e.price)),
            );
          } else {
            return e;
          }
        }).toList();
      } else {}
    } else {}
    emit(Addtocart(items: u, move: false));
  }

  FutureOr<void> increaseItem(event, emit) {
    final s = state;
    List<Carting> u = [];
    if (s is Addtocart) {
      if (s.items.isNotEmpty) {
        u = s.items.map((e) {
          if (e.id == event.topSeller.id) {
            return Carting(
              id: e.id,
              title: e.title,
              price: e.price,
              ratings: e.ratings,
              image: e.image,
              size: e.size + 1,
              totalAmount: e.totalAmount + (int.parse(e.price)),
            );
          } else {
            return e;
          }
        }).toList();
      } else {}
      emit(s.copyWith(items: u, move: false));
    } else {}

    //emit(Addtocart(items: u, move: false));
  }

  FutureOr<void> addToCartData(event, emit) {
    final s = state;
    List<Carting> u = [];
    if (s is Addtocart) {
      // u = List.from(s.items)..add(event.topSeller);
      if (s.items.isEmpty) {
        u.add(event.topSeller);
      } else {
        for (var element in s.items) {
          if (element.id == event.topSeller.id) {
            // u = List.from(s.items)..add(event.topSeller);
            u = List.from(s.items);
            break;
            //emit(Addtocart(items: u, move: true));
          } else {
            u = List.from(s.items)..add(event.topSeller);
            //emit(Addtocart(items: u, move: false));
          }
        }
      }
      // u = List.from(s.items)..add(event.topSeller);

    }
    emit(Addtocart(items: u, move: true));
  }

  FutureOr<void> removeToCartData(event, emit) {
    final s = state;
    List<Carting> u = [];
    if (s is Addtocart) {
      // u = List.from(s.items)..add(event.topSeller);
      // if (s.items.isEmpty) {
      //   //. u.add(event.topSeller);
      // } else {
      //   u = List.from(s.items)..remove(event.topSeller);
      // }
      // u = List.from(s.items)..remove(event.topSeller);

      for (int i = 0; i < s.items.length; i++) {
        if (s.items[i].id == event.topSeller.id) {
        } else {
          u.add(s.items[i]);
        }
      }
    }
    emit(Addtocart(items: u, move: false));
  }
}
