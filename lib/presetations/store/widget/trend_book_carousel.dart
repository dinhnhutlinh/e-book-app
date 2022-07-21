import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_book_app/presetations/store/controllers/trend_book_controller.dart';
import 'package:e_book_app/presetations/store/widget/book_widget.dart';
import 'package:e_book_app/utils/custom_color.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TrenBookCarousel extends GetView<TrendBookController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Container(
              color: Theme.of(context)
                  .extension<CustomColors>()!
                  .customcolor1Container,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: CarouselSlider(
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
                      viewportFraction: 0.4,
                      enlargeCenterPage: true,
                      // scrollDirection: Axis.horizontal,
                    )),
              ),
            ),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ));
  }
}
