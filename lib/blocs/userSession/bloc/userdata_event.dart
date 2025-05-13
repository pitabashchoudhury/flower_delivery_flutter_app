part of 'userdata_bloc.dart';

class UserdataEvent extends Equatable {
  const UserdataEvent();

  @override
  List<Object> get props => [];
}

class UserRegisterEvent extends UserdataEvent {
  final String name;
  final String email;
  final int mobile;
  final String password;

  const UserRegisterEvent({
    required this.name,
    required this.email,
    required this.mobile,
    required this.password,
  });
  @override
  List<Object> get props => [name, email, mobile, password];

  UserRegisterEvent copyWith({
    String? name,
    String? email,
    int? mobile,
    String? password,
  }) {
    return UserRegisterEvent(
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
    );
  }
}
