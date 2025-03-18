// navigation_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class NavigationEvent {}

class UpdateTabIndex extends NavigationEvent {
  final int index;
  UpdateTabIndex(this.index);
}

// States
class NavigationState {
  final int currentIndex;

  NavigationState(this.currentIndex);
}

// BLoC
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(0)) {
    on<UpdateTabIndex>((event, emit) {
      emit(NavigationState(event.index));
    });
  }
}