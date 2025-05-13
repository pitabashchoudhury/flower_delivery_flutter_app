import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phul_ecom_partner/data/static_data/static_data.dart';
import 'package:phul_ecom_partner/service/user/user_service.dart';

part 'useraddress_event.dart';
part 'useraddress_state.dart';

class UseraddressBloc extends Bloc<UseraddressEvent, UseraddressState> {
  UseraddressBloc() : super(UseraddressInitial()) {
    on<UseraddressEvent>((event, emit) {});
    on<UserAddressListEvent>(fetchUserAddressList);
  }

  FutureOr<void> fetchUserAddressList(event, emit) async {
    List<UserAddressModal> data = await UserService().fetchUserAddressList();
    emit(
      AddressLoaded(addresses: data, size: 3),
    );
  }
}
