import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'userdata_event.dart';
part 'userdata_state.dart';

class UserdataBloc extends Bloc<UserdataEvent, UserdataState> {
  UserdataBloc() : super(UserdataInitial()) {
    on<UserdataEvent>((event, emit) {
      emit(UserdataInitial());
    });
    on<UserRegisterEvent>(userRegister);
  }

  FutureOr<void> userRegister(event, emit) async {
    emit(const UserLoading());
    await Future.delayed(const Duration(seconds: 5));

    emit(
      UserSession(
        name: event.name,
        email: event.email,
        mobile: event.mobile,
        userId: "1234",
        jwtToken: "244958fnfj23-29r3@idn",
      ),
    );
  }
}
