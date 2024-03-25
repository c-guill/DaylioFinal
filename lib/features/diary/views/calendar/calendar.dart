import 'package:daylio/common/styles/spacing_styles.dart';
import 'package:daylio/common/widgets/basic_widget/container.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(children: [
            // Calendar
            ContainerCustom(
              height: 150,
              child: Text('Calendar'),
            ),
            // Mood count
          ]),
        ),
      ),
    );
  }
}
