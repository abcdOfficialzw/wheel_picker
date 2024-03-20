abstract class WheelPickerEvent {}

class WheelPickerCountChanged extends WheelPickerEvent {
  final int count;

  WheelPickerCountChanged(this.count);
}

class WheelPickerStepChanged extends WheelPickerEvent {
  final int step;

  WheelPickerStepChanged(this.step);
}

class WheelPickerMultiplierChanged extends WheelPickerEvent {
  final int multiplier;

  WheelPickerMultiplierChanged(this.multiplier);
}

class WheelPickerSpacingChanged extends WheelPickerEvent {
  final double spacing;

  WheelPickerSpacingChanged(this.spacing);
}

class WheelPickerWeightChanged extends WheelPickerEvent {
  final double weight;

  WheelPickerWeightChanged(this.weight);
}
