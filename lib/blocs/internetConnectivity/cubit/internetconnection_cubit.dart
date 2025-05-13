import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internetconnection_state.dart';

class InternetconnectionCubit extends Cubit<InternetconnectionState> {
  final Connectivity connectivity;
  final int k;

  late StreamSubscription connectivityStreamSubscription;
  InternetconnectionCubit(this.connectivity, this.k)
      : super(InternetconnectionInitial()) {
    bool p = true;

    monitorInternetConnection(p);
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection(bool j) {
    bool m = j;
    int count = 1;
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        if (m == true) {
          emitInternetConnected(ConnectionType.wifi, 0, count);
          m = false;
        } else {
          emitInternetConnected(ConnectionType.wifi, 1, count);
        }
      } else if (connectivityResult == ConnectivityResult.mobile) {
        if (m == true) {
          emitInternetConnected(ConnectionType.mobile, 0, count);
          m = false;
        } else {
          emitInternetConnected(ConnectionType.mobile, 1, count);
        }
      } else if (connectivityResult == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType connectionType, int r, int u) =>
      emit(InternetConnected(
          connectionType: connectionType, count: r, status: u));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();

    return super.close();
  }
}
