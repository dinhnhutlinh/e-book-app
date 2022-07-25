import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_book_app/presetations/store/controllers/trend_book_controller.dart';
import 'package:e_book_app/presetations/store/widget/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class TrendBookCarousel extends GetView<TrendBookController> {
  const TrendBookCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return controller.obx(
        (state) => Container(
              decoration: BoxDecoration(
                color: colorScheme.secondaryContainer,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          'new books'.tr,
                          style: textTheme.titleLarge!
                              .copyWith(color: colorScheme.primary),
                        ),
                      ),
                    ),
                    CarouselSlider(
                      items: controller.books
                          .map(
                            (e) => BookWidget(book: e),
                          )
                          .toList(),
                      options: CarouselOptions(
                        height: 192,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 30),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.easeIn,
                        viewportFraction: 0.3,
                        enlargeCenterPage: true,
                        // scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        onLoading: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey.withOpacity(0.2),
          child: SizedBox(
            height: 192,
            width: Get.width,
            child: const Card(margin: EdgeInsets.zero),
          ),
        ));
  }
}
