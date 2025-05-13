part of 'userdata_bloc.dart';

class UserdataState extends Equatable {
  const UserdataState();

  @override
  List<Object> get props => [];
}

class UserdataInitial extends UserdataState {}

class UserSession extends UserdataState {
  final String name;
  final String email;
  final int mobile;
  final String userId;
  final String jwtToken;

  const UserSession({
    required this.name,
    required this.email,
    required this.mobile,
    required this.userId,
    required this.jwtToken,
  });
  @override
  List<Object> get props => [name, email, mobile, userId, jwtToken];

  UserSession copyWith({
    String? name,
    String? email,
    int? mobile,
    String? userId,
    String? jwtToken,
  }) {
    return UserSession(
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      userId: userId ?? this.userId,
      jwtToken: jwtToken ?? this.jwtToken,
    );
  }
}

class UserError extends UserdataState {
  final int code;
  final String message;
  const UserError({
    required this.code,
    required this.message,
  });

  @override
  List<Object> get props => [code, message];

  UserError copyWith({int? code, String? message}) {
    return UserError(
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }
}

class UserLoading extends UserdataState {
  const UserLoading();
}
