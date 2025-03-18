import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_bloc.dart';
import 'package:core/core.dart';

part 'internet_connectivity_state.dart';

part 'internet_connectivity_controller.freezed.dart';

class InternetConnectivityController
    extends Cubit<InternetConnectivityControllerState> {
  InternetConnectivityController(
      this._connectivity,
      this._internetConnectionChecker,
      ) : super(const InternetConnectivityControllerState.init()) {
    _init();
  }

  final Connectivity _connectivity;
  final InternetConnectionChecker _internetConnectionChecker;

  late StreamSubscription<List<ConnectivityResult>> subscription;

  Future<void> _init() async {
    subscription = _connectivity.onConnectivityChanged.listen((event) async {
      if (event.isEmpty || event.contains(ConnectivityResult.none)) {
        emit(const InternetConnectivityControllerState.disconnected());
        return;
      }
      final connectionState = await checkConnection();
      emit(connectionState);
    });
  }

  Future<InternetConnectivityControllerState> checkConnection() async {
    final hasConnection = await _internetConnectionChecker.hasConnection;
    return switch (hasConnection) {
      true => const InternetConnectivityControllerState.connected(),
      false => const InternetConnectivityControllerState.disconnected(),
    };
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
