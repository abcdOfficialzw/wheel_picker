import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/dimens.dart';
import '../../../utils/constants/strings.dart';

class SlidingButtons extends StatelessWidget {
  const SlidingButtons({
    super.key,
    required this.options,
    required this.onValueChanged,
    required this.title,
    this.groupValue,
  });

  final String title;
  final List<int> options;
  final void Function(int?) onValueChanged;
  final int? groupValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase() + ' ${groupValue}',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
        SizedBox(height: Dimens.spacing.small),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(Dimens.padding.small),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.onPrimary),
          child: CupertinoSlidingSegmentedControl(
              groupValue: groupValue ?? 10,
              thumbColor: Theme.of(context).colorScheme.onPrimary,
              children: <int, Widget>{
                for (var i = 0; i < options.length; i++)
                  options[i]: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimens.padding.small),
                    child: Text(options[i].toString()),
                  ),
              },
              onValueChanged: onValueChanged),
        ),
      ],
    );
  }
}
