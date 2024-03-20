import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheel_picker/app/state/wheel_picker/bloc.dart';
import 'package:wheel_picker/app/state/wheel_picker/state.dart';
import 'package:wheel_picker/app/views/widgets/wheel_picker_settings.dart';
import 'package:wheel_picker/utils/constants/dimens.dart';
import 'package:wheel_slider/wheel_slider.dart';

import '../../../utils/constants/strings.dart';
import '../../state/wheel_picker/event.dart';
import '../widgets/sliding_buttons.dart';

enum Sky { midnight, viridian, cerulean }

class WheelPickerPage extends StatefulWidget {
  const WheelPickerPage({super.key});

  @override
  State<WheelPickerPage> createState() => _WheelPickerPageState();
}

class _WheelPickerPageState extends State<WheelPickerPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WheelPickerBloc(),
      child: BlocBuilder<WheelPickerBloc, WheelPickerState>(
        builder: (context, state) {
          return SafeArea(
            top: false,
            bottom: false,
            child: Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(
                        horizontal: Dimens.padding.defaultHorizontal)
                    .copyWith(
                        top: Dimens.padding.extremePadding,
                        bottom: Dimens.padding.extremePadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      Strings.wheelPicker.titleText,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: Dimens.spacing.normal),
                    Expanded(
                      child: WheelSlider(
                        pointerHeight: 100,
                        pointerColor: Theme.of(context).colorScheme.primary,
                        listHeight: double.infinity,
                        lineColor:
                            Theme.of(context).colorScheme.onSurfaceVariant,
                        background: Column(
                          children: [
                            Text(state.weight.toString()),
                          ],
                        ),
                        totalCount: state.count * state.multiplier,
                        isInfinite: false,
                        initValue: 0,
                        //itemSize: 1 * state.multiplier.toDouble(),
                        itemSize: 5,
                        squeeze: state.spacing,
                        interval: (state.count / state.step) * state.multiplier,
                        onValueChanged: (val) {
                          context.read<WheelPickerBloc>().add(
                                WheelPickerWeightChanged(val),
                              );
                          print(state.weight);
                        },
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                      ),
                    ),
                    SizedBox(height: Dimens.spacing.normal),
                    const Card(child: WheelPickerSettings())
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
