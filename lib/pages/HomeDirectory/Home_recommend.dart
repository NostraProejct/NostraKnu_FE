import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final homesliderLists = [
  'assets/images/HomeSliderPicture_1.jpg',
  'assets/images/HomeSliderPicture_2.jpg',
  'assets/images/HomeSliderPicture_3.jpg',
  'assets/images/HomeSliderPicture_4.jpg',
  'assets/images/HomeSliderPicture_5.jpg'
];


class HomeRecommend extends StatelessWidget {
  const HomeRecommend({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Carousel Slider',
      home: CarouselWidget(),
    );
  }
}

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/HomeBackgroundPicture_1.png')
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(width: 50,height: 4.5,
              margin: EdgeInsets.fromLTRB(0, 0, 140, 25),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                ),
            ),
            CarouselSlider(
              // Set carousel controller
              carouselController: CarouselSliderController(),
              items: homesliderLists.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width, // 기기 가로사이즈 받아오기
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(url,fit:BoxFit.cover),
                        )
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(

                // Set the height of each carousel item
                height: 540,

                // Set the size of each carousel item
                // if height is not specified
                aspectRatio: 16 / 9,

                // Set how much space current item widget
                // will occupy from current page view
                viewportFraction: 0.8,

                // Set the initial page
                initialPage: 0,

                // Set carousel to repeat when reaching the end
                enableInfiniteScroll: true,

                // Set carousel to scroll in opposite direction
                reverse: false,

                // Set carousel to display next page automatically
                autoPlay: true,

                // Set the duration of which carousel slider will wait
                // in current page utill it moves on to the next
                autoPlayInterval: const Duration(seconds: 3),

                // Set the duration of carousel slider
                // scrolling to the next page
                autoPlayAnimationDuration: const Duration(milliseconds: 800),

                // Set the carousel slider animation
                autoPlayCurve: Curves.fastOutSlowIn,

                // Set the current page to be displayed
                // bigger than previous or next page
                enlargeCenterPage: true,

                // Do actions for each page change
                onPageChanged: (index, reason) {},

                // Set the scroll direction
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),

    );
  }
}
