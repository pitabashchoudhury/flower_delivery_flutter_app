// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'useraddress_bloc.dart';

class UseraddressState extends Equatable {
  const UseraddressState();

  @override
  List<Object> get props => [];
}

class UseraddressInitial extends UseraddressState {}

class AddressLoading extends UseraddressState {
  const AddressLoading();
  @override
  List<Object> get props => [];
}

class AddressLoaded extends UseraddressState {
  final List<UserAddressModal> addresses;
  final int size;
  const AddressLoaded({
    required this.addresses,
    required this.size,
  });

  @override
  List<Object> get props => [addresses, size];

  AddressLoaded copyWith({
    List<UserAddressModal>? addresses,
    int? size,
  }) {
    return AddressLoaded(
      addresses: addresses ?? this.addresses,
      size: size ?? this.size,
    );
  }
}

class AddressError extends UseraddressState {
  final int code;
  final String message;
  const AddressError({
    required this.code,
    required this.message,
  });
  @override
  List<Object> get props => [code, message];
  AddressError copyWith({
    int? code,
    String? message,
  }) {
    return AddressError(
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }
}
