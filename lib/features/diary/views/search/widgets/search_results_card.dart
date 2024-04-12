import 'package:daylio/common/widgets/basic_widget/container.dart';
import 'package:daylio/features/diary/controllers/search/search_controller.dart';
import 'package:daylio/features/diary/views/note/widget/firebase_storage_services.dart';
import 'package:daylio/features/diary/views/note/widget/note.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchResultsCard extends StatelessWidget {
  SearchResultsCard({super.key, required this.note});

  final Note note;
  final Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchPageController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          children: [
            const Image(
              image: AssetImage('assets/images/notes/Maple.png'),
              width: TSizes.iconMd,
              height: TSizes.iconMd,
            ),
            const SizedBox(width: 8),
            Text(DateFormat('dd MMMM yyyy').format(note.date),
                style: const TextStyle(fontSize: TSizes.fontSizeSm)),
          ],
        ),
        ContainerCustom(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: TSizes.lg),
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(width: TSizes.xs),
                          Column(
                            children: [
                              circleEmotion(
                                  'assets/icons/emotions/${controller.emotionsImagePaths[note.emotion - 1]}.png'),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.emotionsImagePaths[note.emotion - 1],
                                    style: TextStyle(
                                      color: controller.chartBarColor[note.emotion - 1],
                                      fontWeight: FontWeight.bold,
                                      fontSize: TSizes.fontSizeLg,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('HH:mm').format(note.date), // Assuming this is the time
                                    style:
                                    TextStyle(color: darkMode ? TColors.white.withOpacity(0.5) : TColors.dark.withOpacity(0.5), fontSize: TSizes.fontSizeMd),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(width: TSizes.xl),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.cloud, color: Colors.blue),
                                  SizedBox(width: 8),
                                  Icon(Icons.star, color: Colors.yellow),
                                  SizedBox(width: 8),
                                  Icon(Icons.run_circle, color: Colors.red),
                                  SizedBox(width: 8),
                                  Icon(Icons.directions_walk, color: Colors.green),
                                ],
                              ),
                              const SizedBox(height: TSizes.md),
                              SizedBox(
                                width: THelperFunctions.screenWidth() - 2 * TSizes.defaultSpace - 130,
                                child: Text(
                                  note.text,
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: darkMode ? TColors.white.withOpacity(0.5) : TColors.black.withOpacity(0.6)),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: note.image.map((image) {
                                  return imageOfNotes(image, note.date);
                                }).toList(),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Positioned(
                        top: 0, // Top position
                        bottom: 0, // Bottom position to stretch the line vertically
                        left: 70,
                        child: Container(
                          width: 1.0, // Line thickness
                          color: darkMode ? TColors.white.withOpacity(0.5) : TColors.black.withOpacity(0.2),
                        ),
                      ),

                      Positioned(
                        right: -10,
                        top: -10,
                        child: buildPopupMenuButton(context, note),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }

  PopupMenuButton<String> buildPopupMenuButton(context, Note note) {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        // Handle the action based on the selected value
        print('Selected: $value ${note.id}');
        switch (value) {
          case 'Edit':
            // No handle for edit action in search page
            break;
          case 'Share':
            // No handle for share action in search page
            break;
          case 'Delete':
            // No handle for delete action in search page
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'Edit',
          child: Text('Edit'),
        ),
        const PopupMenuItem<String>(
          value: 'Share',
          child: Text('Share'),
        ),
        const PopupMenuItem<String>(
          value: 'Delete',
          child: Text('Delete'),
        ),
      ],
      icon: const Icon(Icons.more_vert),
      color: THelperFunctions.isDarkMode(context) ? TColors.black : Colors.white,
    );
  }

  Widget imageOfNotes(String image, DateTime dateTime) {
    return FutureBuilder(
        future: Get.put(SearchPageController()).storage.downloadURL(image, dateTime),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(snapshot.data!),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: NetworkImage(snapshot.data!), fit: BoxFit.cover),
                  ),
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return Container();
        });
  }

  Container circleEmotion(String image) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(image),
        ),
      ),
    );
  }
}