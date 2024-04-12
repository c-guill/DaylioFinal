import 'package:daylio/common/widgets/appbar/appbar.dart';
import 'package:daylio/features/diary/views/note/add_note_page.dart';
import 'package:daylio/features/diary/views/search/search.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/image_strings.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCalendarAppBar extends StatelessWidget {
  const TCalendarAppBar({
    super.key,
    required this.darkMode,
  });

  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      leadingIcon: Image.asset(TImages.appLogoHeader, height: TSizes.iconMd),
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
          onPressed: () => Get.to(const AddNoteScreen(), arguments: null, transition: Transition.downToUp, duration: const Duration(milliseconds: 500)),
          icon: Icon(Icons.add_circle_outline, color: darkMode ? TColors.iconPrimaryDark : TColors.iconPrimaryLight, size: 24),
        ),
        IconButton(
          onPressed: () => Get.to(const SearchScreen(), transition: Transition.upToDown, duration: const Duration(milliseconds: 500)),
          icon: Icon(Icons.search, color: darkMode ? TColors.iconPrimaryDark : TColors.iconPrimaryLight, size: 24),
        ),
      ],
    );
  }
}
