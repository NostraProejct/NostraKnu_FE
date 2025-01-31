import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nostra/home/employment/employmentController.dart';
import 'package:nostra/common/widgets/images/rounded_image.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EmploymentController());
    return Column(
      children: [
        SizedBox(
            child: Align(
              child: Container(
                decoration: BoxDecoration(
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 0.5,
                    enableInfiniteScroll: true,
                    onPageChanged: (index, _) => controller.updatePageIndicator(index),
                  ),
                  items: const [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: RoundedImage(imageUrl: 'assets/images/image1.jpg',
                        fit: BoxFit.cover, borderRadius: 5,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: RoundedImage(imageUrl: 'assets/images/image2.jpg',
                          fit: BoxFit.cover, borderRadius: 5),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: RoundedImage(imageUrl: 'assets/images/image3.jpg',
                          fit: BoxFit.cover, borderRadius: 5),
                    ),
                  ],
                ),
              ),
            )
        ),
      ],
    );
  }
}