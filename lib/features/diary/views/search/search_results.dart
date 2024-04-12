import 'package:daylio/common/widgets/appbar/appbar.dart';
import 'package:daylio/common/widgets/basic_widget/container.dart';
import 'package:daylio/features/diary/controllers/search/search_controller.dart';
import 'package:daylio/features/diary/views/note/widget/note.dart';
import 'package:daylio/features/diary/views/search/widgets/search_results_card.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchPageController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: TSizes.spaceBtwItems),

            // Header
            TAppBar(
              showBackArrow: true,
              title: TextFormField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.search_favorite),
                    labelText: data,
                  ),
                  enabled: false,
                  onFieldSubmitted: (String value) {
                    Get.to(() => SearchResultsScreen(data: value), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 500));
                  }
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

           Padding(padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<List<Note>>(
                    future: controller.resultsNotes(data),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text("Error: ${snapshot.error}"));
                      } else if (snapshot.hasData) {
                        List<Note> notes = snapshot.data ?? [];
                        if (notes.isEmpty) {
                          return const Center(child: Text("No results found"));
                        }
                        return SingleChildScrollView(
                          child: Column(
                            children: notes.map((note) => SearchResultsCard(note: note)).toList(),
                          ),
                        );
                      } else {
                        return const Center(child: Text("No notes found"));
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
