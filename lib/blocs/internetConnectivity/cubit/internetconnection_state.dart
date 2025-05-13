part of 'internetconnection_cubit.dart';

enum ConnectionType {
  wifi,
  mobile,
}

abstract class InternetconnectionState extends Equatable {
  const InternetconnectionState();

  @override
  List<Object> get props => [];
}

class InternetconnectionInitial extends InternetconnectionState {}

class InternetConnected extends InternetconnectionState {
  final ConnectionType connectionType;
  final int count;
  final int status;

  const InternetConnected(
      {required this.connectionType,
      required this.count,
      required this.status});
  @override
  List<Object> get props => [connectionType, count, status];
}

class InternetDisconnected extends InternetconnectionState {}
