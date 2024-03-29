import 'package:daylio/common/styles/spacing_styles.dart';
import 'package:daylio/features/diary/views/settings/account/widgets/personal_data_form.dart';
import 'package:flutter/material.dart';
import 'package:daylio/utils/constants/text_strings.dart';

class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TTexts.personalDetails),
      ),
      body: const Padding(
        padding: TSpacingStyles.paddingWithAppBarHeight,
        child: PersonalDataForm(),
      ),
    );
  }
}
