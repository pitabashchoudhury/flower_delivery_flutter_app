// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'useraddress_bloc.dart';

class UseraddressEvent extends Equatable {
  const UseraddressEvent();

  @override
  List<Object> get props => [];
}

class UserAddressListEvent extends UseraddressEvent {
  final String userid;
  const UserAddressListEvent({
    required this.userid,
  });
}
