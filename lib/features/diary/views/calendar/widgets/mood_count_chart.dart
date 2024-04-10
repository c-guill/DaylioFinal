
//import 'package:d_chart/bar_custom/view.dart';
import 'package:daylio/common/widgets/basic_widget/container.dart';
import 'package:daylio/features/diary/controllers/calendar/calendar_controller.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TMoodChartCount extends StatelessWidget {
  const TMoodChartCount({
    super.key,
    required this.controller,
  });

  final CalendarController controller;

  @override
  Widget build(BuildContext context) {
    controller.updateSelectedMonthPage(DateTime.now());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Obx(() => ContainerCustom(
          height: TSizes.moodChartHeight,
          child: Column(
            children: [
              // Title
              Row(
                children: [
                  Text(
                    'Mood Count',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: darkMode ? TColors.textDarkTheme : TColors.textLightTheme),
                  ),
                ],
              ),/*
              AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBarCustom(
                  valueAlign: Alignment.topCenter,
                  showDomainLabel: true,
                  spaceDomainLinetoChart: TSizes.moodChartSpaceDomainLine,
                  spaceBetweenItem: TSizes.moodChartSpaceBetweenItem,
                  radiusBar: const BorderRadius.only(
                    topLeft: Radius.circular(TSizes.moodChartRadius),
                    topRight: Radius.circular(TSizes.moodChartRadius),
                  ),
                  max: 7,
                  listData: List.generate(controller.ranking.length, (index) {
                    return DChartBarDataCustom(
                      onTap: () {},
                      elevation: 8,
                      value: controller.ranking[index]['total'].toDouble(),
                      label: controller.ranking[index]['class'],
                      color: controller.chartBarColor[index],
                      // splashColor: Colors.blue,
                      showValue: true,
                      valueStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: TSizes.md, color: TColors.white),
                      labelCustom: controller.ranking[index]['class'] == 'rad'
                          ? Transform.rotate(
                              angle: 0.0,
                              child: const Image(
                                  image: AssetImage('assets/icons/emotions/rad.png'),
                                  width: TSizes.iconMd,
                                  height: TSizes.iconMd))
                          : controller.ranking[index]['class'] == 'good'
                              ? Transform.rotate(
                                  angle: 0,
                                  child: const Image(
                                      image: AssetImage('assets/icons/emotions/good.png'),
                                      width: TSizes.iconMd,
                                      height: TSizes.iconMd))
                              : controller.ranking[index]['class'] == 'meh'
                                  ? Transform.rotate(
                                      angle: 0,
                                      child: const Image(
                                          image: AssetImage('assets/icons/emotions/meh.png'),
                                          width: TSizes.iconMd,
                                          height: TSizes.iconMd))
                                  : controller.ranking[index]['class'] == 'sad'
                                      ? Transform.rotate(
                                          angle: 0,
                                          child: const Image(
                                              image: AssetImage('assets/icons/emotions/sad.png'),
                                              width: TSizes.iconMd,
                                              height: TSizes.iconMd))
                                      : controller.ranking[index]['class'] == 'awful'
                                          ? Transform.rotate(
                                              angle: 0,
                                              child: const Image(
                                                  image: AssetImage('assets/icons/emotions/awful.png'),
                                                  width: TSizes.iconMd,
                                                  height: TSizes.iconMd))
                                          : null,
                    );
                  }),
                ),
              ),*/
            ],
          ),
        ));
  }
}
