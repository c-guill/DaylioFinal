import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:daylio/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TCalendarDropDown extends StatelessWidget {
  final bool darkMode;
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  final bool mode; // mode 0: monthYear, mode 1: date

  const TCalendarDropDown({
    super.key,
    required this.darkMode,
    required this.selectedDate,
    required this.onDateSelected,
    required this.mode,
  });

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Container(
          height: TSizes.datePickerHeight,
          padding: const EdgeInsets.only(top: TSizes.sm),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(TSizes.datePickerBorderRadius),
            border: Border.all(
              color: TColors.grey,
              width: TSizes.datePickerBorderWidth,
            ),
          ),
          child: SafeArea(
            top: false,
            child: CupertinoDatePicker(
              mode: mode ? CupertinoDatePickerMode.date : CupertinoDatePickerMode.monthYear,
              initialDateTime: selectedDate,
              minimumYear: 2000,
              maximumYear: 2100,
              onDateTimeChanged: (newDate) {
                onDateSelected(newDate);
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Title
        Transform.translate(
          offset: const Offset(10.0, 0.0), // Adjust the offset value to bring the title closer to the leading icon
          child: Text(
            THelperFunctions.getMonthYear(selectedDate),
            style: darkMode ? TTextTheme.darkTextTheme.titleLarge : TTextTheme.lightTextTheme.titleLarge,
          ),
        ),

        IconButton(
          onPressed: () => _showDatePicker(context),
          icon: const Icon(Icons.arrow_drop_down, size: TSizes.lg),
        ),
      ],
    );
  }
}