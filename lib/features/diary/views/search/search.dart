import 'package:daylio/common/widgets/appbar/appbar.dart';
import 'package:daylio/features/diary/views/search/search_results.dart';
import 'package:daylio/features/diary/views/search/widgets/search_enemy_avatar.dart';
import 'package:daylio/features/diary/views/search/widgets/search_notecard.dart';
import 'package:daylio/features/diary/views/search/widgets/search_tagchip.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/constants/text_strings.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: TSizes.spaceBtwItems),

            // Header
            TAppBar(
              title: TextFormField(
                controller: TextEditingController(),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.search_favorite),
                  labelText: TTexts.search,
                ),
                onFieldSubmitted: (String value) {
                  Get.to(() => SearchResultsScreen(data: value), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 500));
                }
              ),
              actions: [
                IconButton(
                  onPressed: () => Get.close(1),
                  icon: Icon(Icons.close, color: darkMode ? TColors.iconPrimaryDark : TColors.iconPrimaryLight, size: 24),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Last notes
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('My last notes', style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: darkMode ? TColors.textDark : TColors.textLight)),
                  ),
                  Container(
                    height: 185,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        NoteCard(title: 'I hate Hinata', tags: '#sad #lost', image: 'assets/images/notes/mountain1.png'),
                        NoteCard(title: 'Feeling lost', tags: '#sad #lost', image: 'assets/images/notes/mountain2.png'),
                        NoteCard(title: 'Feeling sad', tags: '#sad #lost', image: 'assets/images/notes/mountain3.png'),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Enemies
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('My enemies', style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: darkMode ? TColors.textDark : TColors.textLight)),
                  ),
                  Container(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        EnemyAvatar(name: 'Hinata', image: 'assets/images/people/hinata.png'),
                        EnemyAvatar(name: 'Lola', image: 'assets/images/people/lola.png'),
                        EnemyAvatar(name: 'Tomoe', image: 'assets/images/people/tomoe.png'),
                        EnemyAvatar(name: 'Matt', image: 'assets/images/people/matt.png'),
                        EnemyAvatar(name: 'Noé', image: 'assets/images/people/noe.png'),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Hashtags
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('My tags', style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: darkMode ? TColors.textDark : TColors.textLight)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        TagChip(text: '#Sad'),
                        TagChip(text: '#Lost'),
                        TagChip(text: '#Music'),
                        TagChip(text: '#Happy'),
                        TagChip(text: '#Kled'),
                        TagChip(text: '#Depression'),
                        TagChip(text: '#Geography'),
                        TagChip(text: '#Vietnam'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

