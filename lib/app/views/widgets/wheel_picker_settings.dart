import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheel_picker/app/state/wheel_picker/bloc.dart';
import 'package:wheel_picker/app/state/wheel_picker/state.dart';

import '../../../utils/constants/dimens.dart';
import '../../../utils/constants/strings.dart';
import '../../state/wheel_picker/event.dart';
import 'sliding_buttons.dart';

class WheelPickerSettings extends StatelessWidget {
  const WheelPickerSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WheelPickerBloc, WheelPickerState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(Dimens.padding.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SlidingButtons(
                title: Strings.wheelPicker.countText,
                options: const [10, 20, 30],
                groupValue: state.count,
                onValueChanged: (value) {
                  context.read<WheelPickerBloc>().add(
                        WheelPickerCountChanged(value!),
                      );
                },
              ),
              SizedBox(height: Dimens.spacing.medium),
              SlidingButtons(
                title: Strings.wheelPicker.stepsText,
                options: const [10, 20],
                groupValue: state.step,
                onValueChanged: (value) {
                  context.read<WheelPickerBloc>().add(
                        WheelPickerStepChanged(value!),
                      );
                },
              ),
              SizedBox(height: Dimens.spacing.medium),
              SlidingButtons(
                title: Strings.wheelPicker.multiplierText,
                options: const [1, 10],
                groupValue: state.multiplier,
                onValueChanged: (value) {
                  context.read<WheelPickerBloc>().add(
                        WheelPickerMultiplierChanged(value!),
                      );
                },
              ),
              SizedBox(height: Dimens.spacing.medium),
              Text(
                Strings.wheelPicker.spacingText.toUpperCase() +
                    ' ${state.spacing}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              CupertinoSlider(
                key: const Key('slider'),
                value: state.spacing,
                // This allows the slider to jump between divisions.
                // If null, the slide movement is continuous.
                divisions: 20,
                // The maximum slider value
                max: 0.5,
                // The minimum slider value
                min: 0.1,
                activeColor: Theme.of(context).colorScheme.primary,
                thumbColor: Theme.of(context).colorScheme.onPrimary,
                // This is called when sliding is started.
                onChangeStart: (double value) {},
                // This is called when sliding has ended.
                onChangeEnd: (double value) {},
                // This is called when slider value is changed.
                onChanged: (double value) {
                  context.read<WheelPickerBloc>().add(
                        WheelPickerSpacingChanged(value),
                      );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
