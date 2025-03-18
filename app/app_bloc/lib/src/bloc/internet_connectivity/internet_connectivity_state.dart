part of 'internet_connectivity_controller.dart';

@freezed
sealed class InternetConnectivityControllerState
    with _$InternetConnectivityControllerState {
  const factory InternetConnectivityControllerState.init() = _Init;

  const factory InternetConnectivityControllerState.connected() = _Connected;

  const factory InternetConnectivityControllerState.disconnected() =
  _Disconnected;
}
