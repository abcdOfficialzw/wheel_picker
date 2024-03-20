import 'package:flutter_bloc/flutter_bloc.dart';
import 'event.dart';
import 'state.dart';

class WheelPickerBloc extends Bloc<WheelPickerEvent, WheelPickerState> {
  WheelPickerBloc()
      : super(WheelPickerState(
            count: 10, step: 10, multiplier: 1, spacing: 0.1, weight: 0)) {
    on<WheelPickerCountChanged>((event, emit) {
      emit(state.copyWith(count: event.count));
    });

    on<WheelPickerStepChanged>((event, emit) {
      emit(state.copyWith(step: event.step));
    });

    on<WheelPickerMultiplierChanged>((event, emit) {
      emit(state.copyWith(multiplier: event.multiplier));
    });

    on<WheelPickerSpacingChanged>((event, emit) {
      emit(state.copyWith(spacing: event.spacing));
    });

    on<WheelPickerWeightChanged>((event, emit) {
      emit(state.copyWith(weight: event.weight));
    });
  }
}
