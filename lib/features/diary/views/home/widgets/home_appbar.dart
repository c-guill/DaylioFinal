import 'package:daylio/common/widgets/appbar/appbar.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/image_strings.dart';
import 'package:daylio/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
    required this.darkMode,
  });

  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      leadingIcon: Image.asset(TImages.appLogoHeader, height: 24),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.appName, style: Theme.of(context).textTheme.headlineMedium),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share_outlined, color: darkMode ? TColors.iconPrimaryDark : TColors.iconPrimaryLight, size: 24),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add_circle_outline, color: darkMode ? TColors.iconPrimaryDark : TColors.iconPrimaryLight, size: 24),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: darkMode ? TColors.iconPrimaryDark : TColors.iconPrimaryLight, size: 24),
        ),
      ],
    );
  }
}
