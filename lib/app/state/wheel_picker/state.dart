class WheelPickerState {
  final int count;
  final int step;
  final int multiplier;
  final double spacing;
  final double weight;

  WheelPickerState({
    required this.count,
    required this.step,
    required this.multiplier,
    required this.spacing,
    required this.weight,
  });

  WheelPickerState copyWith({
    int? count,
    int? step,
    int? multiplier,
    double? spacing,
    double? weight,
  }) {
    return WheelPickerState(
      count: count ?? this.count,
      step: step ?? this.step,
      multiplier: multiplier ?? this.multiplier,
      spacing: spacing ?? this.spacing,
      weight: weight ?? this.weight,
    );
  }
}
